	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUnitMapUi
DrawUnitMapUi: @ 0x08085110
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sl, r0
	str r0, [sp, #4]
	ldr r1, _080851C8 @ =0x0200323C
	mov sb, r1
	ldr r2, _080851CC @ =0x01000060
	add r0, sp, #4
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x30
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawString
	mov r1, sb
	adds r1, #0x4a
	adds r0, r4, #0
	bl PutText
	mov r0, r8
	bl GetUnitMiniPortraitId
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08085186
	adds r2, #1
_08085186:
	mov r1, sb
	adds r1, #0x42
	mov r0, sl
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0xf0
	movs r3, #4
	bl PutFaceChibi
	mov r0, sb
	adds r0, #0xca
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, sl
	strh r1, [r0]
	ldr r2, _080851D0 @ =0x08CC2B94
	adds r1, r7, #0
	adds r1, #0x50
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080851D4
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #5
	b _080851DA
	.align 2, 0
_080851C8: .4byte 0x0200323C
_080851CC: .4byte 0x01000060
_080851D0: .4byte 0x08CC2B94
_080851D4:
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0x17
_080851DA:
	strh r0, [r2]
	ldr r0, _080851F8 @ =0x08CC2B94
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080851FC
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #3
	b _08085202
	.align 2, 0
_080851F8: .4byte 0x08CC2B94
_080851FC:
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #0x11
_08085202:
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl UnitMapUiUpdate
	ldr r0, _08085244 @ =0x02003346
	movs r2, #0xc5
	lsls r2, r2, #6
	mov r1, r8
	bl PutMapUiHpBar
	ldr r0, _08085248 @ =0x0200373C
	ldr r1, _0808524C @ =0x084045F4
	movs r2, #0xc4
	lsls r2, r2, #6
	bl TmApplyTsa_thm
	movs r0, #0xc0
	mov r2, r8
	ldrb r2, [r2, #0xb]
	ands r0, r2
	movs r1, #3
	bl ApplyUnitMapUiFramePal
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085244: .4byte 0x02003346
_08085248: .4byte 0x0200373C
_0808524C: .4byte 0x084045F4
