	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearOam_t
ClearOam_t: @ 0x080C57AC
	bx pc
	nop
_080C57B0:
	.byte 0xD3, 0xEA, 0xFC, 0xEA

	thumb_func_start TmApplyTsa_t
TmApplyTsa_t: @ 0x080C57B4
	bx pc
	nop
_080C57B8:
	.byte 0x1F, 0xEB, 0xFC, 0xEA

	thumb_func_start TmFillRect_t
TmFillRect_t: @ 0x080C57BC
	bx pc
	nop
_080C57C0:
	.byte 0xF8, 0xEA, 0xFC, 0xEA

	thumb_func_start ColorFadeTick_thm
ColorFadeTick_thm: @ 0x080C57C4
	bx pc
	nop
_080C57C8:
	.byte 0x99, 0xEA, 0xFC, 0xEA

	thumb_func_start TmCopyRect_t
TmCopyRect_t: @ 0x080C57CC
	bx pc
	nop
_080C57D0:
	.byte 0x02, 0xEB, 0xFC, 0xEA

	thumb_func_start Checksum32_thm
Checksum32_thm: @ 0x080C57D4
	bx pc
	nop
	.byte 0xE0, 0xEA, 0xFC, 0xEA
