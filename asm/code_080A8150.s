	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A8150
sub_080A8150: @ 0x080A8150
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r4, #0
	adds r1, #0x41
	adds r0, #0x43
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r5, [r0]
	adds r0, r4, #0
	bl PutModeSelectDifficultyText
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r4, #0x42
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_080A7C24
	pop {r4, r5}
	pop {r0}
	bx r0
