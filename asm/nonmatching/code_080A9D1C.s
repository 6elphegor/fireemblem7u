	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A9D1C
sub_080A9D1C: @ 0x080A9D1C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	mov r8, r2
	adds r7, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r4, _080A9DB4 @ =0x08CE4C38
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r6, r0, #0
	adds r0, #0x2c
	ldr r1, _080A9DB8 @ =0x06010000
	adds r5, r5, r1
	adds r1, r5, #0
	mov r2, sb
	bl InitSpriteTextFont
	mov r0, r8
	str r0, [r6, #0x54]
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strh r1, [r0]
	cmp r7, #0
	ble _080A9D86
	adds r4, r6, #0
	adds r4, #0x44
	adds r5, r7, #0
_080A9D70:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _080A9D70
_080A9D86:
	ldr r0, _080A9DBC @ =0x08194674
	mov r1, sb
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9DB4: .4byte 0x08CE4C38
_080A9DB8: .4byte 0x06010000
_080A9DBC: .4byte 0x08194674
