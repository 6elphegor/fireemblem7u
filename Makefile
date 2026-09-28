# Fire Emblem: The Blazing Sword (USA, Australia) decompilation.
# Run tools/setup.sh once, put the original ROM at baserom.gba, then `make`.

ROM := fe7u.gba
ELF := $(ROM:.gba=.elf)
MAP := $(ROM:.gba=.map)
LDS := fe7u.lds

PREFIX  := arm-none-eabi-
AS      := $(PREFIX)as
CPP     := $(PREFIX)cpp
LD      := $(PREFIX)ld
OBJCOPY := $(PREFIX)objcopy
AR      := $(PREFIX)ar

AGBCC := tools/agbcc
CC1   := $(AGBCC)/bin/old_agbcc

CPPFLAGS := -I $(AGBCC)/include -iquote include -iquote . -nostdinc -undef
CFLAGS   := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm
ASFLAGS  := -mcpu=arm7tdmi -I asm -I include

SHASUM := $(shell command -v sha1sum || echo shasum)

C_SRCS   := $(wildcard src/*.c) $(wildcard src/data/*.c)
ASM_SRCS := $(wildcard asm/*.s) $(wildcard src/*.s)
C_OBJS   := $(patsubst %.c,build/%.o,$(C_SRCS))
ASM_OBJS := $(patsubst %.s,build/%.o,$(ASM_SRCS))
EVENT_SRCS := $(wildcard data/events/*.s)
EVENT_OBJS := $(patsubst %.s,build/%.o,$(EVENT_SRCS))
OBJS := $(C_OBJS) $(ASM_OBJS) $(EVENT_OBJS) build/data.o build/msg_data.o
LAYOUT := build/data.s build/layout.ld build/ram.ld

.PHONY: all compare clean msgheader
.DELETE_ON_ERROR:

all: compare

compare: $(ROM)
	@$(SHASUM) -c fe7u.sha1

$(ROM): $(ELF)
	$(OBJCOPY) -O binary --pad-to 0x09000000 $< $@

# ld keeps every input file open; thousands of per-function objects can
# exhaust the system's file table, so asm objects are linked from one archive.
build/asm.a: $(ASM_OBJS)
	@rm -f $@
	@printf '%s\n' $(ASM_OBJS) > build/asm.list
	$(AR) rcs $@ @build/asm.list

build/fe7u.ld: $(LDS)
	@mkdir -p $(@D)
	sed -E 's#build/asm/([A-Za-z0-9_]+\.o)\(#*asm.a:\1(#' $< > $@

$(ELF): $(C_OBJS) build/asm.a $(EVENT_OBJS) build/data.o build/msg_data.o build/fe7u.ld $(LAYOUT) symbols.ld
	@python3 tools/check_symbols.py
	$(LD) -T build/fe7u.ld -Map $(MAP) --no-warn-rwx-segments -o $@ $(C_OBJS) --whole-archive build/asm.a --no-whole-archive $(EVENT_OBJS) build/data.o build/msg_data.o -L $(AGBCC)/lib -lc -lgcc

# Library/low-level modules were built with different optimization.
build/src/irq.o build/src/random.o build/src/hardware.o build/src/move-data.o build/src/oam.o: CFLAGS += -O0
build/src/soundwrapper.o: CFLAGS += -O0
build/src/ramfunc.o: CFLAGS += -O0
build/src/mu.o build/src/bmshop.o build/src/uiarena.o: CFLAGS += -O0
build/src/mapanim.o build/src/mapanim_api.o build/src/mapanim_infobox.o build/src/mapanim_expbar.o build/src/mapanim_debug.o build/src/mapanim_specialeffect.o build/src/mapanim_staffeffect.o build/src/mapanim_lvupfx.o build/src/mapanim_lvup.o build/src/mapanim_spellassocfx.o build/src/mapanim_spellassoc.o build/src/scanline.o: CFLAGS += -O0
build/src/agb-sram.o: CFLAGS += -O1
build/src/main.o: CFLAGS += -mtpcs-frame

# ASM_FUNC pulls asm/nonmatching/*.s into C objects via .include.
$(C_OBJS): $(wildcard asm/nonmatching/*.s)

build/src/%.o: src/%.c
	@mkdir -p $(@D)
	$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CFLAGS) -o build/src/$*.s
	@printf '\t.text\n\t.align 2, 0\n' >> build/src/$*.s
	$(AS) $(ASFLAGS) -o $@ build/src/$*.s

# Chapter event data (tools/evdis.py): assembly run through cpp so it can use
# the C constant names (msg.h, and enum headers converted by enum2inc.py).
ENUM_INCS := $(addprefix build/include/constants/,characters.inc classes.inc items.inc songs.inc chapters.inc)

$(ENUM_INCS): build/include/constants/%.inc: include/constants/%.h tools/enum2inc.py
	python3 tools/enum2inc.py $< $@

build/data/events/%.o: data/events/%.s include/event_macros.inc include/constants/msg.h $(ENUM_INCS)
	@mkdir -p $(@D)
	$(CPP) -x assembler-with-cpp -iquote include -I build/include -nostdinc -undef $< -o build/data/events/$*.i
	$(AS) $(ASFLAGS) -o $@ build/data/events/$*.i

build/%.o: %.s
	@mkdir -p $(@D)
	$(AS) $(ASFLAGS) -o $@ $<

$(LAYOUT): data/layout.txt tools/gen_layout.py
	python3 tools/gen_layout.py data/layout.txt build

build/data.o: build/data.s baserom.gba
	$(AS) $(ASFLAGS) -o $@ $<

# Game text: texts/*.txt -> Huffman-compressed messages, tree and gMsgTable.
TEXTS := texts/texts.txt texts/textdefs.txt

# texts.txt is the game's script, so it isn't in git: extract it from the ROM
# the first time. After that it is the source of truth and is never overwritten.
texts/texts.txt: | baserom.gba
	python3 tools/textdecode.py baserom.gba

build/msg_data.s: $(TEXTS) tools/textencode.py
	@mkdir -p $(@D)
	python3 tools/textencode.py $(TEXTS) $@

build/msg_data.o: build/msg_data.s
	$(AS) $(ASFLAGS) -o $@ $<

# Regenerate include/constants/msg.h after adding/removing messages.
msgheader:
	python3 tools/textencode.py $(TEXTS) build/msg_data.s --header include/constants/msg.h

clean:
	rm -rf build $(ROM) $(ELF) $(MAP)
