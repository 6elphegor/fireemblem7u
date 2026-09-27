	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044940
sub_08044940: @ 0x08044940
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	movs r0, #0
	mov sl, r0
	ldr r0, _08044A18 @ =0x08194674
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08044A1C @ =0x02000C60
	ldr r1, _08044A20 @ =0x06016800
	movs r2, #3
	bl InitSpriteTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, _08044A24 @ =0x02000C78
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r1, #0
	mov r8, r1
_08044996:
	ldr r0, _08044A28 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldr r1, _08044A2C @ =0x081D5480
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044A44
	ldr r6, _08044A30 @ =0x0203DC9C
	lsls r5, r4, #3
	adds r0, r6, #0
	adds r0, #0x30
	adds r7, r5, r0
	ldr r0, [r7]
	cmp r0, #0
	beq _08044A3C
	ldr r0, _08044A34 @ =0x08B99B5C
	ldr r1, [sp, #0x34]
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x32
	strb r4, [r0]
	adds r0, r5, r6
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x33
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x14
	adds r3, r1, r0
	ldr r1, [r3]
	ldr r0, [r7]
	adds r1, r1, r0
	str r1, [r2, #0x38]
	ldr r0, _08044A38 @ =0x0000270F
	cmp r1, r0
	bls _080449F8
	str r0, [r2, #0x38]
_080449F8:
	ldr r0, [r2, #0x38]
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [r2, #0x34]
	adds r0, r2, #0
	adds r0, #0x40
	mov r1, sb
	strb r1, [r0]
	adds r0, #8
	movs r1, #4
	bl InitTextDb
	movs r0, #1
	add sl, r0
	b _08044A44
	.align 2, 0
_08044A18: .4byte 0x08194674
_08044A1C: .4byte 0x02000C60
_08044A20: .4byte 0x06016800
_08044A24: .4byte 0x02000C78
_08044A28: .4byte 0x08B98AEC
_08044A2C: .4byte 0x081D5480
_08044A30: .4byte 0x0203DC9C
_08044A34: .4byte 0x08B99B5C
_08044A38: .4byte 0x0000270F
_08044A3C:
	mov r0, sp
	movs r1, #4
	bl InitTextDb
_08044A44:
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #3
	ble _08044996
	mov r1, sl
	cmp r1, #0
	beq _08044A78
	mov r0, sb
	cmp r0, #0
	beq _08044A6E
	ldr r0, _08044A74 @ =0x08B99B9C
	ldr r1, [sp, #0x34]
	bl Proc_StartBlocking
	ldr r1, [sp, #8]
	str r1, [r0, #0x2c]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x30]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0x54]
_08044A6E:
	movs r0, #1
	b _08044A7A
	.align 2, 0
_08044A74: .4byte 0x08B99B9C
_08044A78:
	movs r0, #0
_08044A7A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
