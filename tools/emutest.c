/*
 * emutest: run one or two GBA ROMs in lockstep in libmgba (headless) with the
 * same scripted inputs, and compare what they do frame by frame.
 *
 *   emutest [options] ROM_A [ROM_B]
 *     -p PLAN     input plan (tools/emutest.py compiles tests/inputs/NAME.txt
 *                 into it): "frames N", "keys FRAME MASK", "shot FRAME NAME",
 *                 "sram PATH" (a save memory image both ROMs start with)
 *     -o DIR      output directory (PNGs, memory dumps)
 *     -m MAP      B->A address map for ROM pointers in B's RAM: lines
 *                 "B_START B_END DELTA" (hex); a word of B's EWRAM/IWRAM in
 *                 [B_START, B_END) also matches A's word + DELTA
 *     -l LOG      per-frame log: frame, keys, video/audio/memory hashes
 *     -d N        dump PNGs of the first N frames whose pictures differ
 *     -s N        stop N frames after the first divergence (default: run on)
 *     -e N        also save a PNG of A every N frames (script development)
 *     -D 1        also save A's memory at every checkpoint (NAME_A.ewram.bin...)
 *
 * Output on stdout is line-oriented ("key value ..."), read by emutest.py.
 * Each run starts from power-on with mGBA's HLE BIOS (no BIOS file), empty
 * save memory (no .sav is read or written) unless the plan names an image
 * (tools/mksave.py makes them; it is copied into memory, never written back),
 * no RTC and the user's mGBA config ignored, so it is deterministic.
 *
 * mGBA (libmgba) is MPL-2.0 and is linked, not vendored.
 */
#include <mgba/core/core.h>
#include <mgba/core/config.h>
#include <mgba/core/log.h>
#include <mgba/core/blip_buf.h>
#include <mgba/gba/core.h>
#include <mgba-util/vfs.h>

#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zlib.h>

#define W 240
#define H 160

/* mGBA memory block ids (GBA regions) */
enum { R_EWRAM = 2, R_IWRAM = 3, R_PAL = 5, R_VRAM = 6, R_OAM = 7 };
static const struct { int id; const char *name; uint32_t base; } regions[] = {
	{ R_EWRAM, "ewram", 0x02000000 },
	{ R_IWRAM, "iwram", 0x03000000 },
	{ R_PAL, "pal", 0x05000000 },
	{ R_VRAM, "vram", 0x06000000 },
	{ R_OAM, "oam", 0x07000000 },
};
#define NREG (sizeof(regions) / sizeof(regions[0]))

struct emu {
	struct mCore *core;
	color_t *fb;
	int16_t *audio;
	size_t audioLen;
	const char *path;
};

static void quietLog(struct mLogger *l, int cat, enum mLogLevel lvl, const char *fmt, va_list ap)
{
	(void)l; (void)cat; (void)lvl; (void)fmt; (void)ap;
}
static struct mLogger quiet = { .log = quietLog };

static void die(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	fprintf(stderr, "emutest: ");
	vfprintf(stderr, fmt, ap);
	fprintf(stderr, "\n");
	va_end(ap);
	exit(2);
}

static void *sramImage;
static size_t sramSize;

static void emuOpen(struct emu *e, const char *path)
{
	e->path = path;
	e->core = GBACoreCreate();
	if (!e->core || !e->core->init(e->core))
		die("can't create an mGBA core");
	/* Defaults only: never read the user's mGBA config file. */
	mCoreInitConfig(e->core, NULL);
	mCoreConfigSetDefaultIntValue(&e->core->config, "useBios", 0);
	mCoreConfigSetDefaultIntValue(&e->core->config, "skipBios", 1);
	mCoreConfigSetDefaultValue(&e->core->config, "idleOptimization", "ignore");
	mCoreConfigSetDefaultIntValue(&e->core->config, "sampleRate", 32768);
	mCoreLoadForeignConfig(e->core, &e->core->config);
	e->fb = calloc(W * H, sizeof(color_t));
	e->core->setVideoBuffer(e->core, e->fb, W);
	e->core->setAudioBufferSize(e->core, 4096);
	e->audio = malloc(sizeof(int16_t) * 2 * 8192);
	struct VFile *vf = VFileOpen(path, O_RDONLY);
	if (!vf)
		die("can't open %s", path);
	if (!e->core->loadROM(e->core, vf))
		die("can't load %s", path);
	/* Save memory starts blank (0xFF) in memory every run, or as a copy of
	 * the plan's image (a memory VFile: nothing is written to disk). */
	if (sramImage && !e->core->loadSave(e->core, VFileMemChunk(sramImage, sramSize)))
		die("can't load the save image");
	e->core->reset(e->core);
}

