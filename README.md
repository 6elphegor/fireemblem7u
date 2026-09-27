# Fire Emblem: The Blazing Sword (USA, Australia) — decompilation

A matching decompilation of *Fire Emblem* (GBA, `AE7E`). It builds:

* `fe7u.gba` — `sha1: c735fdbb9e8abe19e0c6a44708df19acc962e204`

## Setup

Requires `arm-none-eabi` binutils, `make`, `python3`, and a C compiler for the host.

```sh
tools/setup.sh          # builds agbcc and gbadisasm into tools/
cp /path/to/rom.gba baserom.gba
make                    # builds fe7u.gba and checks its SHA1
```

`baserom.gba` is still needed at build time: everything after the code
(`0x080C57DC` onward) is incbin'd from it until data is split out.

## Layout

| Path | Contents |
| --- | --- |
| `asm/crt0.s` | ARM startup and IWRAM routines (`0x08000000`) |
| `asm/code_*.s` | Game code not yet decompiled, named by start address |
| `asm/m4a_1.s` + `src/m4a.c`, `src/m4a_tables.c` | MusicPlayer2000 sound engine (hand-written asm part + C part) |
| `asm/libagb.s`, `veneers.s` | Library code; libc and libgcc are linked from agbcc's `libc.a`/`libgcc.a` (members listed in `fe7u.lds`) |
| `src/` | Decompiled C |
| `include/` | Headers (adopted from FireEmblem7J) |
| `data/layout.txt` | FE7U addresses of C data sections (ROM and RAM); everything else in the data region is incbin'd |
| `symbols.ld` | FE7U addresses of data symbols not yet defined in C |
| `fe7u.lds` | Linker script — object order defines the ROM layout |

## Decompiling a function

```sh
tools/carve.py FuncName NextFuncName   # FuncName now alone in asm/code_<ADDR>.s
```

Write the C for it in `src/`, delete that asm file, point its line in
`fe7u.lds` at `build/src/<file>.o`, and run `make` until it prints `OK`.
Adjacent functions from the same original module go in the same C file.

## Porting from other decomps

Much of the engine matches FireEmblem7J (and, less often, fireemblem8u)
byte-for-byte.  With the reference project's sources compiled to unlinked
objects in `REF/objs/` (same compiler and flags as the reference build):

```sh
tools/match_names.py REF/objs            # our sub_XXXXXXXX that match named ref functions
tools/port_ref.py REF/objs --json plan.json   # which ref C files port as-is, and why not
tools/apply_port.py REF plan.json [src_foo ...]
make
```

`port_ref.py` requires every function and data section of a file to match
FE7U after relocation, and derives FE7U addresses for everything the file
references.  Files it rejects usually differ between versions and need
real decompilation work.

## Regenerating the disassembly

```sh
tools/gbadisasm/gbadisasm baserom.gba -c tools/fe7u.cfg > full.s
tools/split_disasm.py full.s
```

The final veneer at `0x080C57D4` is truncated by gbadisasm and must be
completed by hand (`bx pc; nop; .byte 0xE0, 0xEA, 0xFC, 0xEA`).

## References

* [fireemblem8u](https://github.com/FireEmblemUniverse/fireemblem8u) — FE8 decomp; shares most of the engine.
* [FireEmblem7J](https://github.com/MokhaLeee/FireEmblem7J) — FE7 (Japan) decomp.
* [StanHash/fe7_us](https://github.com/StanHash/fe7_us) — FE7U disassembly; source of the initial function list in `tools/fe7u.cfg`.
