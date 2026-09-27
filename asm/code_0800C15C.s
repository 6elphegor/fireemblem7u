	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePositionSpeed
EvtCmd_MovePositionSpeed: @ 0x0800C15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C184
	ldr r7, _0800C180 @ =0x0000FFFF
	ands r7, r1
	b _0800C188
	.align 2, 0
_0800C180: .4byte 0x0000FFFF
_0800C184:
	movs r7, #1
	rsbs r7, r7, #0
_0800C188:
	ldr r1, [r4, #0x30]
	ldrh r2, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, #0
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	mov sb, r5
	cmp r0, #0
	bne _0800C1A0
	mov sb, r2
_0800C1A0:
	ldr r2, [r1, #8]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _0800C1B4
	ldr r6, _0800C1B0 @ =0x0000FFFF
	ands r6, r2
	b _0800C1B8
	.align 2, 0
_0800C1B0: .4byte 0x0000FFFF
_0800C1B4:
	movs r6, #1
	rsbs r6, r6, #0
_0800C1B8:
	ldrh r2, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r3, #1
	rsbs r3, r3, #0
	mov r8, r3
	cmp r0, #0
	bne _0800C1CC
	mov r8, r2
_0800C1CC:
	ldrh r1, [r1, #0xc]
	mov sl, r1
	ldr r0, _0800C1E8 @ =0x0202E3DC
	ldr r1, [r0]
	mov r5, sb
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C1EC
	movs r0, #0
	b _0800C24A
	.align 2, 0
_0800C1E8: .4byte 0x0202E3DC
_0800C1EC:
	ldrb r0, [r1]
	bl GetUnit
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C210
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C224
_0800C210:
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C24A
_0800C224:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, sb
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C248
	mov r0, sl
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C24A
_0800C248:
	movs r0, #3
_0800C24A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