static uint64_t fnv(uint64_t h, const void *p, size_t n)
{
	const uint8_t *b = p;
	for (size_t i = 0; i < n; i++) {
		h ^= b[i];
		h *= 0x100000001b3ULL;
	}
	return h;
}
#define FNV0 0xcbf29ce484222325ULL

/* Framebuffer as packed RGB (mGBA's 32-bit color is XBGR8, R in the low byte). */
static void rgb(const struct emu *e, uint8_t *out)
{
	for (int i = 0; i < W * H; i++) {
		uint32_t c = e->fb[i];
		out[i * 3 + 0] = c & 0xFF;
		out[i * 3 + 1] = (c >> 8) & 0xFF;
		out[i * 3 + 2] = (c >> 16) & 0xFF;
	}
}

static void runFrame(struct emu *e, uint32_t keys)
{
	e->core->setKeys(e->core, keys);
	e->core->runFrame(e->core);
	/* Drain the audio so the buffer never fills, and keep it for hashing. */
	blip_t *l = e->core->getAudioChannel(e->core, 0);
	blip_t *r = e->core->getAudioChannel(e->core, 1);
	int n = blip_samples_avail(l);
	if (n > 8192)
		n = 8192;
	blip_read_samples(l, e->audio, n, 1);
	blip_read_samples(r, e->audio + 1, n, 1);
	e->audioLen = (size_t)n * 2;
}

static void *block(struct emu *e, int id, size_t *size)
{
	void *p = e->core->getMemoryBlock(e->core, id, size);
	if (!p)
		die("no memory block %d", id);
	return p;
}

/* ---- PNG (zlib) ---- */
static void pngChunk(FILE *f, const char *type, const uint8_t *data, uint32_t len)
{
	uint8_t hdr[8] = { len >> 24, len >> 16, len >> 8, len, type[0], type[1], type[2], type[3] };
	fwrite(hdr, 1, 8, f);
	if (len)
		fwrite(data, 1, len, f);
	uLong crc = crc32(0, hdr + 4, 4);
	if (len)
		crc = crc32(crc, data, len);
	uint8_t c[4] = { crc >> 24, crc >> 16, crc >> 8, crc };
	fwrite(c, 1, 4, f);
}

static void writePng(const char *path, const uint8_t *rgbBuf, int w, int h)
{
	FILE *f = fopen(path, "wb");
	if (!f)
		die("can't write %s", path);
	static const uint8_t sig[8] = { 137, 80, 78, 71, 13, 10, 26, 10 };
	fwrite(sig, 1, 8, f);
	uint8_t ihdr[13] = { 0, 0, w >> 8, w, 0, 0, h >> 8, h, 8, 2, 0, 0, 0 };
	pngChunk(f, "IHDR", ihdr, 13);
	size_t rawLen = (size_t)h * (w * 3 + 1);
	uint8_t *raw = malloc(rawLen);
	for (int y = 0; y < h; y++) {
		raw[y * (w * 3 + 1)] = 0;
		memcpy(raw + y * (w * 3 + 1) + 1, rgbBuf + y * w * 3, w * 3);
	}
	uLongf zLen = compressBound(rawLen);
	uint8_t *z = malloc(zLen);
	compress2(z, &zLen, raw, rawLen, 6);
	pngChunk(f, "IDAT", z, zLen);
	pngChunk(f, "IEND", NULL, 0);
	fclose(f);
	free(raw);
	free(z);
}

static void savePng(struct emu *e, const char *dir, const char *name)
{
	static uint8_t buf[W * H * 3];
	char path[4096];
	rgb(e, buf);
	snprintf(path, sizeof path, "%s/%s.png", dir, name);
	writePng(path, buf, W, H);
}

