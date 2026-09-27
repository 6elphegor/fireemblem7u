	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePidNextTo
EvtCmd_MovePidNextTo: @ 0x0800C5B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r7, #0x10
	ldrsb r7, [r4, r7]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C5F4
	adds r0, r5, #0
	adds r0, #0x4d
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _0800C608
_0800C5F4:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C630
_0800C608:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C62E
	str r6, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	mov r3, r8
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C630
_0800C62E:
	movs r0, #3
_0800C630:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
