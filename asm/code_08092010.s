	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08092010
sub_08092010: @ 0x08092010
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	mov r8, r0
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080920F8 @ =0x02023460
	ldr r1, _080920FC @ =0x08407188
	movs r2, #0xa6
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r4, #0
_0809203A:
	ldrh r1, [r5, #0x32]
	lsrs r0, r1, #3
	adds r0, r0, r4
	movs r1, #0x1f
	ands r0, r1
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _08092100 @ =0x02023C60
	adds r0, r0, r1
	movs r1, #9
	movs r2, #0
	movs r3, #0
	bl TmFillRect_thm
	adds r4, #1
	cmp r4, #7
	ble _0809203A
	mov r0, r8
	bl GetUnitPortraitId
	ldr r7, _08092104 @ =0x02022D66
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r6, #0
	str r6, [sp]
	adds r1, r7, #0
	movs r3, #2
	bl PutFaceChibi
	ldr r5, _08092108 @ =0x02012A98
	adds r0, r5, #0
	bl ClearText
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r1, r7, #0
	adds r1, #0xa
	str r6, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r0, #0x8a
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x8c
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x92
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x90
	mov r1, r8
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x96
	mov r1, r8
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #7
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080920F8: .4byte 0x02023460
_080920FC: .4byte 0x08407188
_08092100: .4byte 0x02023C60
_08092104: .4byte 0x02022D66
_08092108: .4byte 0x02012A98
