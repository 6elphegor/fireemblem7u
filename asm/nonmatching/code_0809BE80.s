	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809BE80
sub_0809BE80: @ 0x0809BE80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sb, r1
	movs r0, #1
	mov sl, r0
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	mov r1, sb
	lsls r4, r1, #1
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0809BEF8 @ =0x020129A8
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
_0809BEB8:
	adds r0, r5, #0
	bl ClearText
	bl GetSupportScreenUnitCount
	cmp r6, r0
	bge _0809BF4E
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r0, sb
	lsls r4, r0, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl Support_GetSupportLevelTextColor
	cmp r0, #1
	beq _0809BF06
	cmp r0, #1
	bgt _0809BEFC
	cmp r0, #0
	beq _0809BF02
	b _0809BF10
	.align 2, 0
_0809BEF8: .4byte 0x020129A8
_0809BEFC:
	cmp r0, #2
	beq _0809BF0C
	b _0809BF10
_0809BF02:
	movs r1, #1
	b _0809BF0E
_0809BF06:
	movs r0, #0
	mov sl, r0
	b _0809BF10
_0809BF0C:
	movs r1, #4
_0809BF0E:
	mov sl, r1
_0809BF10:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, sl
	bl Text_SetColor
	adds r0, r6, #0
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _0809BF70 @ =0x08BDCE4C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _0809BF74 @ =0x02023C60
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
_0809BF4E:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble _0809BEB8
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
_0809BF70: .4byte 0x08BDCE4C
_0809BF74: .4byte 0x02023C60