/* A and B side by side, with the differing pixels of B marked in a third panel. */
static void saveSideBySide(struct emu *a, struct emu *b, const char *dir, const char *name)
{
	static uint8_t ra[W * H * 3], rb[W * H * 3];
	int ow = W * 3 + 8;
	uint8_t *o = calloc((size_t)ow * H * 3, 1);
	rgb(a, ra);
	rgb(b, rb);
	for (int y = 0; y < H; y++)
		for (int x = 0; x < W; x++) {
			uint8_t *pa = ra + (y * W + x) * 3, *pb = rb + (y * W + x) * 3;
			memcpy(o + (y * ow + x) * 3, pa, 3);
			memcpy(o + (y * ow + W + 4 + x) * 3, pb, 3);
			uint8_t *pd = o + (y * ow + 2 * W + 8 + x) * 3;
			if (memcmp(pa, pb, 3)) {
				pd[0] = 255; pd[1] = 0; pd[2] = 255;
			} else {
				pd[0] = pd[1] = pd[2] = (pa[0] + pa[1] + pa[2]) / 12;
			}
		}
	char path[4096];
	snprintf(path, sizeof path, "%s/%s.png", dir, name);
	writePng(path, o, ow, H);
	free(o);
}

static void dumpMemory(struct emu *e, const char *dir, const char *tag)
{
	for (size_t i = 0; i < NREG; i++) {
		size_t size;
		void *p = block(e, regions[i].id, &size);
		char path[4096];
		snprintf(path, sizeof path, "%s/%s.%s.bin", dir, tag, regions[i].name);
		FILE *f = fopen(path, "wb");
		if (!f)
			die("can't write %s", path);
		fwrite(p, 1, size, f);
		fclose(f);
	}
}

/* ---- B->A pointer map ---- */
struct seg { uint32_t lo, hi; int32_t delta; };
static struct seg *segs;
static size_t nsegs;

static void loadMap(const char *path)
{
	FILE *f = fopen(path, "r");
	if (!f)
		die("can't open %s", path);
	size_t cap = 64;
	segs = malloc(cap * sizeof *segs);
	unsigned lo, hi;
	int delta;
	char line[256];
	while (fgets(line, sizeof line, f)) {
		if (sscanf(line, "%x %x %d", &lo, &hi, &delta) != 3)
			continue;
		if (nsegs == cap)
			segs = realloc(segs, (cap *= 2) * sizeof *segs);
		segs[nsegs++] = (struct seg){ lo, hi, delta };
	}
	fclose(f);
}

static uint32_t mapWord(uint32_t w)
{
	if (w < 0x08000000 || w >= 0x0A000000 || !nsegs)
		return w;
	size_t lo = 0, hi = nsegs;
	while (lo < hi) {
		size_t mid = (lo + hi) / 2;
		if (segs[mid].hi <= w)
			lo = mid + 1;
		else
			hi = mid;
	}
	if (lo < nsegs && segs[lo].lo <= w)
		return w + segs[lo].delta;
	return w;
}

/* ---- plan ---- */
struct keyev { uint32_t frame, mask; };
struct shot { uint32_t frame; char name[128]; };
static struct keyev *keyevs;
static size_t nkeyevs;
static struct shot *shots;
static size_t nshots;
static uint32_t nframes;

static void loadPlan(const char *path)
{
	FILE *f = fopen(path, "r");
	if (!f)
		die("can't open %s", path);
	char line[512];
	size_t kcap = 256, scap = 64;
	keyevs = malloc(kcap * sizeof *keyevs);
	shots = malloc(scap * sizeof *shots);
	while (fgets(line, sizeof line, f)) {
		unsigned a, b;
		char name[128];
		if (sscanf(line, "frames %u", &a) == 1)
			nframes = a;
		else if (sscanf(line, "keys %u %x", &a, &b) == 2) {
			if (nkeyevs == kcap)
				keyevs = realloc(keyevs, (kcap *= 2) * sizeof *keyevs);
			keyevs[nkeyevs++] = (struct keyev){ a, b };
		} else if (!strncmp(line, "sram ", 5)) {
			char *p = line + 5;
			p[strcspn(p, "\r\n")] = 0;
			FILE *s = fopen(p, "rb");
			if (!s)
				die("can't open %s", p);
			fseek(s, 0, SEEK_END);
			sramSize = ftell(s);
			fseek(s, 0, SEEK_SET);
			sramImage = malloc(sramSize);
			if (fread(sramImage, 1, sramSize, s) != sramSize)
				die("can't read %s", p);
			fclose(s);
		} else if (sscanf(line, "shot %u %127s", &a, name) == 2) {
			if (nshots == scap)
				shots = realloc(shots, (scap *= 2) * sizeof *shots);
			shots[nshots].frame = a;
			strcpy(shots[nshots].name, name);
			nshots++;
		}
	}
	fclose(f);
}

/* ---- comparison ---- */

/* Differences in one memory region; B's RAM words are mapped with mapWord.
 * Prints up to `show` differing words (only when show > 0). Returns the count. */
