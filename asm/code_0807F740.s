	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUiGaugeBitmapFilledColumn
DrawUiGaugeBitmapFilledColumn: @ 0x0807F740
	push {r4, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #1
	strb r4, [r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
