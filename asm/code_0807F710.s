	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUiGaugeBitmapBaseColumn
DrawUiGaugeBitmapBaseColumn: @ 0x0807F710
	push {r4, r5, lr}
	adds r4, r0, r2
	movs r3, #4
	strb r3, [r4]
	adds r3, r1, r2
	adds r3, r0, r3
	movs r5, #0xe
	strb r5, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r4, r0, r4
	strb r5, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #3
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