static size_t diffRegion(struct emu *a, struct emu *b, size_t r, int show)
{
	size_t sa, sb;
	uint32_t *pa = block(a, regions[r].id, &sa);
	uint32_t *pb = block(b, regions[r].id, &sb);
	int ram = regions[r].id == R_EWRAM || regions[r].id == R_IWRAM;
	size_t n = (sa < sb ? sa : sb) / 4, count = 0;
	if (!ram && !memcmp(pa, pb, n * 4))
		return 0;
	for (size_t i = 0; i < n; i++) {
		/* equal as is, or as a moved ROM address (RAM also holds code
		 * copied from ROM, whose words can look like data addresses) */
		uint32_t wb = ram ? mapWord(pb[i]) : pb[i];
		if (pa[i] == pb[i] || pa[i] == wb)
			continue;
		if (show > 0 && count < (size_t)show)
			printf("memdiff %s %08X %08X %08X %08X\n", regions[r].name,
			       (unsigned)(regions[r].base + i * 4), pa[i], pb[i], wb);
		count++;
	}
	return count;
}

static uint64_t hashRegions(struct emu *e)
{
	uint64_t h = FNV0;
	for (size_t r = 0; r < NREG; r++) {
		size_t size;
		void *p = block(e, regions[r].id, &size);
		h = fnv(h, p, size);
	}
	return h;
}

static uint64_t hashVideo(struct emu *e)
{
	uint64_t h = FNV0;
	for (int i = 0; i < W * H; i++) {
		uint32_t c = e->fb[i] & 0xFFFFFF;
		h = fnv(h, &c, 4);
	}
	return h;
}

static int videoEqual(struct emu *a, struct emu *b)
{
	for (int i = 0; i < W * H; i++)
		if ((a->fb[i] ^ b->fb[i]) & 0xFFFFFF)
			return 0;
	return 1;
}

static void usage(void)
{
	fprintf(stderr, "usage: emutest -p PLAN -o DIR [-m MAP] [-l LOG] [-d N] [-s N] [-e N] [-D 1] ROM_A [ROM_B]\n");
	exit(2);
}

