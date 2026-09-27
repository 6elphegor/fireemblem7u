	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePidByFaction_PositionSpeed_Script
EvtCmd_MovePidByFaction_PositionSpeed_Script: @ 0x0800C6E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl IsPidBlue
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4, #0x30]
	ldr r6, _0800C720 @ =0x0000FFFF
	ldrh r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C724
	ands r1, r6
	str r1, [sp, #4]
	b _0800C72A
	.align 2, 0
_0800C720: .4byte 0x0000FFFF
_0800C724:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
_0800C72A:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800C73C
	str r3, [sp, #8]
	b _0800C742
_0800C73C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
_0800C742:
	ldrh r0, [r1, #6]
	mov sb, r0
	ldr r7, [r1, #0xc]
	mov r1, r8
	lsls r0, r1, #0x18
	adds r6, r0, #0
	cmp r6, #0
	beq _0800C76A
	ldr r1, [sp, #4]
	cmp r1, #0x63
	beq _0800C7EC
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _0800C76A
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #8]
	cmp r0, r1
	beq _0800C7EC
_0800C76A:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C786
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C7B2
_0800C786:
	cmp r6, #0
	bne _0800C7A0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #8]
	add r1, sp, #8
	add r0, sp, #4
	adds r2, r7, #0
	bl ApplyMoveScriptToCoordinates
_0800C7A0:
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r0, r5, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	b _0800C7EC
_0800C7B2:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C7CA
	movs r0, #3
	b _0800C7EE
_0800C7CA:
	cmp r6, #0
	beq _0800C7E0
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	mov r0, sb
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl TryMoveUnitDisplayed
	b _0800C7EC
_0800C7E0:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl DisplayMovement
_0800C7EC:
	movs r0, #0
_0800C7EE:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
