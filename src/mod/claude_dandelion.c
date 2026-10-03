// The flower's tome spell (mod/claude): a dandelion clock gone to seed.
// The clock rises in the caster's hand; its seeds lift away (the clock
// thinning to a bare stem) and drift to the target on the wind, rising and
// falling, tilting as they flutter; they hang about it, then blow apart
// and up in a cloud of fluff as the spell lands.
//
// One effect anim draws everything: each frame the proc writes the anim's
// sprite list (struct AnimSpriteData, screen coordinates, the anim at 0, 0)
// into a scratch buffer and points the anim at it.  Sprites: the spell's
// OBJ tiles (SpellFx_RegisterObjGfx, tile 0x40, OBJ palette 2) from
// mod/claude/art/dandelionfx.py: small seeds tiles 0-7 (8x8, by tilt),
// large seeds 64 + 2k (16x16), fluff tufts 8 and 9, the clock 16 + 4 *
// stage (32x32).  Timing follows StartSpellAnimFire: the camera pans, the
// hit lands, the spell ends, at the same frames.

#include "gbafe.h"

#if MOD_CLAUDE

void NewEfxSpellCast(void);
void RegisterEfxSpellCastEnd(void);
void NewEfxFarAttackWithDistance(struct Anim * anim, s16 arg);
void EfxPlayHittedSFX(struct Anim * anim);

extern const u8 Img_DandelionFx[];
extern const u16 Pal_DandelionFx[];

// the last 0x500 bytes of the spell BG graphics buffer: this spell has no
// BG (the level-up box, drawn after the battle, uses its first 0x400)
extern u8 gSpellAnimBgfx[];
#define FX_SPRITES ((struct AnimSpriteData *) (gSpellAnimBgfx + 0x1800))
#define FX_SPRITES_MAX (0x500 / sizeof(struct AnimSpriteData) - 1)

#define SEED_COUNT 36
#define TUFT_COUNT 14
#define SEEDS_START 8           // the first seed leaves the clock

struct ProcDandelionFx {
    PROC_HEADER;

    u8 missed;
    s16 timer;
    struct Anim * anim;
    struct Anim * fx;
    s16 t_pan, t_hit, t_end;
};
PROC_SIZE_CHECK(struct ProcDandelionFx);

static const s16 sQuarterSine[65] = {
    0, 6, 13, 19, 25, 31, 38, 44, 50, 56, 62, 68, 74,
    80, 86, 92, 98, 104, 109, 115, 121, 126, 132, 137, 142, 147,
    152, 157, 162, 167, 172, 177, 181, 185, 190, 194, 198, 202, 206,
    209, 213, 216, 220, 223, 226, 229, 231, 234, 237, 239, 241, 243,
    245, 247, 248, 250, 251, 252, 253, 254, 255, 255, 256, 256, 256,
};

// sin of a 256-step angle, 8.8 fixed point
static int Sin8(int a)
{
    a &= 0xFF;
    if (a < 64)
        return sQuarterSine[a];
    if (a < 128)
        return sQuarterSine[128 - a];
    if (a < 192)
        return -sQuarterSine[a - 128];
    return -sQuarterSine[256 - a];
}

static int Cos8(int a)
{
    return Sin8(a + 64);
}

// a small fixed hash: each seed's own path, flutter and size
static int Hash(int i, int salt)
{
    unsigned x = (unsigned) (i * 2654435761u) ^ (unsigned) (salt * 40503u);
    x ^= x >> 13;
    x *= 0x5BD1E995u;
    x ^= x >> 15;
    return (int) (x & 0xFFFF);
}

