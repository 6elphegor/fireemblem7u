	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_Finish
SpellFx_Finish: @ 0x0804FFFC
	ldr r1, _08050004 @ =0x0201772C
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08050004: .4byte 0x0201772C
