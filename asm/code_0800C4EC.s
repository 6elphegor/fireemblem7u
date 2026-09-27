	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePositionScript
EvtCmd_MovePositionScript: @ 0x0800C4EC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C50C
	ldr r0, _0800C508 @ =0x0000FFFF
	ands r1, r0
	str r1, [sp]
	b _0800C512
	.align 2, 0
_0800C508: .4byte 0x0000FFFF
_0800C50C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
_0800C512:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800C524
	str r3, [sp, #4]
	b _0800C52A
_0800C524:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
_0800C52A:
	ldr r6, [r1, #8]
	ldr r0, _0800C580 @ =0x0202E3DC
	ldr r1, [r0]
	ldr r0, [sp, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C560
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C584
_0800C560:
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
	b _0800C5A6
	.align 2, 0
_0800C580: .4byte 0x0202E3DC
_0800C584:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C5A4
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl DisplayMovement
	movs r0, #0
	b _0800C5A6
_0800C5A4:
	movs r0, #3
_0800C5A6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
