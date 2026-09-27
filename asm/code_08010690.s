	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010690
sub_08010690: @ 0x08010690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	movs r6, #0
	ldr r0, _08010788 @ =0x08B91EDC
	ldr r1, [sp, #0x44]
	bl Proc_Start
	adds r7, r0, #0
	adds r0, r4, #0
	bl DecodeMsg
	mov sl, r0
	mov r0, r8
	str r0, [r7, #0x30]
	mov r2, sb
	str r2, [r7, #0x34]
	str r5, [r7, #0x38]
	ldr r0, [sp, #0x40]
	str r0, [r7, #0x3c]
	str r4, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x48
	strh r6, [r0]
	ldr r0, _0801078C @ =0x08B91EFC
	ldr r1, [sp, #0x44]
	bl Proc_StartBlocking
	ldr r0, _08010790 @ =0x0842535C
	ldr r1, [r7, #0x3c]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08010794 @ =0x08194674
	ldr r1, [r7, #0x3c]
	adds r1, #0x11
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08010798 @ =0x084251BC
	ldr r1, [r7, #0x38]
	ldr r2, _0801079C @ =0x06010000
	adds r1, r1, r2
	bl Decompress
	mov r0, sl
	bl GetStringTextLen
	adds r6, r0, #0
	cmp r6, #0
	bge _0801070C
	adds r0, r6, #7
_0801070C:
	asrs r5, r0, #3
	adds r6, r5, #5
	str r6, [r7, #0x44]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	bge _0801071C
	movs r0, #8
	str r0, [r7, #0x30]
_0801071C:
	ldr r0, [r7, #0x44]
	lsls r1, r0, #3
	ldr r0, [r7, #0x30]
	adds r0, r0, r1
	cmp r0, #0xf0
	ble _0801072E
	movs r0, #0xe8
	subs r0, r0, r1
	str r0, [r7, #0x30]
_0801072E:
	ldr r1, [r7, #0x38]
	ldr r0, _080107A0 @ =0x06010400
	adds r1, r1, r0
	ldr r2, [r7, #0x3c]
	adds r2, #0x12
	mov r0, sp
	bl InitSpriteTextFont
	mov r0, sp
	bl SetTextFont
	add r4, sp, #0x18
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #3
	lsls r0, r0, #3
	mov r1, sl
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	mov r3, sl
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010788: .4byte 0x08B91EDC
_0801078C: .4byte 0x08B91EFC
_08010790: .4byte 0x0842535C
_08010794: .4byte 0x08194674
_08010798: .4byte 0x084251BC
_0801079C: .4byte 0x06010000
_080107A0: .4byte 0x06010400
