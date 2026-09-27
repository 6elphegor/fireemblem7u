	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_Init
ChapterIntro_Init: @ 0x0801F570
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	bl InitBmBgLayers
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801F6F4 @ =0x02022C60
	mov sl, r0
	movs r1, #0
	bl TmFill
	ldr r1, _0801F6F8 @ =0x02023460
	mov sb, r1
	mov r0, sb
	movs r1, #0
	bl TmFill
	ldr r0, _0801F6FC @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _0801F700 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBgChrOffset
	ldr r2, _0801F704 @ =0x03002870
	mov ip, r2
	movs r5, #0x20
	ldrb r0, [r2, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0x34
	add r0, ip
	mov r8, r0
	movs r1, #1
	ldrb r2, [r0]
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	movs r6, #4
	orrs r1, r6
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r7]
	ands r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r1, r5
	mov r2, r8
	strb r1, [r2]
	orrs r0, r5
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x2d
	movs r5, #0
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	subs r0, #5
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	movs r0, #8
	movs r1, #0
	bl PutChapterTitlePalette
	movs r0, #0
	movs r1, #1
	bl PutChapterTitlePalette
	movs r0, #0x80
	bl PutChapterTitleUnkBG
	movs r4, #0x80
	lsls r4, r4, #1
	ldr r0, _0801F708 @ =0x0202BBF8
	bl GetChapterTitle
	adds r1, r0, #0
	adds r0, r4, #0
	bl PutChapterTitleGfx
	movs r0, #0x80
	lsls r0, r0, #2
	add sb, r0
	mov r0, sb
	movs r1, #0
	bl PutChapterTitleBgUnkTsa
	ldr r1, _0801F70C @ =0x00000246
	add sl, r1
	mov r0, sl
	movs r1, #1
	bl PutChapterTitleNameTsa
	bl ColorFadeInit
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #0
	movs r1, #2
	movs r2, #0x40
	bl sub_08002218
	bl ColorFadeTick_thm
	bl EnablePalSync
	ldr r0, _0801F710 @ =0x083FF780
	ldr r1, _0801F714 @ =0x0600A000
	bl Decompress
	ldr r0, _0801F718 @ =0x08401404
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801F71C @ =0x083FE578
	ldr r1, _0801F720 @ =0x06008020
	bl Decompress
	ldr r0, _0801F724 @ =0x083FF760
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0x80
	lsls r0, r0, #3
	bl SetBlankChr
	ldr r0, _0801F728 @ =0x02022860
	strh r5, [r0]
	bl PutChapterIntroMotif
	bl PutScreenFogEffect
	movs r0, #0xf
	bl EnableBgSync
	ldr r0, [sp]
	adds r0, #0x52
	strh r5, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F6F4: .4byte 0x02022C60
_0801F6F8: .4byte 0x02023460
_0801F6FC: .4byte 0x02023C60
_0801F700: .4byte 0x02024460
_0801F704: .4byte 0x03002870
_0801F708: .4byte 0x0202BBF8
_0801F70C: .4byte 0x00000246
_0801F710: .4byte 0x083FF780
_0801F714: .4byte 0x0600A000
_0801F718: .4byte 0x08401404
_0801F71C: .4byte 0x083FE578
_0801F720: .4byte 0x06008020
_0801F724: .4byte 0x083FF760
_0801F728: .4byte 0x02022860
