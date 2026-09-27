	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePidScript
EvtCmd_MovePidScript: @ 0x0800C464
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r6, [r0, #8]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C494
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C4BE
_0800C494:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	add r1, sp, #4
	mov r0, sp
	adds r2, r6, #0
	bl ApplyMoveScriptToCoordinates
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C4E4
_0800C4BE:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C4E2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl DisplayMovement
	movs r0, #0
	b _0800C4E4
_0800C4E2:
	movs r0, #3
_0800C4E4:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
