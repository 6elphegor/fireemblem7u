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

AGBCC := tools/agbcc
CC1   := $(AGBCC)/bin/agbcc

CPPFLAGS := -I $(AGBCC)/include -iquote include -nostdinc -undef
CFLAGS   := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm
ASFLAGS  := -mcpu=arm7tdmi -I asm -I include

SHASUM := $(shell command -v sha1sum || echo shasum)

C_SRCS   := $(wildcard src/*.c)
ASM_SRCS := $(wildcard asm/*.s) $(wildcard src/*.s)
DATA_SRCS := $(wildcard data/*.s)
OBJS := $(patsubst %.c,build/%.o,$(C_SRCS)) $(patsubst %.s,build/%.o,$(ASM_SRCS) $(DATA_SRCS))

.PHONY: all compare clean
.DELETE_ON_ERROR:

all: compare

compare: $(ROM)
	@$(SHASUM) -c fe7u.sha1

$(ROM): $(ELF)
	$(OBJCOPY) -O binary --pad-to 0x09000000 $< $@

$(ELF): $(OBJS) $(LDS)
	$(LD) -T $(LDS) -Map $(MAP) -o $@ $(OBJS)

build/src/%.o: src/%.c
	@mkdir -p $(@D)
	$(CPP) $(CPPFLAGS) $< | $(CC1) $(CFLAGS) -o build/src/$*.s
	@printf '\t.text\n\t.align 2, 0\n' >> build/src/$*.s
	$(AS) $(ASFLAGS) -o $@ build/src/$*.s

build/%.o: %.s
	@mkdir -p $(@D)
	$(AS) $(ASFLAGS) -o $@ $<

# data/*.s incbins the base ROM.
build/data/%.o: baserom.gba

clean:
	rm -rf build $(ROM) $(ELF) $(MAP)
