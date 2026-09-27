	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ABFC8
sub_080ABFC8: @ 0x080ABFC8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x3a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	asrs r0, r0, #6
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_080ABD90
	ldrb r4, [r4]
	cmp r4, #0x18
	bne _080ABFFA
	adds r0, r5, #0
	bl Proc_Break
_080ABFFA:
	pop {r4, r5}
	pop {r0}
	bx r0
