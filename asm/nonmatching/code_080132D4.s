	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyBitmapTile
ApplyBitmapTile: @ 0x080132D4
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r1, #7
_080132DC:
	ldrb r5, [r3, #7]
	lsls r0, r5, #4
	ldrb r5, [r3, #6]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #5]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #4]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #3]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #2]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3, #1]
	orrs r0, r5
	lsls r0, r0, #4
	ldrb r5, [r3]
	orrs r0, r5
	stm r4!, {r0}
	lsls r0, r2, #3
	adds r3, r3, r0
	subs r1, #1
	cmp r1, #0
	bge _080132DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
