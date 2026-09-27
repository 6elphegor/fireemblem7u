	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteSuspendSave
WriteSuspendSave: @ 0x080A1100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	ldr r4, _080A121C @ =0x0202BBF8
	movs r0, #8
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080A120C
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A120C
	bl GetNextSuspendSaveId
	add r8, r0
	mov r0, r8
	bl GetSaveWriteAddr
	adds r7, r0, #0
	bl GetGameTime
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	bl StoreRNStateToActionStruct
	ldr r0, _080A1220 @ =0x0203A85C
	adds r1, r7, #0
	adds r1, #0x48
	movs r2, #0x1c
	bl WriteAndVerifySramFast
	ldr r5, _080A1224 @ =0x02020140
	add r0, sp, #0x10
	mov sl, r0
	ldr r6, _080A1228 @ =0x0202BD50
	movs r4, #0x33
_080A115C:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl EncodeSuspendSavePackedUnit
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A115C
	movs r1, #0x64
	adds r1, r1, r7
	mov sb, r1
	ldr r6, _080A122C @ =0x0202CEC0
	movs r4, #0x31
_080A1178:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl EncodeSuspendSavePackedUnit
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A1178
	ldr r6, _080A1230 @ =0x0202DCD0
	movs r4, #9
_080A118E:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl EncodeSuspendSavePackedUnit
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A118E
	movs r4, #0
	ldr r0, _080A1224 @ =0x02020140
	movs r2, #0xb6
	lsls r2, r2, #5
	mov r1, sb
	bl WriteSramFast
	ldr r1, _080A1234 @ =0x00001F1C
	adds r0, r7, r1
	bl sub_0809E954
	ldr r1, _080A1238 @ =0x00001F24
	adds r0, r7, r1
	bl sub_0809E934
	ldr r1, _080A123C @ =0x00001924
	adds r0, r7, r1
	bl sub_0809E9C4
	ldr r1, _080A1240 @ =0x000019EC
	adds r0, r7, r1
	bl WritePidStats
	ldr r1, _080A1244 @ =0x00001E4C
	adds r0, r7, r1
	bl WriteChapterStats
	ldr r1, _080A1248 @ =0x00001724
	adds r0, r7, r1
	bl WriteTraps
	mov r0, sl
	bl GetForceDisabledMenuItems
	ldr r0, _080A124C @ =0x00001F0C
	adds r1, r7, r0
	mov r0, sl
	movs r2, #0x10
	bl WriteAndVerifySramFast
	ldr r0, _080A1250 @ =0x00020509
	str r0, [sp]
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, r8
	bl WriteSaveBlockInfo
	ldr r0, _080A1254 @ =0x0202BBB8
	adds r0, #0x3c
	strb r4, [r0]
	bl WriteSwappedSuspendSaveId
_080A120C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A121C: .4byte 0x0202BBF8
_080A1220: .4byte 0x0203A85C
_080A1224: .4byte 0x02020140
_080A1228: .4byte 0x0202BD50
_080A122C: .4byte 0x0202CEC0
_080A1230: .4byte 0x0202DCD0
_080A1234: .4byte 0x00001F1C
_080A1238: .4byte 0x00001F24
_080A123C: .4byte 0x00001924
_080A1240: .4byte 0x000019EC
_080A1244: .4byte 0x00001E4C
_080A1248: .4byte 0x00001724
_080A124C: .4byte 0x00001F0C
_080A1250: .4byte 0x00020509
_080A1254: .4byte 0x0202BBB8
