	.include "macro.inc"

	.syntax unified

	thumb_func_start BonusClaim_StartSelectTargetSubMenu
BonusClaim_StartSelectTargetSubMenu: @ 0x080AD49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r0, _080AD5AC @ =0x08CE5784
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0x60
	ldr r0, [sp, #4]
	adds r0, #0x2b
	ldrb r5, [r0]
	lsls r4, r5, #1
	adds r3, r4, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa
	movs r1, #5
	movs r2, #0xb
	bl DrawUiFrame2
	ldr r3, _080AD5B0 @ =0x03002870
	movs r0, #0x20
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0x50
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xa8
	strb r0, [r1]
	adds r4, #7
	lsls r4, r4, #3
	adds r0, r3, #0
	adds r0, #0x30
	strb r4, [r0]
	ldr r0, [sp, #4]
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r2, r0, #4
	ldr r3, [sp, #4]
	movs r1, #0x2c
	ldrsh r0, [r3, r1]
	subs r0, #0x38
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x40
	movs r3, #1
	bl SetUiCursorHandConfig
	ldr r0, [sp, #4]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x58
	movs r2, #8
	bl ShowSysHandCursor
	cmp r5, #0
	beq _080AD63A
	ldr r0, _080AD5B4 @ =0x02022C7A
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r3, r0, r3
	str r3, [sp, #8]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r1, r1, r0
	mov sl, r1
	movs r3, #0
	mov r8, r3
	mov sb, r5
_080AD566:
	movs r7, #0
	ldr r1, _080AD5B8 @ =0x08CE5788
	ldr r0, [r1]
	add r0, r8
	ldr r4, [r0, #4]
	adds r0, r6, #0
	bl ClearText
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	bne _080AD5C0
	bl GetConvoyItemCount
	adds r5, r0, #0
	cmp r5, #0x64
	bne _080AD592
	movs r7, #1
_080AD592:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParams
	ldr r0, _080AD5BC @ =0x0000125A
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
	b _080AD5E8
	.align 2, 0
_080AD5AC: .4byte 0x08CE5784
_080AD5B0: .4byte 0x03002870
_080AD5B4: .4byte 0x02022C7A
_080AD5B8: .4byte 0x08CE5788
_080AD5BC: .4byte 0x0000125A
_080AD5C0:
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	cmp r5, #5
	bne _080AD5CE
	movs r7, #1
_080AD5CE:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParams
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_080AD5E8:
	cmp r7, #0
	bne _080AD5FC
	ldr r3, _080AD5F8 @ =0x08CE5788
	ldr r0, [r3]
	add r0, r8
	movs r1, #1
	b _080AD604
	.align 2, 0
_080AD5F8: .4byte 0x08CE5788
_080AD5FC:
	ldr r1, _080AD658 @ =0x08CE5788
	ldr r0, [r1]
	add r0, r8
	movs r1, #0
_080AD604:
	strb r1, [r0]
	adds r0, r6, #0
	mov r1, sl
	bl PutText
	movs r1, #1
	cmp r7, #0
	bne _080AD616
	movs r1, #2
_080AD616:
	ldr r0, [sp, #8]
	adds r2, r5, #0
	bl PutNumber
	adds r6, #8
	ldr r3, [sp, #8]
	adds r3, #0x80
	str r3, [sp, #8]
	movs r0, #0x80
	add sl, r0
	movs r1, #8
	add r8, r1
	movs r3, #1
	rsbs r3, r3, #0
	add sb, r3
	mov r0, sb
	cmp r0, #0
	bne _080AD566
_080AD63A:
	ldr r0, _080AD65C @ =BonusClaim_DrawTargetUnitSprites
	ldr r1, [sp, #4]
	bl StartParallelWorker
	ldr r1, [sp, #4]
	str r0, [r1, #0x34]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD658: .4byte 0x08CE5788
_080AD65C: .4byte BonusClaim_DrawTargetUnitSprites
