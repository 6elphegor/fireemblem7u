	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearFlag
ClearFlag: @ 0x08079910
	push {lr}
	cmp r0, #0x63
	bgt _0807991C
	bl ClearChapterFlag
	b _08079920
_0807991C:
	bl ClearPermanentFlag
_08079920:
	pop {r0}
	bx r0
