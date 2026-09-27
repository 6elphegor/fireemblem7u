	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPlaySound5AVol100
EfxPlaySound5AVol100: @ 0x0806B098
	push {lr}
	ldr r0, _0806B0A8 @ =0x0000037A
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0806B0A8: .4byte 0x0000037A
