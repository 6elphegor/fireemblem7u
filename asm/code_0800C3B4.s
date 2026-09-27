	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePidOneStepSpeed
EvtCmd_MovePidOneStepSpeed: @ 0x0800C3B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r6, r0, #0
	ldr r0, [r7, #0x30]
	ldr r1, [r0, #8]
	ldrh r0, [r0, #0xc]
	mov r8, r0
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	cmp r1, #1
	beq _0800C3F4
	cmp r1, #1
	bgt _0800C3E6
	cmp r1, #0
	beq _0800C3F0
	b _0800C3FE
_0800C3E6:
	cmp r1, #2
	beq _0800C3F8
	cmp r1, #3
	beq _0800C3FC
	b _0800C3FE
_0800C3F0:
	subs r5, #1
	b _0800C3FE
_0800C3F4:
	adds r5, #1
	b _0800C3FE
_0800C3F8:
	subs r4, #1
	b _0800C3FE
_0800C3FC:
	adds r4, #1
_0800C3FE:
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C41A
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C42E
_0800C41A:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C458
_0800C42E:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r7, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C456
	mov r0, r8
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C458
_0800C456:
	movs r0, #3
_0800C458:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