// a seed at (x, y), tilted by tilt (0-7: leaning left to right)
static struct AnimSpriteData * PutSeed(struct AnimSpriteData * it, int x, int y, int big, int tilt)
{
    if (x < -24 || x > 248 || y < -24 || y > 168)
        return it;
    if (tilt < 0)
        tilt = 0;
    if (tilt > 7)
        tilt = 7;
    if (big)
    {
        it->header = 0x40000000; // 16x16
        it->as.object.oam2 = 64 + 2 * tilt;
        it->as.object.x = x - 8;
        it->as.object.y = y - 8;
    }
    else
    {
        it->header = 0; // 8x8
        it->as.object.oam2 = tilt;
        it->as.object.x = x - 4;
        it->as.object.y = y - 4;
    }
    return it + 1;
}

// The clock's head: over the caster's raised hand.  The target: its
// middle.  Anim positions are the units' feet, in screen coordinates (they
// move with the camera when it pans to a distant target).
static void DandelionFx_Ends(struct ProcDandelionFx * proc, int * sx, int * sy, int * tx, int * ty)
{
    struct Anim * target = GetAnimAnotherSide(proc->anim);
    int dir = GetAnimPosition(proc->anim) == EKR_POS_L ? 1 : -1;

    *sx = proc->anim->xPosition + dir * 15;
    *sy = proc->anim->yPosition - 28;
    *tx = target->xPosition;
    *ty = target->yPosition - 18;
}

static void DandelionFx_Draw(struct ProcDandelionFx * proc)
{
    struct AnimSpriteData * it = FX_SPRITES;
    struct AnimSpriteData * end = FX_SPRITES + FX_SPRITES_MAX - 2;
    int t = proc->timer;
    int sx, sy, tx, ty, i;

    DandelionFx_Ends(proc, &sx, &sy, &tx, &ty);

    // the clock, thinning as its seeds go, gone soon after the hit
    if (t < proc->t_hit + 8)
    {
        int stage = t < SEEDS_START + 6 ? 0 : t < SEEDS_START + 14 ? 1 : t < SEEDS_START + 22 ? 2 : 3;
        int sway = Sin8(t * 5) * 2 / 256;

        it->header = 0x80000000; // 32x32
        it->as.object.oam2 = 16 + 4 * stage;
        it->as.object.x = sx - 16 + sway;
        it->as.object.y = sy - 13;
        it++;
    }

    for (i = 0; i < SEED_COUNT && it < end; i++)
    {
        int launch = SEEDS_START + i / 2;           // a few at a time
        int travel = 22 + (Hash(i, 1) & 7);         // frames to drift over
        int big = (i % 3) == 0;
        int phase = Hash(i, 2) & 0xFF;
        int age = t - launch;
        int x, y, tilt;
        // where on the target each seed comes to rest
        int ox = (Hash(i, 3) & 31) - 16, oy = (Hash(i, 4) & 23) - 12;

        if (age < 0)
            continue;

        // flutter: the seed tilts to and fro as it drifts
        tilt = 4 + Sin8(phase + t * 7) * 3 / 256;

        if (t < proc->t_hit && age < travel)
        {
            // drifting: lifted off the clock, carried over in a wavering arc
            int p = age * 256 / travel;              // 0..255
            int lift = 10 + (Hash(i, 5) & 15);
            int fx = sx + (Hash(i, 6) & 15) - 8;     // from the clock's rim
            int fy = sy + (Hash(i, 7) & 15) - 8;

            x = fx + (tx + ox - fx) * p / 256 + Sin8(phase + t * 6) * 4 / 256;
            y = fy + (ty + oy - fy) * p / 256 - lift * Sin8(p / 2) / 256 + Sin8(phase * 3 + t * 9) * 3 / 256;
        }
        else if (t < proc->t_hit)
        {
            // hanging about the target, still on the wind
            x = tx + ox + Sin8(phase + t * 5) * 5 / 256;
            y = ty + oy + Sin8(phase * 2 + t * 4) * 3 / 256;
        }
        else
        {
            // blown apart and up; the big seeds tumble smaller, then only
            // fluff is left
            int dt = t - proc->t_hit;
            int a = phase;
            int r = 6 + dt * (2 + (Hash(i, 8) & 1));

            if (dt > 30)
                continue;
            if (proc->missed)
                a = (a & 0x7F) + 0xC0;                // past the target, away
            x = tx + ox + Cos8(a) * r / 256;
            y = ty + oy + Sin8(a) * r * 2 / 3 / 256 - dt * dt / 24;
            if (dt > 14)
            {
                // a tuft of fluff
                if (it < end)
                {
                    it->header = 0;
                    it->as.object.oam2 = 8 + ((i + (dt >> 2)) & 1);
                    it->as.object.x = x - 4;
                    it->as.object.y = y - 4;
                    it++;
                }
                continue;
            }
            if (dt > 7)
                big = 0;
        }
        it = PutSeed(it, x, y, big, tilt);
    }

    // a cloud of fluff where the spell lands
    if (!proc->missed && t >= proc->t_hit && t < proc->t_hit + 26)
    {
        int dt = t - proc->t_hit;

        for (i = 0; i < TUFT_COUNT && it < end; i++)
        {
            int a = Hash(i, 9) & 0xFF;
            int r = 4 + (Hash(i, 10) & 15) + dt * 2;

            if (((dt + i) & 7) == 7)
                continue; // flicker as they thin
            it->header = 0;
            it->as.object.oam2 = 8 + (i & 1);
            it->as.object.x = tx + Cos8(a) * r / 256 - 4;
            it->as.object.y = ty + Sin8(a) * r / 2 / 256 - dt / 2 - 4;
            it++;
        }
    }

    it->header = 1;
    proc->fx->pSpriteData = FX_SPRITES;
}

