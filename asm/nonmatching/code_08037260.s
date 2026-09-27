	.include "macro.inc"

	.syntax unified

	thumb_func_start SetupUnitHealStaffAIFlags
SetupUnitHealStaffAIFlags: @ 0x08037260
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r5, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08037284
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _08037284
	movs r5, #0x40
_08037284:
	adds r0, r4, #0
	bl GetItemEffect
	cmp r0, #1
	blt _0803729E
	cmp r0, #5
	ble _0803729A
	cmp r0, #0x22
	bgt _0803729E
	cmp r0, #0x21
	blt _0803729E
_0803729A:
	movs r0, #4
	orrs r5, r0
_0803729E:
	ldrb r0, [r6, #0xa]
	orrs r5, r0
	strb r5, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
