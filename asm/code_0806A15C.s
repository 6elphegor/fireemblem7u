	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvupApfxEndEach
EkrLvupApfxEndEach: @ 0x0806A15C
	push {lr}
	ldr r0, _0806A170 @ =0x08BDB834
	bl Proc_EndEach
	ldr r1, _0806A174 @ =0x02020130
	movs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806A170: .4byte 0x08BDB834
_0806A174: .4byte 0x02020130
