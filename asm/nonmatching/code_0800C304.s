	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePidSpeed
EvtCmd_MovePidSpeed: @ 0x0800C304
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C330
	ldr r6, _0800C32C @ =0x0000FFFF
	ands r6, r1
	b _0800C334
	.align 2, 0
_0800C32C: .4byte 0x0000FFFF
_0800C330:
	movs r6, #1
	rsbs r6, r6, #0
_0800C334:
	ldr r2, [r4, #0x30]
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, #0
	bne _0800C348
	adds r7, r1, #0
_0800C348:
	ldrh r2, [r2, #0xc]
	mov r8, r2
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C368
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C37C
_0800C368:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C3A6
_0800C37C:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C3A4
	mov r0, r8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C3A6
_0800C3A4:
	movs r0, #3
_0800C3A6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
