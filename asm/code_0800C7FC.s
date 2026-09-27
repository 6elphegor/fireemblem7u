	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePidByFaction_Script_Script
EvtCmd_MovePidByFaction_Script_Script: @ 0x0800C7FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl IsPidBlue
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	mov r8, r1
	ldr r7, [r0, #0xc]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C840
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C878
_0800C840:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	cmp r6, #0
	bne _0800C85C
	add r1, sp, #4
	mov r0, sp
	adds r2, r7, #0
	bl ApplyMoveScriptToCoordinates
	b _0800C866
_0800C85C:
	add r1, sp, #4
	mov r0, sp
	mov r2, r8
	bl ApplyMoveScriptToCoordinates
_0800C866:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	b _0800C8AE
_0800C878:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C890
	movs r0, #3
	b _0800C8B0
_0800C890:
	cmp r6, #0
	beq _0800C8A2
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	movs r3, #0
	bl DisplayMovement
	b _0800C8AE
_0800C8A2:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl DisplayMovement
_0800C8AE:
	movs r0, #0
_0800C8B0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
