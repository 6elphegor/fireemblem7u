	.include "macro.inc"

	.syntax unified

	thumb_func_start PutTwoSpecialChar
PutTwoSpecialChar: @ 0x080063AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r3, #0
	adds r4, #2
	bl PutSpecialChar
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpecialChar
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
