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

C_SRCS   := $(wildcard src/*.c)
ASM_SRCS := $(wildcard asm/*.s) $(wildcard src/*.s)
C_OBJS   := $(patsubst %.c,build/%.o,$(C_SRCS))
ASM_OBJS := $(patsubst %.s,build/%.o,$(ASM_SRCS))
OBJS := $(C_OBJS) $(ASM_OBJS) build/data.o
LAYOUT := build/data.s build/layout.ld build/ram.ld

.PHONY: all compare clean
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

$(ELF): $(C_OBJS) build/asm.a build/data.o build/fe7u.ld $(LAYOUT) symbols.ld
	$(LD) -T build/fe7u.ld -Map $(MAP) --no-warn-rwx-segments -o $@ $(C_OBJS) --whole-archive build/asm.a --no-whole-archive build/data.o

# Library/low-level modules were built with different optimization.
build/src/irq.o build/src/random.o build/src/hardware.o build/src/move-data.o build/src/oam.o: CFLAGS += -O0
build/src/mu.o build/src/bmshop.o: CFLAGS += -O0
build/src/agb-sram.o: CFLAGS += -O1

build/src/%.o: src/%.c
	@mkdir -p $(@D)
	$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CFLAGS) -o build/src/$*.s
	@printf '\t.text\n\t.align 2, 0\n' >> build/src/$*.s
	$(AS) $(ASFLAGS) -o $@ build/src/$*.s

build/%.o: %.s
	@mkdir -p $(@D)
	$(AS) $(ASFLAGS) -o $@ $<

$(LAYOUT): data/layout.txt tools/gen_layout.py
	python3 tools/gen_layout.py data/layout.txt build

build/data.o: build/data.s baserom.gba
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -rf build $(ROM) $(ELF) $(MAP)
