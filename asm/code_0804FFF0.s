	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_Begin
SpellFx_Begin: @ 0x0804FFF0
	ldr r1, _0804FFF8 @ =0x0201772C
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0804FFF8: .4byte 0x0201772C
