	.include "macro.inc"

	.syntax unified

	thumb_func_start WarpSelect_OnInit
WarpSelect_OnInit: @ 0x08027718
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r0, _080277B8 @ =0x00000725
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl StartSubtitleHelp
	ldr r5, _080277BC @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r4, #0
	bl EnsureCameraOntoPosition
	bl HideMoveRangeGraphics
	ldr r0, _080277C0 @ =0x03004690
	ldr r4, [r0]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl FillWarpRangeMap
	ldr r1, _080277C4 @ =0x0202BBB8
	movs r0, #0xfd
	ldrb r2, [r1, #4]
	ands r0, r2
	movs r2, #0
	mov r8, r2
	strb r0, [r1, #4]
	movs r0, #1
	bl DisplayMoveRangeGraphics
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl SetMapCursorPosition
	ldr r0, _080277C8 @ =0x08196228
	movs r1, #0
	bl StartSpriteAnim
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl SetSpriteAnimId
	str r4, [r6, #0x54]
	adds r6, #0x4a
	movs r0, #2
	strh r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080277B8: .4byte 0x00000725
_080277BC: .4byte 0x0203A85C
_080277C0: .4byte 0x03004690
_080277C4: .4byte 0x0202BBB8
_080277C8: .4byte 0x08196228
