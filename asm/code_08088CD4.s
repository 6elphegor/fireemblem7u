	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08088CD4
sub_08088CD4: @ 0x08088CD4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08088D30 @ =0x02023CC8
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _08088D34 @ =0x0200D660
	adds r0, r4, #0
	bl ClearText
	movs r3, #0
	ldr r0, _08088D38 @ =0x08CC3578
	mov r8, r0
	adds r5, r4, #0
	mov sb, r8
_08088CFE:
	movs r2, #0
	lsls r1, r3, #3
	adds r6, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #4
	mov r0, sb
	adds r0, #4
	adds r4, r1, r0
	add r1, r8
_08088D10:
	ldrb r0, [r1]
	cmp r0, r7
	bne _08088D68
	cmp r3, #5
	bne _08088D3C
	cmp r2, #0
	beq _08088D3C
	adds r1, r2, #0
	adds r1, #0x6f
	ldr r0, _08088D30 @ =0x02023CC8
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _08088D72
	.align 2, 0
_08088D30: .4byte 0x02023CC8
_08088D34: .4byte 0x0200D660
_08088D38: .4byte 0x08CC3578
_08088D3C:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	ldr r1, _08088D64 @ =0x02023CC8
	bl PutText
	b _08088D72
	.align 2, 0
_08088D64: .4byte 0x02023CC8
_08088D68:
	adds r4, #0x10
	adds r1, #0x10
	adds r2, #1
	cmp r2, #8
	ble _08088D10
_08088D72:
	adds r3, r6, #0
	cmp r3, #9
	ble _08088CFE
	movs r0, #4
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