int main(int argc, char **argv)
{
	const char *plan = NULL, *out = NULL, *map = NULL, *logPath = NULL;
	long dumpDiffs = 4, stopAfter = -1, every = 0, dumpShots = 0;
	int i;
	for (i = 1; i < argc && argv[i][0] == '-'; i++) {
		if (i + 1 >= argc)
			usage();
		switch (argv[i][1]) {
		case 'p': plan = argv[++i]; break;
		case 'o': out = argv[++i]; break;
		case 'm': map = argv[++i]; break;
		case 'l': logPath = argv[++i]; break;
		case 'd': dumpDiffs = atol(argv[++i]); break;
		case 's': stopAfter = atol(argv[++i]); break;
		case 'e': every = atol(argv[++i]); break;
		case 'D': dumpShots = atol(argv[++i]); break;
		default: usage();
		}
	}
	if (!plan || !out || argc - i < 1 || argc - i > 2)
		usage();

	mLogSetDefaultLogger(&quiet);
	loadPlan(plan);
	if (map)
		loadMap(map);

	struct emu a = { 0 }, b = { 0 };
	int two = argc - i == 2;
	emuOpen(&a, argv[i]);
	if (two)
		emuOpen(&b, argv[i + 1]);

	FILE *log = logPath ? fopen(logPath, "w") : NULL;
	size_t ki = 0, si = 0;
	uint32_t keys = 0;
	long firstVideo = -1, firstMem[2] = { -1, -1 }, firstAudio = -1;
	long videoFrames = 0, memFrames[2] = { 0, 0 }, audioFrames = 0, dumped = 0;
	long runStart = -1; /* current run of differing frames, for "range" lines */
	char name[256];

	for (uint32_t frame = 0; frame < nframes; frame++) {
		while (ki < nkeyevs && keyevs[ki].frame <= frame)
			keys = keyevs[ki++].mask;
		runFrame(&a, keys);
		if (two)
			runFrame(&b, keys);

		if (log) {
			fprintf(log, "%u %03X %016llx %016llx", frame, keys,
			        (unsigned long long)hashVideo(&a),
			        (unsigned long long)fnv(FNV0, a.audio, a.audioLen * 2));
			if (two)
				fprintf(log, " %016llx %016llx", (unsigned long long)hashVideo(&b),
				        (unsigned long long)fnv(FNV0, b.audio, b.audioLen * 2));
			fprintf(log, "\n");
		}

		int vdiff = 0;
		if (two) {
			vdiff = !videoEqual(&a, &b);
			int adiff = a.audioLen != b.audioLen || memcmp(a.audio, b.audio, a.audioLen * 2);
			if (adiff) {
				audioFrames++;
				if (firstAudio < 0) {
					firstAudio = frame;
					printf("first_audio_diff %u\n", frame);
				}
			}
			/* kind 0: EWRAM/IWRAM (game state), kind 1: palette/VRAM/OAM */
			for (int kind = 0; kind < 2; kind++) {
				size_t mdiff = 0;
				for (size_t r = 0; r < NREG && !mdiff; r++)
					if ((regions[r].base >= 0x05000000) == kind)
						mdiff = diffRegion(&a, &b, r, 0);
				if (!mdiff)
					continue;
				memFrames[kind]++;
				if (firstMem[kind] >= 0)
					continue;
				firstMem[kind] = frame;
				printf("first_%s_diff %u\n", kind ? "vmem" : "ram", frame);
				for (size_t r = 0; r < NREG; r++) {
					if ((regions[r].base >= 0x05000000) != kind)
						continue;
					size_t c = diffRegion(&a, &b, r, 32);
					if (c)
						printf("memdiff_count %s %zu\n", regions[r].name, c);
				}
				snprintf(name, sizeof name, "memdiff_%06u_A", frame);
				dumpMemory(&a, out, name);
				snprintf(name, sizeof name, "memdiff_%06u_B", frame);
				dumpMemory(&b, out, name);
				/* the picture is often still the same here */
				snprintf(name, sizeof name, "memdiff_%06u", frame);
				saveSideBySide(&a, &b, out, name);
			}
			if (vdiff) {
				videoFrames++;
				if (runStart < 0)
					runStart = frame;
				if (firstVideo < 0) {
					firstVideo = frame;
					printf("first_video_diff %u\n", frame);
					snprintf(name, sizeof name, "videodiff_%06u_A", frame);
					dumpMemory(&a, out, name);
					snprintf(name, sizeof name, "videodiff_%06u_B", frame);
					dumpMemory(&b, out, name);
				}
				if (dumped < dumpDiffs) {
					snprintf(name, sizeof name, "videodiff_%06u", frame);
					saveSideBySide(&a, &b, out, name);
					printf("png %s/%s.png\n", out, name);
					dumped++;
				}
			} else if (runStart >= 0) {
				printf("video_diff_range %ld %u\n", runStart, frame - 1);
				runStart = -1;
			}
		}

		while (si < nshots && shots[si].frame <= frame) {
			if (shots[si].frame == frame) {
				savePng(&a, out, shots[si].name);
				if (dumpShots) {
					snprintf(name, sizeof name, "%s_A", shots[si].name);
					dumpMemory(&a, out, name);
				}
				printf("shot %u %s %016llx %016llx", frame, shots[si].name,
				       (unsigned long long)hashVideo(&a), (unsigned long long)hashRegions(&a));
				if (two) {
					size_t md = 0;
					for (size_t r = 0; r < NREG; r++)
						md += diffRegion(&a, &b, r, 0);
					printf(" %016llx memdiff=%zu %s", (unsigned long long)hashVideo(&b),
					       md, vdiff ? "DIFF" : "same");
					if (vdiff) {
						snprintf(name, sizeof name, "%s_AB", shots[si].name);
						saveSideBySide(&a, &b, out, name);
					}
				}
				printf("\n");
			}
			si++;
		}
		if (every && frame % every == 0) {
			snprintf(name, sizeof name, "f%06u", frame);
			savePng(&a, out, name);
		}
		if (stopAfter >= 0) {
			long first = firstVideo;
			for (int k = 0; k < 2; k++)
				if (firstMem[k] >= 0 && (first < 0 || firstMem[k] < first))
					first = firstMem[k];
			if (first >= 0 && (long)frame >= first + stopAfter) {
				printf("stopped %u\n", frame);
				nframes = frame + 1;
				break;
			}
		}
		fflush(stdout);
	}
	if (runStart >= 0)
		printf("video_diff_range %ld %u\n", runStart, nframes - 1);
	printf("frames %u\n", nframes);
	if (two)
		printf("summary video_diff_frames %ld audio_diff_frames %ld vmem_diff_frames %ld ram_diff_frames %ld\n",
		       videoFrames, audioFrames, memFrames[1], memFrames[0]);
	if (log)
		fclose(log);
	a.core->deinit(a.core);
	if (two)
		b.core->deinit(b.core);
	return 0;
}
