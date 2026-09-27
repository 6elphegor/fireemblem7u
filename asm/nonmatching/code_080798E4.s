	.include "macro.inc"

	.syntax unified

	thumb_func_start SetFlag
SetFlag: @ 0x080798E4
	push {lr}
	cmp r0, #0x63
	bgt _080798F0
	bl SetChapterFlag
	b _080798F4
_080798F0:
	bl SetPermanentFlag
_080798F4:
	pop {r0}
	bx r0
