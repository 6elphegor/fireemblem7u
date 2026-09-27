	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePid
EvtCmd_MovePid: @ 0x0800C25C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r6, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C288
	ldr r7, _0800C284 @ =0x0000FFFF
	ands r7, r1
	b _0800C28C
	.align 2, 0
_0800C284: .4byte 0x0000FFFF
_0800C288:
	movs r7, #1
	rsbs r7, r7, #0
_0800C28C:
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	cmp r0, #0
	bne _0800C2A2
	mov r8, r1
_0800C2A2:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C2BC
	adds r0, r4, #0
	adds r0, #0x4d
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0800C2D0
_0800C2BC:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C2F8
_0800C2D0:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C2F6
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C2F8
_0800C2F6:
	movs r0, #3
_0800C2F8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
