	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawItemStatScreenLine
DrawItemStatScreenLine: @ 0x08016668
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r6, r2, #0
	adds r7, r3, #0
	bl ClearText
	adds r4, r6, #0
	mov r0, r8
	adds r1, r4, #0
	bl Text_SetColor
	movs r0, #0xff
	mov r1, sb
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016714 @ =0x08BE222C
	adds r5, r1, r0
	ldrh r0, [r5]
	bl DecodeMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	adds r1, r0, #0
	mov r0, r8
	bl Text_DrawString
	movs r4, #0
	cmp r6, #1
	bne _080166B6
	movs r4, #1
_080166B6:
	adds r0, r7, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x16
	bl PutSpecialChar
	movs r4, #1
	cmp r6, #1
	beq _080166CA
	movs r4, #2
_080166CA:
	adds r1, r7, #0
	adds r1, #0x16
	ldr r0, [r5, #8]
	movs r6, #8
	ands r0, r6
	mov r3, sb
	asrs r2, r3, #8
	cmp r0, #0
	beq _080166DE
	movs r2, #0xff
_080166DE:
	adds r0, r1, #0
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r1, r7, #0
	adds r1, #0x1c
	ldr r0, [r5, #8]
	ands r0, r6
	movs r2, #0xff
	cmp r0, #0
	bne _080166F6
	ldrb r2, [r5, #0x14]
_080166F6:
	adds r0, r1, #0
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r1, r7, #4
	mov r0, r8
	bl PutText
	mov r0, sb
	cmp r0, #0
	bne _08016718
	movs r1, #1
	rsbs r1, r1, #0
	b _0801671A
	.align 2, 0
_08016714: .4byte 0x08BE222C
_08016718:
	ldrb r1, [r5, #0x1d]
_0801671A:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl PutIcon
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
