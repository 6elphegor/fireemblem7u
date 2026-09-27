	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809E934
sub_0809E934: @ 0x0809E934
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetChapterFlagBits
	adds r5, r0, #0
	bl GetChapterFlagBitsSize
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
