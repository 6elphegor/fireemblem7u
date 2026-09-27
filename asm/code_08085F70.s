	.include "macro.inc"

	.syntax unified

	thumb_func_start GoalDisplay_Loop_OnSideChange
GoalDisplay_Loop_OnSideChange: @ 0x08085F70
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCursorQuadrant
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08085FFC @ =0x08CC2B94
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetWindowQuadrant
	adds r5, r0, #0
	ldr r0, _08086000 @ =0x08CC2C00
	bl Proc_Find
	cmp r0, #0
	beq _08085FC0
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _08085FC0
	cmp r0, r5
	beq _08085FF4
_08085FC0:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_08085D48
	ldr r1, _08086004 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r3, r4, #0
	adds r3, #0x4f
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08085FF4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085FFC: .4byte 0x08CC2B94
_08086000: .4byte 0x08CC2C00
_08086004: .4byte 0x0202BBB8
