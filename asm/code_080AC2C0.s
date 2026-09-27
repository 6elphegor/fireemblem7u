	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC2C0
sub_080AC2C0: @ 0x080AC2C0
	push {r4, r5, r6, lr}
	ldr r6, _080AC368 @ =0x06014000
	ldr r4, _080AC36C @ =0x0201EA50
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl InitSpriteTextFont
	ldr r0, _080AC370 @ =0x08194674
	movs r5, #0xd0
	lsls r5, r5, #2
	adds r1, r5, #0
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080AC374 @ =0x02022860
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0]
	bl EnablePalSync
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r4, #0x28
	movs r5, #2
_080AC304:
	adds r0, r4, #0
	bl InitSpriteText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080AC304
	movs r0, #0
	bl SetTextFont
	ldr r4, _080AC36C @ =0x0201EA50
	ldr r0, _080AC378 @ =0x0001FFFF
	ands r0, r6
	lsrs r0, r0, #5
	ldr r2, _080AC37C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #8
	adds r1, r2, #0
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #2
	bl InitText
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetCursor
	ldr r1, _080AC380 @ =0x08418E40
	adds r0, r4, #0
	bl Text_DrawString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC368: .4byte 0x06014000
_080AC36C: .4byte 0x0201EA50
_080AC370: .4byte 0x08194674
_080AC374: .4byte 0x02022860
_080AC378: .4byte 0x0001FFFF
_080AC37C: .4byte 0x000003FF
_080AC380: .4byte 0x08418E40
