	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPlaySound5CVol100
EfxPlaySound5CVol100: @ 0x0806B0AC
	push {lr}
	movs r0, #0xdf
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	pop {r0}
	bx r0
	.align 2, 0