static const struct AnimSpriteData sDandelionFxEmpty[] CONST_DATA = { ANIM_SPRITE_END };

static const AnimScr sAnimScr_DandelionFx[] CONST_DATA = {
    ANIMSCR_FORCE_SPRITE(sDandelionFxEmpty, 1),
    ANIMSCR_BLOCKED,
};

static void DandelionFx_Loop(struct ProcDandelionFx * proc)
{
    struct Anim * target = GetAnimAnotherSide(proc->anim);
    int t = ++proc->timer;

    if (t == 1)
    {
        SpellFx_RegisterObjPal(Pal_DandelionFx, 0x20);
        SpellFx_RegisterObjGfx(Img_DandelionFx, 0x1000);
        proc->fx = AnimCreate(sAnimScr_DandelionFx, 0x78);
        proc->fx->oam2Base = 0x2840; // tile 0x40, OBJ palette 2, priority 2
        proc->fx->xPosition = 0;
        proc->fx->yPosition = 0;
    }

    if (t == SEEDS_START)
        PlaySFX(0x2BF, 0x100, proc->anim->xPosition, 1); // Excalibur's wind

    if (t == proc->t_pan)
        NewEfxFarAttackWithDistance(proc->anim, -1);

    if (t == proc->t_hit)
    {
        target->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(target, proc->missed);

        if (!proc->missed)
        {
            PlaySFX(0x2C0, 0x100, target->xPosition, 1);
            EfxPlayHittedSFX(target);
        }
    }

    if (t >= 2)
        DandelionFx_Draw(proc);

    if (t == proc->t_end)
    {
        AnimDelete(proc->fx);
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

static const struct ProcCmd ProcScr_DandelionFx[] CONST_DATA = {
    PROC_19,
    PROC_REPEAT(DandelionFx_Loop),
    PROC_END,
};

void StartSpellAnimDandelion(struct Anim * anim)
{
    struct ProcDandelionFx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_SetBG1Position();

    proc = Proc_Start(ProcScr_DandelionFx, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->missed = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    // the frames of StartSpellAnimFire's camera pan, hit and end
    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
    {
        proc->t_pan = 0x20;
        proc->t_hit = 0x34;
        proc->t_end = 0x55;
    }
    else
    {
        proc->t_pan = 0x28;
        proc->t_hit = 0x3C;
        proc->t_end = 0x60;
    }
}

#endif // MOD_CLAUDE
