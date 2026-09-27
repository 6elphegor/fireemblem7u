	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804CDB8
sub_0804CDB8: @ 0x0804CDB8
	ldr r0, _0804CDC4 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CDC4: .4byte 0x0200006C
