	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E490
sub_0803E490: @ 0x0803E490
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r4, _0803E670 @ =0x08194674
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _0803E674 @ =0x081C5BE0
	ldr r1, _0803E678 @ =0x06014800
	bl Decompress
	movs r0, #0
	movs r1, #2
	bl sub_08047BD4
	ldr r0, _0803E67C @ =0x02023D72
	ldr r1, _0803E680 @ =0x081C827C
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _0803E684 @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _0803E688 @ =0x081C64A4
	ldr r1, _0803E68C @ =0x06016000
	bl Decompress
	ldr r0, _0803E690 @ =0x0840624C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r2, _0803E694 @ =0x02022860
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	adds r2, #0x42
	movs r3, #2
_0803E4EE:
	ldrh r0, [r4, #8]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0803E4EE
	bl EnablePalSync
	ldr r0, _0803E698 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl ForceSyncUnitSpriteSheet
	ldr r0, [r7, #0x3c]
	ldr r1, _0803E69C @ =0x0203D90C
	ldrb r1, [r1]
	bl sub_0803DF48
	str r0, [r7, #0x38]
	adds r6, r7, #0
	adds r6, #0x5c
	adds r5, r7, #0
	adds r5, #0x4a
	movs r1, #0
	add r0, sp, #0xc
_0803E536:
	strb r1, [r0]
	subs r0, #1
	add r2, sp, #8
	cmp r0, r2
	bge _0803E536
	ldr r0, [r7, #0x3c]
	mov r1, sp
	adds r1, r1, r0
	adds r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r4, _0803E69C @ =0x0203D90C
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_0803E358
	str r0, [r7, #0x34]
	adds r0, r7, #0
	bl sub_0803E0B8
	ldr r1, [r7, #0x34]
	adds r0, r7, #0
	add r2, sp, #8
	bl sub_08048504
	str r0, [r7, #0x2c]
	movs r3, #0
	adds r4, #6
	movs r2, #0xff
_0803E570:
	adds r1, r3, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r3, #1
	cmp r3, #3
	ble _0803E570
	movs r4, #0
	strb r4, [r6]
	ldrh r2, [r5]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _0803E6A0 @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r2, #0xf0
	strb r2, [r0]
	adds r0, #4
	movs r1, #0x88
	strb r1, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #4
	strb r1, [r0]
	subs r0, #5
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x32
	movs r0, #0xa0
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r2, #1
	ldrb r0, [r5]
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0x35
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	orrs r2, r1
	ands r2, r5
	orrs r2, r4
	orrs r2, r3
	orrs r2, r6
	strb r2, [r0]
	ldr r0, [r7, #0x2c]
	ldr r1, _0803E6A4 @ =0x081D5260
	ldr r4, _0803E69C @ =0x0203D90C
	ldrb r2, [r4]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl StartLinkArenaTitleBanner
	ldr r0, _0803E6A8 @ =0x08B98CA8
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0803E6AC @ =0x081D5254
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	ldr r2, [r7, #0x2c]
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	adds r0, r7, #0
	bl sub_0803E454
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl PutSioText
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E670: .4byte 0x08194674
_0803E674: .4byte 0x081C5BE0
_0803E678: .4byte 0x06014800
_0803E67C: .4byte 0x02023D72
_0803E680: .4byte 0x081C827C
_0803E684: .4byte 0x081C7F04
_0803E688: .4byte 0x081C64A4
_0803E68C: .4byte 0x06016000
_0803E690: .4byte 0x0840624C
_0803E694: .4byte 0x02022860
_0803E698: .4byte 0x0203DA60
_0803E69C: .4byte 0x0203D90C
_0803E6A0: .4byte 0x03002870
_0803E6A4: .4byte 0x081D5260
_0803E6A8: .4byte 0x08B98CA8
_0803E6AC: .4byte 0x081D5254
