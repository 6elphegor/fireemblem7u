	.include "macro.inc"

	.syntax unified

	thumb_func_start SioTeamList_Main_HandleDPadInput
SioTeamList_Main_HandleDPadInput: @ 0x0803E6B0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r1, _0803E710 @ =0x08B857F8
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _0803E6E6
	ldr r0, [r4]
	cmp r0, r5
	bgt _0803E6DA
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _0803E6E6
_0803E6DA:
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _0803E6E6
	subs r0, r6, #1
	str r0, [r4]
_0803E6E6:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0803E70A
	ldr r0, [r4]
	cmp r0, r7
	blt _0803E6FE
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _0803E70A
_0803E6FE:
	adds r0, #1
	str r0, [r4]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r4]
_0803E70A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E710: .4byte 0x08B857F8
