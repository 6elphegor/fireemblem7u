	.include "macro.inc"

	.syntax unified

	thumb_func_start GetColorLut
GetColorLut: @ 0x080058A0
	ldr r1, _080058AC @ =0x08B8610C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080058AC: .4byte 0x08B8610C
