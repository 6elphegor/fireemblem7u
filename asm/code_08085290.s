	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUnitBurstMapUi
DrawUnitBurstMapUi: @ 0x08085290
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _080853D8 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _080852B4
	adds r0, #7
_080852B4:
	asrs r0, r0, #3
	mov sl, r0
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _080852CC
	adds r0, #7
_080852CC:
	asrs r4, r0, #3
	mov r0, sl
	adds r1, r4, #0
	bl GetUnitBurstMapUiOrientationAt
	mov r8, r0
	ldr r0, _080853DC @ =0x08CC2BCC
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sl, r0
	ldr r0, _080853E0 @ =0x08CC2BD2
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, sl
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
	strb r0, [r1]
	ldr r2, [sp]
	ldr r0, [r2]
	ldrh r0, [r0]
	bl DecodeMsg
	mov sb, r0
	movs r0, #0x30
	mov r1, sb
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r5, #0
	mov r1, sb
	bl Text_DrawString
	ldr r0, _080853E4 @ =0x08CC2BBA
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, r4, r1
	lsls r1, r1, #5
	ldr r0, _080853E8 @ =0x08CC2BB4
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, _080853EC @ =0x02022C60
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r1, r4, #3
	lsls r0, r1, #5
	adds r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	movs r3, #0
	strh r3, [r0]
	mov r0, sl
	adds r0, #1
	adds r2, r7, #0
	adds r2, #0x46
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp]
	bl UnitMapUiUpdate
	lsls r4, r4, #5
	add r4, sl
	lsls r4, r4, #1
	ldr r0, _080853F0 @ =0x02023460
	adds r4, r4, r0
	ldr r0, _080853F4 @ =0x08CC2BD8
	mov r1, r8
	lsls r1, r1, #2
	mov r8, r1
	add r8, r0
	mov r2, r8
	ldr r1, [r2]
	movs r2, #0xc4
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xc0
	ldr r3, [sp]
	ldrb r3, [r3, #0xb]
	ands r0, r3
	movs r1, #3
	bl ApplyUnitMapUiFramePal
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080853D8: .4byte 0x0202BBB8
_080853DC: .4byte 0x08CC2BCC
_080853E0: .4byte 0x08CC2BD2
_080853E4: .4byte 0x08CC2BBA
_080853E8: .4byte 0x08CC2BB4
_080853EC: .4byte 0x02022C60
_080853F0: .4byte 0x02023460
_080853F4: .4byte 0x08CC2BD8
