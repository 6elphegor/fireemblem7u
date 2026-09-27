	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawItemMenuLineLong
DrawItemMenuLineLong: @ 0x0801650C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r7, r3, #0
	movs r3, #0
	lsls r2, r2, #0x18
	asrs r6, r2, #0x18
	cmp r6, #0
	bne _08016524
	movs r3, #1
_08016524:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r3, #0
	bl Text_SetParams
	movs r0, #0xff
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080165C0 @ =0x08BE222C
	adds r5, r1, r0
	ldrh r0, [r5]
	bl DecodeMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r1, r7, #4
	adds r0, r4, #0
	bl PutText
	movs r3, #0x14
	adds r3, r3, r7
	mov ip, r3
	movs r1, #1
	cmp r6, #0
	beq _0801656C
	movs r1, #2
_0801656C:
	ldr r0, [r5, #8]
	movs r4, #8
	ands r0, r4
	mov r3, r8
	asrs r2, r3, #8
	cmp r0, #0
	beq _0801657C
	movs r2, #0xff
_0801657C:
	mov r0, ip
	bl PutNumberOrBlank
	adds r3, r7, #0
	adds r3, #0x1a
	movs r1, #1
	cmp r6, #0
	beq _0801658E
	movs r1, #2
_0801658E:
	ldr r0, [r5, #8]
	ands r0, r4
	movs r2, #0xff
	cmp r0, #0
	bne _0801659A
	ldrb r2, [r5, #0x14]
_0801659A:
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #0
	cmp r6, #0
	bne _080165AC
	movs r1, #1
_080165AC:
	movs r2, #0x16
	bl PutSpecialChar
	mov r0, r8
	cmp r0, #0
	bne _080165C4
	movs r1, #1
	rsbs r1, r1, #0
	b _080165C6
	.align 2, 0
_080165C0: .4byte 0x08BE222C
_080165C4:
	ldrb r1, [r5, #0x1d]
_080165C6:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl PutIcon
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
