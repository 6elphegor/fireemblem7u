	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043A14
sub_08043A14: @ 0x08043A14
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _08043AF8 @ =0x081D2B3C
	ldr r1, _08043AFC @ =0x06012800
	bl Decompress
	ldr r0, _08043B00 @ =0x081D3598
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0xc0
	bl ApplyPaletteExt
	ldr r0, _08043B04 @ =0x02000C60
	ldr r1, _08043B08 @ =0x06015000
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _08043B0C @ =0x08194674
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	movs r5, #0
	ldr r0, _08043B10 @ =0x02000C04
	mov r8, r0
	movs r1, #5
	add r1, r8
	mov sb, r1
_08043A5E:
	lsls r0, r5, #2
	adds r2, r6, #0
	adds r2, #0x2c
	adds r2, r2, r0
	mov r0, r8
	adds r0, #9
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, #1
	mov r0, r8
	adds r0, #1
	adds r0, r5, r0
	ldrb r3, [r0]
	subs r1, r1, r3
	str r1, [r2]
	ldrb r0, [r0]
	movs r7, #1
	cmp r0, #0
	beq _08043A88
	movs r7, #0
_08043A88:
	lsls r4, r5, #3
	ldr r0, _08043B14 @ =0x02000C40
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	mov r1, sb
	adds r0, r5, r1
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0804397C
	lsls r2, r5, #1
	adds r0, r6, #0
	adds r0, #0x38
	adds r0, r0, r2
	movs r1, #0x18
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3e
	adds r1, r1, r2
	lsls r0, r5, #5
	adds r0, #0x20
	strh r0, [r1]
	adds r5, #1
	cmp r5, #2
	ble _08043A5E
	ldr r4, _08043B18 @ =0x02000C58
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	bl sub_080439D0
	movs r0, #0
	str r0, [r6, #0x48]
	str r0, [r6, #0x44]
	str r0, [r6, #0x54]
	str r0, [r6, #0x50]
	str r0, [r6, #0x4c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043AF8: .4byte 0x081D2B3C
_08043AFC: .4byte 0x06012800
_08043B00: .4byte 0x081D3598
_08043B04: .4byte 0x02000C60
_08043B08: .4byte 0x06015000
_08043B0C: .4byte 0x08194674
_08043B10: .4byte 0x02000C04
_08043B14: .4byte 0x02000C40
_08043B18: .4byte 0x02000C58
