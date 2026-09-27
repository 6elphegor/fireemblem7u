	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteChapterStats
WriteChapterStats: @ 0x0809FB10
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809FB20 @ =0x0203EC00
	movs r2, #0xc0
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_0809FB20: .4byte 0x0203EC00
