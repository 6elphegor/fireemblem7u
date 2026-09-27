	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePosition
EvtCmd_MovePosition: @ 0x0800C058
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C084
	ldr r0, _0800C080 @ =0x0000FFFF
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _0800C08A
	.align 2, 0
_0800C080: .4byte 0x0000FFFF
_0800C084:
	movs r4, #1
	rsbs r4, r4, #0
	mov r8, r4
_0800C08A:
	ldr r1, [r5, #0x30]
	ldrh r2, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, #0
	ands r0, r3
	movs r4, #1
	rsbs r4, r4, #0
	mov sl, r4
	cmp r0, #0
	bne _0800C0A2
	mov sl, r2
_0800C0A2:
	ldr r2, [r1, #8]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _0800C0B8
	ldr r7, _0800C0B4 @ =0x0000FFFF
	ands r7, r2
	b _0800C0BC
	.align 2, 0
_0800C0B4: .4byte 0x0000FFFF
_0800C0B8:
	movs r7, #1
	rsbs r7, r7, #0
_0800C0BC:
	ldrh r1, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, #0
	bne _0800C0D0
	mov sb, r1
_0800C0D0:
	ldr r0, _0800C0EC @ =0x0202E3DC
	ldr r1, [r0]
	mov r4, sl
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C0F0
	movs r0, #0
	b _0800C14A
	.align 2, 0
_0800C0EC: .4byte 0x0202E3DC
_0800C0F0:
	ldrb r0, [r1]
	bl GetUnit
	adds r6, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C112
	adds r0, r5, #0
	adds r0, #0x4d
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	beq _0800C126
_0800C112:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sb
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C14A
_0800C126:
	adds r0, r5, #0
	mov r1, r8
	mov r2, sl
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C148
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, sb
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C14A
_0800C148:
	movs r0, #3
_0800C14A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
