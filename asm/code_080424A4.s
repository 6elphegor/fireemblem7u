	.include "macro.inc"

	.syntax unified

	thumb_func_start SioMenu_LoadGraphics
SioMenu_LoadGraphics: @ 0x080424A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, _08042538 @ =0x081D5426
	add r0, sp, #8
	movs r2, #5
	bl memcpy
	ldr r4, _0804253C @ =0x0203DA0C
	adds r0, r4, #0
	bl sub_080A1F90
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl sub_08047B34
	ldr r0, _08042540 @ =0x081C50C4
	ldr r1, _08042544 @ =0x06014800
	bl Decompress
	ldr r0, _08042548 @ =0x081C7EA4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #4
	bl sub_08047BD4
	ldr r0, _0804254C @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	str r4, [r6, #0x4c]
	bl IsMultiArenaSaveReady
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08042550
	movs r1, #0
	movs r0, #3
	b _08042554
	.align 2, 0
_08042538: .4byte 0x081D5426
_0804253C: .4byte 0x0203DA0C
_08042540: .4byte 0x081C50C4
_08042544: .4byte 0x06014800
_08042548: .4byte 0x081C7EA4
_0804254C: .4byte 0x0203DA60
_08042550:
	movs r1, #1
	movs r0, #4
_08042554:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _080425DC @ =0x0203D90C
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	movs r4, #4
	adds r7, r2, #0
	adds r5, r6, #0
	adds r5, #0x3c
_08042574:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, r4
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xb0
	movs r2, #0xa0
	bl StartSioMenuItem
	str r0, [r5]
	subs r5, #4
	subs r4, #1
	cmp r4, #0
	bge _08042574
	ldr r0, [r6, #0x2c]
	movs r1, #0
	bl StartLinkArenaTitleBanner
	movs r4, #0
	str r4, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #5
	movs r2, #0
	movs r3, #0xa8
	bl sub_08047E84
	ldr r0, _080425E0 @ =0x08B99600
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xdf
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	str r4, [r6, #0x54]
	movs r0, #0x47
	movs r1, #0
	bl StartBgm
	bl sub_08044FFC
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080425DC: .4byte 0x0203D90C
_080425E0: .4byte 0x08B99600
