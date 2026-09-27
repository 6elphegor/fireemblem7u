	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08092B6C
sub_08092B6C: @ 0x08092B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r1, #1
	add r0, sl
	str r0, [sp]
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08092C2C @ =0x020129A8
	adds r6, r0, r1
	movs r0, #0
	mov r8, r0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sb, r4
_08092BA0:
	mov r1, sb
	cmp r1, #0
	bne _08092BAC
	adds r0, r6, #0
	bl ClearText
_08092BAC:
	ldr r4, [sp]
	add r4, r8
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08092C08
	mov r0, r8
	movs r1, #3
	bl __modsi3
	lsls r7, r0, #3
	mov r0, sl
	lsls r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	mov r1, sb
	cmp r1, #0
	bne _08092BF8
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_08092BF8:
	lsls r1, r5, #5
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _08092C30 @ =0x02023C60
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
_08092C08:
	adds r6, #8
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _08092BA0
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092C2C: .4byte 0x020129A8
_08092C30: .4byte 0x02023C60
