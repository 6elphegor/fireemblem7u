	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDispUP_0804D584
EkrDispUP_0804D584: @ 0x0804CDA8
	ldr r0, _0804CDB4 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CDB4: .4byte 0x0200006C
