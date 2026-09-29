	.include "macro.inc"

	.syntax unified

@ Thumb-to-ARM veneers for the ARM routines in crt0.s: switch to ARM state
@ (bx pc) and branch.  The branches are symbolic so that the veneers keep
@ working when the code before them changes size (NONMATCHING build).

	thumb_func_start ClearOam_thm
ClearOam_thm: @ 0x080C57AC
	bx pc
	nop
	.arm
	b ClearOam

	thumb_func_start TmApplyTsa_thm
TmApplyTsa_thm: @ 0x080C57B4
	bx pc
	nop
	.arm
	b TmApplyTsa

	thumb_func_start TmFillRect_thm
TmFillRect_thm: @ 0x080C57BC
	bx pc
	nop
	.arm
	b TmFillRect

	thumb_func_start ColorFadeTick_thm
ColorFadeTick_thm: @ 0x080C57C4
	bx pc
	nop
	.arm
	b ColorFadeTick

	thumb_func_start TmCopyRect_thm
TmCopyRect_thm: @ 0x080C57CC
	bx pc
	nop
	.arm
	b TmCopyRect

	thumb_func_start Checksum32_thm
Checksum32_thm: @ 0x080C57D4
	bx pc
	nop
	.arm
	b Checksum32
