	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_SetTimer
ChapterIntro_SetTimer: @ 0x08020098
	adds r1, #0x4c
	strh r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start ChapterIntro_TickTimer
ChapterIntro_TickTimer: @ 0x080200A0
	push {lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _080200B4
	adds r0, r3, #0
	bl Proc_Break
	b _080200CA
_080200B4:
	adds r0, r3, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080200CA
	adds r0, r3, #0
	bl Proc_Break
_080200CA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ChapterIntro_SetFasten
ChapterIntro_SetFasten: @ 0x080200D0
	adds r0, #0x52
	movs r1, #2
	strh r1, [r0]
	bx lr

	thumb_func_start ChapterIntro_8021188
ChapterIntro_8021188: @ 0x080200D8
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0802010C
	bl ColorFadeTick_thm
	ldr r0, _08020114 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08020102
	bl ApplyFlamesWeatherGradient
_08020102:
	bl EnableTilesetPalAnim
	adds r0, r4, #0
	bl Proc_Break
_0802010C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020114: .4byte 0x0202BBF8

	thumb_func_start GameOverScreen_RandomScroll_Init
GameOverScreen_RandomScroll_Init: @ 0x08020118
	adds r2, r0, #0
	movs r0, #0x2e
	str r0, [r2, #0x34]
	subs r0, #0x88
	str r0, [r2, #0x38]
	adds r0, #0x4a
	str r0, [r2, #0x3c]
	subs r0, #0x25
	str r0, [r2, #0x40]
	adds r1, r2, #0
	adds r1, #0x64
	ldr r0, _08020148 @ =0x000004D2
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0802014C @ =0x0000162E
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08020150 @ =0x000018CA
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08020154 @ =0x00002158
	strh r0, [r1]
	bx lr
	.align 2, 0
_08020148: .4byte 0x000004D2
_0802014C: .4byte 0x0000162E
_08020150: .4byte 0x000018CA
_08020154: .4byte 0x00002158

	thumb_func_start sub_08020158
sub_08020158: @ 0x08020158
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r2, #0x34]
	ldrh r4, [r1]
	adds r0, r3, r4
	strh r0, [r1]
	adds r3, r2, #0
	adds r3, #0x66
	ldrh r5, [r2, #0x38]
	ldrh r6, [r3]
	adds r0, r5, r6
	strh r0, [r3]
	adds r4, r2, #0
	adds r4, #0x68
	ldrh r5, [r2, #0x3c]
	ldrh r6, [r4]
	adds r0, r5, r6
	strh r0, [r4]
	adds r5, r2, #0
	adds r5, #0x6a
	ldr r0, [r2, #0x40]
	ldrh r2, [r5]
	adds r0, r2, r0
	strh r0, [r5]
	movs r6, #0
	ldrsh r1, [r1, r6]
	rsbs r1, r1, #0
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r3, r0]
	rsbs r2, r2, #0
	lsls r2, r2, #8
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	movs r2, #0
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r5, r3]
	rsbs r2, r2, #0
	lsls r2, r2, #8
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GameOverScreenHBlank
GameOverScreenHBlank: @ 0x080201C8
	push {lr}
	ldr r0, _08020204 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xa0
	bls _080201DA
	movs r1, #0
_080201DA:
	cmp r1, #0x50
	bls _080201E6
	movs r0, #0xa0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080201E6:
	adds r0, r1, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x10
	bls _080201F8
	movs r1, #0x10
_080201F8:
	ldr r0, _08020208 @ =0x04000052
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08020204: .4byte 0x04000006
_08020208: .4byte 0x04000052

	thumb_func_start sub_0802020C
sub_0802020C: @ 0x0802020C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl LockBmDisplay
	movs r0, #0x2b
	movs r1, #0
	bl StartBgm
	ldr r4, _08020320 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #3
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _08020324 @ =0x08402250
	ldr r1, _08020328 @ =0x06001000
	bl Decompress
	ldr r0, _0802032C @ =0x084025A8
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020330 @ =0x083FF780
	ldr r1, _08020334 @ =0x06002000
	bl Decompress
	ldr r0, _08020338 @ =0x08402588
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearUi
	ldr r0, _0802033C @ =0x02022EAE
	ldr r1, _08020340 @ =0x084025C8
	movs r2, #0x80
	bl TmApplyTsa_thm
	bl PutScreenFogEffectOverlayed
	bl PutScreenFogEffect
	movs r0, #0xc
	bl EnableBgSync
	ldr r0, _08020344 @ =GameOverScreenHBlank
	bl SetOnHBlankA
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _08020348 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0802034C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	bl ColorFadeInit
	ldr r4, _08020350 @ =0x02022860
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	adds r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	adds r5, #0x4c
	movs r0, #0x15
	strh r0, [r5]
	movs r4, #9
_0802030C:
	bl ColorFadeTick_thm
	subs r4, #1
	cmp r4, #0
	bge _0802030C
	bl EnablePalSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020320: .4byte 0x03002870
_08020324: .4byte 0x08402250
_08020328: .4byte 0x06001000
_0802032C: .4byte 0x084025A8
_08020330: .4byte 0x083FF780
_08020334: .4byte 0x06002000
_08020338: .4byte 0x08402588
_0802033C: .4byte 0x02022EAE
_08020340: .4byte 0x084025C8
_08020344: .4byte GameOverScreenHBlank
_08020348: .4byte 0x0000FFE0
_0802034C: .4byte 0x0000E0FF
_08020350: .4byte 0x02022860

	thumb_func_start GameOverScreen_LoopFadeIn
GameOverScreen_LoopFadeIn: @ 0x08020354
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _08020382
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08020382
	adds r0, r4, #0
	bl Proc_Break
_08020382:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start GameOverScreen_BeginIdle
GameOverScreen_BeginIdle: @ 0x08020388
	adds r0, #0x4e
	ldr r1, _08020390 @ =0x000005DC
	strh r1, [r0]
	bx lr
	.align 2, 0
_08020390: .4byte 0x000005DC

	thumb_func_start sub_08020394
sub_08020394: @ 0x08020394
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080203B0
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_080203B0:
	ldr r0, _080203CC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080203C6
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_080203C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080203CC: .4byte 0x08B857F8

	thumb_func_start GameOverScreen_BeginFadeOut
GameOverScreen_BeginFadeOut: @ 0x080203D0
	push {r4, r5, lr}
	bl ColorFadeInit
	ldr r4, _08020404 @ =0x02022860
	movs r5, #1
	rsbs r5, r5, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl MaybeSmoothChangeSomePal
	adds r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl MaybeSmoothChangeSomePal
	movs r0, #4
	bl FadeBgmOut
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020404: .4byte 0x02022860

	thumb_func_start GameOverScreen_LoopFadeOut
GameOverScreen_LoopFadeOut: @ 0x08020408
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0802042C
	adds r0, r4, #0
	bl Proc_Break
_0802042C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08020434
sub_08020434: @ 0x08020434
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl SetOnHBlankB
	ldr r2, _08020470 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _08020474 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08020470: .4byte 0x03002870
_08020474: .4byte 0x02022860

	thumb_func_start sub_08020478
sub_08020478: @ 0x08020478
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0802048C
	ldr r0, _08020488 @ =0x08B93B1C
	bl Proc_StartBlocking
	b _08020494
	.align 2, 0
_08020488: .4byte 0x08B93B1C
_0802048C:
	ldr r0, _08020498 @ =0x08B93B1C
	movs r1, #3
	bl Proc_Start
_08020494:
	pop {r0}
	bx r0
	.align 2, 0
_08020498: .4byte 0x08B93B1C

	thumb_func_start sub_0802049C
sub_0802049C: @ 0x0802049C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020540 @ =0x08199B34
	ldr r1, _08020544 @ =0x06002000
	bl Decompress
	ldr r0, _08020548 @ =0x0819B258
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0802054C @ =0x0819B278
	ldr r4, _08020550 @ =0x0200323C
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_080204C6:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _080204C6
	ldr r0, _08020554 @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, _08020558 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080204F8
	movs r0, #0xb6
	lsls r0, r0, #2
	bl m4aSongNumStart
_080204F8:
	ldr r3, _0802055C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08020560 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020564 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020540: .4byte 0x08199B34
_08020544: .4byte 0x06002000
_08020548: .4byte 0x0819B258
_0802054C: .4byte 0x0819B278
_08020550: .4byte 0x0200323C
_08020554: .4byte 0x02022C60
_08020558: .4byte 0x0202BBF8
_0802055C: .4byte 0x03002870
_08020560: .4byte 0x0000FFE0
_08020564: .4byte 0x0000E0FF

	thumb_func_start sub_08020568
sub_08020568: @ 0x08020568
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r6, r0, #0
	ldr r1, _080205A4 @ =0x081C3BC4
	mov r0, sp
	movs r2, #0x34
	bl memcpy
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _080205A8
	adds r0, r6, #0
	bl Proc_Break
	b _080205CE
	.align 2, 0
_080205A4: .4byte 0x081C3BC4
_080205A8:
	cmp r4, #0x18
	bne _080205B4
	cmp r5, #9
	bne _080205B4
	bl RefreshUnitSprites
_080205B4:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _080205D8 @ =0x0200323C
	adds r0, r0, r1
	ldr r1, _080205DC @ =0x02022C60
	movs r2, #8
	movs r3, #9
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_080205CE:
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080205D8: .4byte 0x0200323C
_080205DC: .4byte 0x02022C60

	thumb_func_start sub_080205E0
sub_080205E0: @ 0x080205E0
	push {lr}
	ldr r3, _08020614 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _08020618 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08020614: .4byte 0x03002870
_08020618: .4byte 0x02022C60

	thumb_func_start StartLightRuneAnim3
StartLightRuneAnim3: @ 0x0802061C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08020660 @ =0x08B93B74
	adds r1, r3, #0
	bl Proc_StartBlocking
	lsls r0, r4, #4
	ldr r2, _08020664 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x18
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020660: .4byte 0x08B93B74
_08020664: .4byte 0x0202BBB8

	thumb_func_start ProcDanceAnim_Init
ProcDanceAnim_Init: @ 0x08020668
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080206F8 @ =0x081B9BDC
	ldr r1, _080206FC @ =0x06002000
	bl Decompress
	ldr r0, _08020700 @ =0x081BABFC
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020704 @ =0x081BA9C0
	ldr r4, _08020708 @ =0x0200323C
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0x90
	lsls r5, r5, #2
_08020692:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08020692
	ldr r0, _0802070C @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r3, _08020710 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08020714 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020718 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080206F8: .4byte 0x081B9BDC
_080206FC: .4byte 0x06002000
_08020700: .4byte 0x081BABFC
_08020704: .4byte 0x081BA9C0
_08020708: .4byte 0x0200323C
_0802070C: .4byte 0x02022C60
_08020710: .4byte 0x03002870
_08020714: .4byte 0x0000FFE0
_08020718: .4byte 0x0000E0FF

	thumb_func_start ProcDanceAnim_Loop
ProcDanceAnim_Loop: @ 0x0802071C
	push {r4, lr}
	sub sp, #0x38
	adds r4, r0, #0
	ldr r1, _08020754 @ =0x081C3BF8
	mov r0, sp
	movs r2, #0x38
	bl memcpy
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	cmp r1, #0xff
	bne _08020758
	adds r0, r4, #0
	bl Proc_Break
	b _08020772
	.align 2, 0
_08020754: .4byte 0x081C3BF8
_08020758:
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0802077C @ =0x0200323C
	adds r0, r0, r1
	ldr r1, _08020780 @ =0x02022C60
	movs r2, #6
	movs r3, #6
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_08020772:
	add sp, #0x38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802077C: .4byte 0x0200323C
_08020780: .4byte 0x02022C60

	thumb_func_start sub_08020784
sub_08020784: @ 0x08020784
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start ProcDanceAnim_Loop_Blend
ProcDanceAnim_Loop_Blend: @ 0x0802078C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080207D8 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r3, r5, #0
	adds r3, #0x4c
	ldrh r0, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	mov r4, ip
	adds r4, #0x45
	movs r1, #0x10
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x46
	strb r2, [r1]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080207D0
	adds r0, r5, #0
	bl Proc_Break
_080207D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080207D8: .4byte 0x03002870

	thumb_func_start StartDanceringAnim
StartDanceringAnim: @ 0x080207DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08020838 @ =0x0203A3D8
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08020832
	ldr r0, _0802083C @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r0, _08020840 @ =0x08B93B94
	adds r1, r6, #0
	bl Proc_StartBlocking
	lsls r0, r4, #4
	ldr r2, _08020844 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x10
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x10
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
_08020832:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020838: .4byte 0x0203A3D8
_0802083C: .4byte 0x0203A85C
_08020840: .4byte 0x08B93B94
_08020844: .4byte 0x0202BBB8

	thumb_func_start ProcEventWrapAnim_Init
ProcEventWrapAnim_Init: @ 0x08020848
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020900 @ =0x0819C848
	ldr r1, _08020904 @ =0x06002000
	bl Decompress
	ldr r0, _08020908 @ =0x0819CF90
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0802090C @ =0x0819CFB0
	ldr r4, _08020910 @ =0x0200323C
	adds r1, r4, #0
	bl Decompress
	movs r0, #0xa2
	lsls r0, r0, #7
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_08020872:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08020872
	ldr r0, _08020914 @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, _08020918 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080208A2
	movs r0, #0xb4
	bl m4aSongNumStart
_080208A2:
	ldr r3, _0802091C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _08020920 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020924 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020900: .4byte 0x0819C848
_08020904: .4byte 0x06002000
_08020908: .4byte 0x0819CF90
_0802090C: .4byte 0x0819CFB0
_08020910: .4byte 0x0200323C
_08020914: .4byte 0x02022C60
_08020918: .4byte 0x0202BBF8
_0802091C: .4byte 0x03002870
_08020920: .4byte 0x0000FFE0
_08020924: .4byte 0x0000E0FF

	thumb_func_start ProcEventWrapAnim_Loop
ProcEventWrapAnim_Loop: @ 0x08020928
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, _08020984 @ =0x08B93C10
	cmp r0, #0
	bne _0802093A
	ldr r4, _08020988 @ =0x08B93BCC
_0802093A:
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r3, #0
	adds r2, #0x4c
	cmp r0, #0
	beq _0802095E
	ldr r0, _0802098C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0802095E
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_0802095E:
	ldrh r6, [r2]
	adds r6, #1
	strh r6, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _08020990
	adds r0, r3, #0
	bl Proc_Break
	b _080209B6
	.align 2, 0
_08020984: .4byte 0x08B93C10
_08020988: .4byte 0x08B93BCC
_0802098C: .4byte 0x08B857F8
_08020990:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0802099C
	bl RefreshUnitSprites
_0802099C:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _080209BC @ =0x0200323C
	adds r0, r0, r1
	ldr r1, _080209C0 @ =0x02022C60
	movs r2, #4
	movs r3, #7
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_080209B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080209BC: .4byte 0x0200323C
_080209C0: .4byte 0x02022C60

	thumb_func_start ProcEventWrapAnim_End
ProcEventWrapAnim_End: @ 0x080209C4
	push {lr}
	ldr r0, _080209EC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080209D8
	movs r0, #0xb5
	bl m4aSongNumStart
_080209D8:
	ldr r0, _080209F0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080209EC: .4byte 0x0202BBF8
_080209F0: .4byte 0x02022C60

	thumb_func_start StartEventWarpAnim
StartEventWarpAnim: @ 0x080209F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08020A5C @ =0x08B93C54
	adds r1, r6, #0
	bl Proc_Start
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r0, #0
	adds r1, #0x64
	strh r4, [r1]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r0, #0x66
	strh r5, [r0]
	lsls r0, r7, #4
	ldr r2, _08020A60 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r7, r0, #0
	subs r7, #8
	mov r1, r8
	lsls r0, r1, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	subs r0, #0x20
	rsbs r1, r7, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020A5C: .4byte 0x08B93C54
_08020A60: .4byte 0x0202BBB8

	thumb_func_start StartWarpEffect_08020A64
StartWarpEffect_08020A64: @ 0x08020A64
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08020AB4 @ =0x08B93C54
	mov r1, r8
	bl Proc_Start
	adds r3, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x64
	strh r4, [r0]
	rsbs r5, r5, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	rsbs r6, r6, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r6, #0
	str r3, [sp]
	bl SetBgOffset
	ldr r3, [sp]
	adds r3, #0x66
	movs r0, #1
	strh r0, [r3]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020AB4: .4byte 0x08B93C54

	thumb_func_start WarpEffectExists
WarpEffectExists: @ 0x08020AB8
	push {lr}
	ldr r0, _08020ACC @ =0x08B93C54
	bl Proc_Find
	cmp r0, #0
	beq _08020AC6
	movs r0, #1
_08020AC6:
	pop {r1}
	bx r1
	.align 2, 0
_08020ACC: .4byte 0x08B93C54

	thumb_func_start sub_08020AD0
sub_08020AD0: @ 0x08020AD0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020B60 @ =0x0819B558
	ldr r1, _08020B64 @ =0x06002000
	bl Decompress
	ldr r0, _08020B68 @ =0x0819C56C
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020B6C @ =0x0819C58C
	ldr r4, _08020B70 @ =0x0200323C
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_08020AFA:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08020AFA
	ldr r0, _08020B74 @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r3, _08020B78 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08020B7C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020B80 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020B60: .4byte 0x0819B558
_08020B64: .4byte 0x06002000
_08020B68: .4byte 0x0819C56C
_08020B6C: .4byte 0x0819C58C
_08020B70: .4byte 0x0200323C
_08020B74: .4byte 0x02022C60
_08020B78: .4byte 0x03002870
_08020B7C: .4byte 0x0000FFE0
_08020B80: .4byte 0x0000E0FF

	thumb_func_start sub_08020B84
sub_08020B84: @ 0x08020B84
	push {r4, r5, r6, lr}
	sub sp, #0x38
	adds r6, r0, #0
	ldr r1, _08020BC0 @ =0x081C3C30
	mov r0, sp
	movs r2, #0x38
	bl memcpy
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _08020BC4
	adds r0, r6, #0
	bl Proc_Break
	b _08020BEA
	.align 2, 0
_08020BC0: .4byte 0x081C3C30
_08020BC4:
	cmp r4, #0
	bne _08020BD0
	cmp r5, #0x10
	bne _08020BD0
	bl RefreshUnitSprites
_08020BD0:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08020BF4 @ =0x0200323C
	adds r0, r0, r1
	ldr r1, _08020BF8 @ =0x02022C60
	movs r2, #6
	movs r3, #8
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_08020BEA:
	add sp, #0x38
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020BF4: .4byte 0x0200323C
_08020BF8: .4byte 0x02022C60

	thumb_func_start sub_08020BFC
sub_08020BFC: @ 0x08020BFC
	push {lr}
	ldr r0, _08020C10 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08020C10: .4byte 0x02022C60

	thumb_func_start sub_08020C14
sub_08020C14: @ 0x08020C14
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08020C54 @ =0x08B93C7C
	movs r1, #3
	bl Proc_Start
	lsls r0, r4, #4
	ldr r2, _08020C58 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x10
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020C54: .4byte 0x08B93C7C
_08020C58: .4byte 0x0202BBB8

	thumb_func_start ProcWhiteCircleFx_Loop
ProcWhiteCircleFx_Loop: @ 0x08020C5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r2, r7, #0
	adds r2, #0x4c
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	movs r1, #0x40
	subs r1, r1, r0
	mov sb, r1
	movs r0, #0
	mov sl, r2
_08020C7E:
	movs r6, #0
	lsls r5, r0, #3
	adds r1, r0, #1
	mov r8, r1
	lsls r0, r0, #6
	ldr r2, _08020D14 @ =0x02022C60
	adds r4, r0, r2
_08020C8C:
	lsls r2, r6, #3
	ldr r1, [r7, #0x2c]
	subs r0, r1, r2
	cmp r0, #0
	bge _08020C98
	subs r0, r2, r1
_08020C98:
	ldr r2, [r7, #0x30]
	subs r1, r2, r5
	cmp r1, #0
	bge _08020CA2
	subs r1, r5, r2
_08020CA2:
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, sb
	cmp r0, #0
	bge _08020CC0
	adds r0, #3
_08020CC0:
	asrs r1, r0, #2
	movs r0, #0xf
	subs r0, r0, r1
	cmp r0, #0xf
	ble _08020CCC
	movs r0, #0xf
_08020CCC:
	cmp r0, #0
	bge _08020CD2
	movs r0, #0
_08020CD2:
	movs r1, #0x84
	lsls r1, r1, #6
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #0x1d
	ble _08020C8C
	mov r0, r8
	cmp r0, #0x13
	ble _08020C7E
	movs r0, #1
	bl EnableBgSync
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x46
	ble _08020D04
	adds r0, r7, #0
	bl Proc_Break
_08020D04:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020D14: .4byte 0x02022C60

	thumb_func_start sub_08020D18
sub_08020D18: @ 0x08020D18
	push {lr}
	ldr r3, _08020D60 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08020D64 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _08020D68 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_08020D60: .4byte 0x03002870
_08020D64: .4byte 0x0000FFE0
_08020D68: .4byte 0x0000E0FF

	thumb_func_start sub_08020D6C
sub_08020D6C: @ 0x08020D6C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r2, _08020E18 @ =0x06002000
	movs r1, #0
	ldr r4, _08020E1C @ =0x11111111
	movs r3, #0x1f
_08020D7C:
	movs r0, #7
_08020D7E:
	stm r2!, {r1}
	subs r0, #1
	cmp r0, #0
	bge _08020D7E
	adds r1, r1, r4
	subs r3, #1
	cmp r3, #0
	bge _08020D7C
	movs r3, #0
	ldr r0, _08020E20 @ =0x02022860
	adds r4, r0, #0
	adds r4, #0x40
_08020D96:
	lsls r0, r3, #1
	lsls r1, r3, #0xb
	lsls r2, r3, #6
	adds r1, r1, r2
	adds r1, r1, r0
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xf
	ble _08020D96
	movs r4, #0
	bl EnablePalSync
	ldr r3, _08020E24 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _08020E28 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020E2C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearUi
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _08020E30 @ =0x08B93CA4
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020E18: .4byte 0x06002000
_08020E1C: .4byte 0x11111111
_08020E20: .4byte 0x02022860
_08020E24: .4byte 0x03002870
_08020E28: .4byte 0x0000FFE0
_08020E2C: .4byte 0x0000E0FF
_08020E30: .4byte 0x08B93CA4

	thumb_func_start ProcEmitSingleStar_Init
ProcEmitSingleStar_Init: @ 0x08020E34
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	str r0, [r4, #0x3c]
	bl RandNextB
	ldr r1, _08020E64 @ =0x000003FF
	ands r1, r0
	ldr r0, [r4, #0x14]
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r1, r1, r0
	rsbs r1, r1, #0
	str r1, [r4, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020E64: .4byte 0x000003FF

	thumb_func_start sub_08020E68
sub_08020E68: @ 0x08020E68
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08020E86
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08020EA2
_08020E86:
	ldr r2, [r4, #0x34]
	ldr r0, [r4, #0x3c]
	adds r2, r2, r0
	str r2, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x40]
	adds r1, r1, r0
	str r1, [r4, #0x38]
	ldr r0, [r4, #0x2c]
	adds r0, r0, r2
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_08020EA2:
	ldr r2, [r4, #0x30]
	cmp r2, #0
	bge _08020EBA
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	b _08020ECE
_08020EBA:
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	asrs r2, r2, #0x10
	ldr r3, _08020ED8 @ =0x08B905B0
	movs r0, #0xa0
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #0xa
	bl PutSprite
_08020ECE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020ED8: .4byte 0x08B905B0

	thumb_func_start Calcs_Interpolate
Calcs_Interpolate: @ 0x08020EDC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	mov sb, r3
	ldr r6, [sp, #0x1c]
	ldr r1, [r5]
	movs r4, #0x80
	lsls r4, r4, #1
	str r4, [sp]
	movs r0, #0
	adds r3, r6, #0
	bl Interpolate
	str r0, [r5]
	mov r0, r8
	ldr r1, [r0]
	str r4, [sp]
	movs r0, #0
	mov r2, sb
	adds r3, r6, #0
	bl Interpolate
	mov r1, r8
	str r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08020F24
sub_08020F24: @ 0x08020F24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08020F40
	b _0802106A
_08020F40:
	movs r0, #0
	mov sb, r0
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #0x28
	ble _08020F54
	b _0802106A
_08020F54:
	movs r3, #0x64
	adds r3, r3, r6
	mov sl, r3
	mov r7, sl
_08020F5C:
	ldr r0, _08021020 @ =0x08B93CBC
	adds r1, r6, #0
	bl Proc_Start
	adds r5, r0, #0
	bl RandNextB
	ldr r1, [r6, #0x34]
	lsls r1, r1, #0x10
	ldr r4, _08021024 @ =0x0000FFFF
	ands r0, r4
	lsls r0, r0, #4
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl RandNextB
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r4, r5, #0
	adds r4, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	movs r5, #0
	ldrsh r0, [r7, r5]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _08020FA6
	movs r0, #0x80
	lsls r0, r0, #1
_08020FA6:
	str r0, [sp]
	adds r0, r4, #0
	bl Calcs_Interpolate
	mov r2, r8
	ldrh r1, [r2]
	adds r1, #1
	strh r1, [r2]
	movs r3, #1
	add sb, r3
	mov r4, sb
	cmp r4, #0
	bgt _08020FC8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _08020F5C
_08020FC8:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bgt _0802106A
	ldr r0, _08021020 @ =0x08B93CBC
	adds r1, r6, #0
	bl Proc_Start
	adds r5, r0, #0
	bl RandNextB
	ldr r1, [r6, #0x34]
	subs r1, #8
	lsls r1, r1, #0x10
	ldr r4, _08021024 @ =0x0000FFFF
	ands r0, r4
	lsls r0, r0, #5
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl RandNextB
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r7, r5, #0
	adds r7, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	mov r5, sl
	movs r4, #0
	ldrsh r0, [r5, r4]
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r0, r4
	bgt _08021028
	str r0, [sp]
	b _0802102A
	.align 2, 0
_08021020: .4byte 0x08B93CBC
_08021024: .4byte 0x0000FFFF
_08021028:
	str r4, [sp]
_0802102A:
	adds r0, r7, #0
	bl Calcs_Interpolate
	mov r5, r8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	mov r1, sl
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	blt _0802104A
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r1]
_0802104A:
	mov r4, sl
	movs r5, #0
	ldrsh r1, [r4, r5]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _0802106A
	adds r0, r6, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x66
	movs r0, #1
	strh r0, [r1]
_0802106A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802107C
sub_0802107C: @ 0x0802107C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r5, r0]
	movs r0, #0x10
	subs r4, r0, r1
	cmp r4, #0
	bge _08021090
	movs r4, #0
_08021090:
	ldr r3, _080210D8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080210DC @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _080210E0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080210D8: .4byte 0x03002870
_080210DC: .4byte 0x0000FFE0
_080210E0: .4byte 0x0000E0FF

	thumb_func_start StartEmitStarsAnim
StartEmitStarsAnim: @ 0x080210E4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x18]
	ldr r0, _0802113C @ =0x08B93CEC
	ldr r1, _08021140 @ =0x06014000
	movs r2, #0x20
	bl RegisterDataMove
	ldr r0, _08021144 @ =0x08B93CD4
	adds r1, r6, #0
	bl Proc_Start
	adds r3, r0, #0
	mov r0, r8
	str r0, [r3, #0x34]
	mov r0, sb
	str r0, [r3, #0x38]
	lsls r4, r4, #0x10
	str r4, [r3, #0x3c]
	lsls r5, r5, #0x10
	str r5, [r3, #0x40]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r2, #0
	strh r2, [r0]
	adds r1, r3, #0
	adds r1, #0x64
	ldr r0, _08021148 @ =0x0000FFFF
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x66
	strh r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802113C: .4byte 0x08B93CEC
_08021140: .4byte 0x06014000
_08021144: .4byte 0x08B93CD4
_08021148: .4byte 0x0000FFFF

	thumb_func_start ClearEmitedStars
ClearEmitedStars: @ 0x0802114C
	push {lr}
	ldr r0, _08021160 @ =0x08B93CD4
	bl Proc_Find
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08021160: .4byte 0x08B93CD4

	thumb_func_start sub_08021164
sub_08021164: @ 0x08021164
	push {lr}
	ldr r0, _08021170 @ =0x08B93CD4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08021170: .4byte 0x08B93CD4

	thumb_func_start SwingSwordfx_Init
SwingSwordfx_Init: @ 0x08021174
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _080211A4 @ =0x02022860
	ldr r2, _080211A8 @ =0x00007FFF
	adds r1, r3, #0
	adds r1, #0x42
	movs r0, #0xe
_08021182:
	strh r2, [r1]
	adds r1, #2
	subs r0, #1
	cmp r0, #0
	bge _08021182
	movs r4, #0
	ldr r0, _080211A8 @ =0x00007FFF
	strh r0, [r3]
	bl EnablePalSync
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080211A4: .4byte 0x02022860
_080211A8: .4byte 0x00007FFF

	thumb_func_start SwingSwordfx_Loop
SwingSwordfx_Loop: @ 0x080211AC
	push {r4, r5, r6, lr}
	sub sp, #0x50
	adds r5, r0, #0
	ldr r1, _08021204 @ =0x081C3C68
	mov r0, sp
	movs r2, #0x50
	bl memcpy
	ldr r1, _08021208 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	movs r2, #1
	adds r4, r5, #0
	adds r4, #0x4c
	adds r3, r4, #0
	adds r1, #0x5e
_080211CC:
	movs r6, #0
	ldrsh r0, [r3, r6]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #2
	adds r2, #1
	cmp r2, #0xf
	ble _080211CC
	bl EnablePalSync
	ldrh r0, [r4]
	adds r0, #3
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _080211FC
	adds r0, r5, #0
	bl Proc_Break
_080211FC:
	add sp, #0x50
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021204: .4byte 0x081C3C68
_08021208: .4byte 0x02022860

	thumb_func_start SwingSwordfx_End
SwingSwordfx_End: @ 0x0802120C
	push {lr}
	ldr r2, _08021230 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_08021230: .4byte 0x03002870

	thumb_func_start StartSwingSwordfx
StartSwingSwordfx: @ 0x08021234
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080212B4 @ =0x081BAC1C
	ldr r1, _080212B8 @ =0x06005000
	bl Decompress
	ldr r0, _080212BC @ =0x081BAFD4
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080212C0 @ =0x02022C64
	ldr r1, _080212C4 @ =0x081BB1D4
	movs r2, #0x8a
	lsls r2, r2, #6
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	ldr r3, _080212C8 @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _080212CC @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	ldr r1, _080212D0 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _080212D4 @ =0x08B93D0C
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080212B4: .4byte 0x081BAC1C
_080212B8: .4byte 0x06005000
_080212BC: .4byte 0x081BAFD4
_080212C0: .4byte 0x02022C64
_080212C4: .4byte 0x081BB1D4
_080212C8: .4byte 0x03002870
_080212CC: .4byte 0x0000FFE0
_080212D0: .4byte 0x0000E0FF
_080212D4: .4byte 0x08B93D0C
