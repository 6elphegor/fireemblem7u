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
	bl TmApplyTsa_t
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
	bl SpawnProcLocking
	b _08020494
	.align 2, 0
_08020488: .4byte 0x08B93B1C
_0802048C:
	ldr r0, _08020498 @ =0x08B93B1C
	movs r1, #3
	bl SpawnProc
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
	bl TmCopyRect_t
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
	bl SpawnProcLocking
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
	bl TmCopyRect_t
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
	bl SpawnProcLocking
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

	thumb_func_start WarpEffect_Init
WarpEffect_Init: @ 0x08020848
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

	thumb_func_start WarpEffect_Lop
WarpEffect_Lop: @ 0x08020928
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
	bl TmCopyRect_t
	movs r0, #1
	bl EnableBgSync
_080209B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080209BC: .4byte 0x0200323C
_080209C0: .4byte 0x02022C60

	thumb_func_start WarpEffect_Finish
WarpEffect_Finish: @ 0x080209C4
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

	thumb_func_start StartWarpEffect_080209F4
StartWarpEffect_080209F4: @ 0x080209F4
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl TmCopyRect_t
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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

	thumb_func_start sub_0802120C
sub_0802120C: @ 0x0802120C
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
	bl SpawnProcLocking
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

	thumb_func_start ProcMineFxFunc
ProcMineFxFunc: @ 0x080212D8
	push {lr}
	ldr r0, _080212F0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080212EC
	ldr r0, _080212F4 @ =0x000002F9
	bl m4aSongNumStart
_080212EC:
	pop {r0}
	bx r0
	.align 2, 0
_080212F0: .4byte 0x0202BBF8
_080212F4: .4byte 0x000002F9

	thumb_func_start StartMineAnim
StartMineAnim: @ 0x080212F8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r0, r5, #4
	ldr r2, _0802135C @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	adds r5, #8
	lsls r0, r6, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r6, r0, #4
	adds r0, r4, #0
	movs r1, #0x20
	bl StartTemporaryLock
	ldr r0, _08021360 @ =0x081C3368
	ldr r1, _08021364 @ =0x06013000
	bl Decompress
	ldr r0, _08021368 @ =0x081C3570
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0802136C @ =0x081C34DC
	movs r3, #0xa3
	lsls r3, r3, #7
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl StartSpriteAnimProc
	ldr r0, _08021370 @ =0x08B93D44
	adds r1, r4, #0
	bl SpawnProc
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802135C: .4byte 0x0202BBB8
_08021360: .4byte 0x081C3368
_08021364: .4byte 0x06013000
_08021368: .4byte 0x081C3570
_0802136C: .4byte 0x081C34DC
_08021370: .4byte 0x08B93D44

	thumb_func_start sub_08021374
sub_08021374: @ 0x08021374
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r2, #0
	movs r2, #0
	lsls r5, r1, #2
_0802137E:
	lsls r0, r2, #5
	adds r4, r2, #1
	movs r1, #3
	adds r0, r0, r5
	adds r0, r0, r6
	adds r3, r0, #3
	lsls r0, r2, #6
	adds r0, r0, r7
	adds r0, #6
_08021390:
	strh r3, [r0]
	subs r3, #1
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08021390
	adds r2, r4, #0
	cmp r2, #3
	ble _0802137E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080213A8
sub_080213A8: @ 0x080213A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x4a
	ldrh r0, [r7]
	cmp r0, #6
	bne _080213C4
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08021460
_080213C4:
	bl ClearUi
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, [r6, #0x2c]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0802146C @ =0x02022C60
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r4, #0xa2
	lsls r4, r4, #7
	adds r2, r4, #0
	bl sub_08021374
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, [r6, #0x2c]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08021470 @ =0x02023460
	adds r0, r0, r1
	ldrh r1, [r7]
	adds r1, #1
	movs r5, #0
	movs r2, #0
	mov r8, r2
	strh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	bl sub_08021374
	ldr r3, _08021474 @ =0x03002870
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
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08021478 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0802147C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	mov r1, r8
	strh r1, [r0]
_08021460:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802146C: .4byte 0x02022C60
_08021470: .4byte 0x02023460
_08021474: .4byte 0x03002870
_08021478: .4byte 0x0000FFE0
_0802147C: .4byte 0x0000E0FF

	thumb_func_start sub_08021480
sub_08021480: @ 0x08021480
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetGameTime
	adds r4, r0, #0
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	bne _080214D0
	ldr r0, _080214D8 @ =0x03002870
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
	ldrh r1, [r3]
	movs r0, #0x10
	subs r0, r0, r1
	adds r2, #8
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #1
	strh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x10
	ble _080214D0
	adds r0, r5, #0
	bl Proc_Break
_080214D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080214D8: .4byte 0x03002870

	thumb_func_start sub_080214DC
sub_080214DC: @ 0x080214DC
	push {lr}
	ldr r0, _080214F0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080214F0: .4byte 0x02022C60

	thumb_func_start NinianStartTransformToHunman
NinianStartTransformToHunman: @ 0x080214F4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08021530 @ =0x081BDAEC
	ldr r1, _08021534 @ =0x06002000
	bl Decompress
	ldr r0, _08021538 @ =0x02022C20
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0802153C @ =0x08B93D5C
	adds r1, r6, #0
	bl SpawnProcLocking
	lsls r4, r4, #1
	subs r4, #1
	str r4, [r0, #0x2c]
	lsls r5, r5, #1
	subs r5, #2
	str r5, [r0, #0x30]
	adds r0, #0x4a
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021530: .4byte 0x081BDAEC
_08021534: .4byte 0x06002000
_08021538: .4byte 0x02022C20
_0802153C: .4byte 0x08B93D5C

	thumb_func_start sub_08021540
sub_08021540: @ 0x08021540
	movs r0, #0x17
	bx lr

	thumb_func_start MapMenu_Suspend_Available
MapMenu_Suspend_Available: @ 0x08021544
	ldr r1, _08021554 @ =0x0202BBF8
	movs r0, #8
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08021558
	movs r0, #1
	b _0802155A
	.align 2, 0
_08021554: .4byte 0x0202BBF8
_08021558:
	movs r0, #2
_0802155A:
	bx lr

	thumb_func_start sub_0802155C
sub_0802155C: @ 0x0802155C
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _0802156E
	bl sub_080B2F28
	movs r0, #0x17
	b _08021576
_0802156E:
	ldr r1, _0802157C @ =0x0000074D
	bl MenuFrozenHelpBox
	movs r0, #8
_08021576:
	pop {r1}
	bx r1
	.align 2, 0
_0802157C: .4byte 0x0000074D

	thumb_func_start sub_08021580
sub_08021580: @ 0x08021580
	push {lr}
	ldr r0, _08021590 @ =0x08B93374
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021590: .4byte 0x08B93374

	thumb_func_start MapMenu_UnitCommand
MapMenu_UnitCommand: @ 0x08021594
	push {lr}
	ldr r0, _080215AC @ =0x08B93374
	bl Proc_Find
	movs r1, #0xa
	bl Proc_Goto
	bl StartUnitListScreenField
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080215AC: .4byte 0x08B93374

	thumb_func_start sub_080215B0
sub_080215B0: @ 0x080215B0
	push {lr}
	ldr r0, _080215C0 @ =0x08CE5BF0
	movs r1, #3
	bl SpawnProc
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080215C0: .4byte 0x08CE5BF0

	thumb_func_start MapMenu_StatusCommand
MapMenu_StatusCommand: @ 0x080215C4
	push {lr}
	movs r0, #0
	bl NewChapterStatusScreen
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MapMenu_DangerZone_UnusedEffect
MapMenu_DangerZone_UnusedEffect: @ 0x080215D4
	push {lr}
	ldr r0, _080215F4 @ =0x03004690
	movs r1, #0
	str r1, [r0]
	ldr r0, _080215F8 @ =0x0202BBB8
	adds r0, #0x3e
	strb r1, [r0]
	ldr r0, _080215FC @ =0x08B93374
	bl Proc_Find
	movs r1, #0xc
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080215F4: .4byte 0x03004690
_080215F8: .4byte 0x0202BBB8
_080215FC: .4byte 0x08B93374

	thumb_func_start sub_08021600
sub_08021600: @ 0x08021600
	push {lr}
	movs r0, #3
	bl sub_080A4E0C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08021610
sub_08021610: @ 0x08021610
	movs r0, #0x17
	bx lr

	thumb_func_start sub_08021614
sub_08021614: @ 0x08021614
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkResult
	cmp r0, #1
	beq _08021628
	adds r0, r4, #0
	movs r1, #0x63
	bl EventGotoLabel
_08021628:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08021630
sub_08021630: @ 0x08021630
	push {lr}
	ldr r0, _08021640 @ =0x08B93DA4
	bl sub_0800AF5C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021640: .4byte 0x08B93DA4

	thumb_func_start EffectWait
EffectWait: @ 0x08021644
	ldr r1, _08021650 @ =0x0203A85C
	movs r0, #1
	strb r0, [r1, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021650: .4byte 0x0203A85C

	thumb_func_start GenericSelection_BackToUM
GenericSelection_BackToUM: @ 0x08021654
	push {lr}
	bl EndTargetSelection
	ldr r0, _080216A0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	bl HideMoveRangeGraphics
	ldr r0, _080216A4 @ =0x08B95AAC
	ldr r2, _080216A8 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	ldr r1, _080216AC @ =0x03004690
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl CameraMoveWatchPosition
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_080216A0: .4byte 0x02023C60
_080216A4: .4byte 0x08B95AAC
_080216A8: .4byte 0x0202BBB8
_080216AC: .4byte 0x03004690

	thumb_func_start sub_080216B0
sub_080216B0: @ 0x080216B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08021708 @ =0x03004690
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl IsCameraNotWatchingPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08021702
	ldr r0, [r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r0, _0802170C @ =0x08B92E38
	bl Proc_EndEach
	lsls r0, r4, #4
	bl GetCameraAdjustedY
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08021710 @ =0x0202BBB8
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _080216F4
	ldrh r2, [r2, #0x2a]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x14
	adds r4, r0, #2
_080216F4:
	ldr r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	adds r2, r4, #0
	bl CameraMoveWatchPosition
_08021702:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021708: .4byte 0x03004690
_0802170C: .4byte 0x08B92E38
_08021710: .4byte 0x0202BBB8

	thumb_func_start BackToUnitMenu_RestartMenu
BackToUnitMenu_RestartMenu: @ 0x08021714
	push {lr}
	ldr r0, _08021730 @ =0x08B95AAC
	ldr r2, _08021734 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	pop {r0}
	bx r0
	.align 2, 0
_08021730: .4byte 0x08B95AAC
_08021734: .4byte 0x0202BBB8

	thumb_func_start GenericSelection_BackToUM_CamWait
GenericSelection_BackToUM_CamWait: @ 0x08021738
	push {lr}
	bl EndTargetSelection
	ldr r0, _08021764 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl HideMoveRangeGraphics
	bl ResetTextFont
	ldr r0, _08021768 @ =0x08B93DDC
	movs r1, #3
	bl SpawnProc
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_08021764: .4byte 0x02023C60
_08021768: .4byte 0x08B93DDC

	thumb_func_start ItemMenu_ButtonBPressed
ItemMenu_ButtonBPressed: @ 0x0802176C
	push {lr}
	ldr r0, _080217A0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	ldr r0, _080217A4 @ =0x08B95AAC
	ldr r2, _080217A8 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	bl HideMoveRangeGraphics
	movs r0, #0x3b
	pop {r1}
	bx r1
	.align 2, 0
_080217A0: .4byte 0x02023C60
_080217A4: .4byte 0x08B95AAC
_080217A8: .4byte 0x0202BBB8

	thumb_func_start sub_080217AC
sub_080217AC: @ 0x080217AC
	movs r0, #0
	bx lr

	thumb_func_start RescueUsability
RescueUsability: @ 0x080217B0
	push {lr}
	ldr r0, _080217DC @ =0x03004690
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080217E0
	movs r0, #0x81
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	bne _080217E0
	adds r0, r2, #0
	bl MakeRescueTargetList
	bl CountTargets
	cmp r0, #0
	beq _080217E0
	movs r0, #1
	b _080217E2
	.align 2, 0
_080217DC: .4byte 0x03004690
_080217E0:
	movs r0, #3
_080217E2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080217E8
sub_080217E8: @ 0x080217E8
	push {lr}
	ldr r0, _08021800 @ =0x03004690
	ldr r0, [r0]
	bl MakeRescueTargetList
	ldr r0, _08021804 @ =0x08B95D18
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021800: .4byte 0x03004690
_08021804: .4byte 0x08B95D18

	thumb_func_start sub_08021808
sub_08021808: @ 0x08021808
	ldr r2, _08021818 @ =0x0203A85C
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #7
	strb r0, [r2, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021818: .4byte 0x0203A85C

	thumb_func_start DropUsability
DropUsability: @ 0x0802181C
	push {lr}
	ldr r0, _08021848 @ =0x03004690
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802184C
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0802184C
	adds r0, r2, #0
	bl MakeDropTargetList
	bl CountTargets
	cmp r0, #0
	beq _0802184C
	movs r0, #1
	b _0802184E
	.align 2, 0
_08021848: .4byte 0x03004690
_0802184C:
	movs r0, #3
_0802184E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DropEffect
DropEffect: @ 0x08021854
	push {lr}
	ldr r0, _0802186C @ =0x03004690
	ldr r0, [r0]
	bl MakeDropTargetList
	ldr r0, _08021870 @ =0x08B95CF8
	bl StartMapSelect
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0802186C: .4byte 0x03004690
_08021870: .4byte 0x08B95CF8

	thumb_func_start sub_08021874
sub_08021874: @ 0x08021874
	ldr r2, _08021890 @ =0x0203A85C
	movs r0, #8
	strb r0, [r2, #0x11]
	ldr r0, _08021894 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	strb r0, [r2, #0xd]
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021890: .4byte 0x0203A85C
_08021894: .4byte 0x03004690

	thumb_func_start sub_08021898
sub_08021898: @ 0x08021898
	push {lr}
	ldr r0, _080218D0 @ =0x03004690
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080218D8
	ldr r1, _080218D4 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080218D8
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	bne _080218D8
	adds r0, r3, #0
	bl sub_08023F64
	bl CountTargets
	cmp r0, #0
	beq _080218D8
	movs r0, #1
	b _080218DA
	.align 2, 0
_080218D0: .4byte 0x03004690
_080218D4: .4byte 0x0202BBB8
_080218D8:
	movs r0, #3
_080218DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080218E0
sub_080218E0: @ 0x080218E0
	push {lr}
	ldr r0, _080218F8 @ =0x03004690
	ldr r0, [r0]
	bl sub_08023F64
	ldr r0, _080218FC @ =0x08B95CD8
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_080218F8: .4byte 0x03004690
_080218FC: .4byte 0x08B95CD8

	thumb_func_start sub_08021900
sub_08021900: @ 0x08021900
	push {lr}
	ldr r0, _08021938 @ =0x03004690
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08021940
	ldr r1, _0802193C @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08021940
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _08021940
	adds r0, r3, #0
	bl sub_08024018
	bl CountTargets
	cmp r0, #0
	beq _08021940
	movs r0, #1
	b _08021942
	.align 2, 0
_08021938: .4byte 0x03004690
_0802193C: .4byte 0x0202BBB8
_08021940:
	movs r0, #3
_08021942:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08021948
sub_08021948: @ 0x08021948
	push {lr}
	ldr r0, _08021960 @ =0x03004690
	ldr r0, [r0]
	bl sub_08024018
	ldr r0, _08021964 @ =0x08B95CB8
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021960: .4byte 0x03004690
_08021964: .4byte 0x08B95CB8

	thumb_func_start MakeUnitRescueTransferGraphics
MakeUnitRescueTransferGraphics: @ 0x08021968
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl EndSubtitleHelp
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r6, #0
	bl Make6CKOIDOAMM
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0802199C
sub_0802199C: @ 0x0802199C
	push {r4, r5, lr}
	ldr r4, _080219E8 @ =0x0203A85C
	movs r0, #9
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl MakeUnitRescueTransferGraphics
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGiveRescue
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080219E8: .4byte 0x0203A85C

	thumb_func_start sub_080219EC
sub_080219EC: @ 0x080219EC
	push {r4, r5, lr}
	ldr r4, _08021A38 @ =0x0203A85C
	movs r0, #0xa
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl MakeUnitRescueTransferGraphics
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGiveRescue
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021A38: .4byte 0x0203A85C

	thumb_func_start UnitAttackCommandEffect
UnitAttackCommandEffect: @ 0x08021A3C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08021A5C
	ldr r1, _08021A58 @ =0x00000742
	adds r0, r5, #0
	bl MenuFrozenHelpBox
	movs r0, #8
	b _08021A90
	.align 2, 0
_08021A58: .4byte 0x00000742
_08021A5C:
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _08021A80 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08021A84
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartFightItemReview
	b _08021A8C
	.align 2, 0
_08021A80: .4byte 0x03004690
_08021A84:
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartFightBallistaReview
_08021A8C:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08021A90:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartFightBallistaReview
StartFightBallistaReview: @ 0x08021A98
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08021ADC @ =0x08B95A64
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08021AE0 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021ADC: .4byte 0x08B95A64
_08021AE0: .4byte 0x03004690

	thumb_func_start StartFightItemReview
StartFightItemReview: @ 0x08021AE4
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08021B2C @ =0x08B95A88
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08021B30 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	bl sub_080790B8
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021B2C: .4byte 0x08B95A88
_08021B30: .4byte 0x03004690

	thumb_func_start DisplayUnitStandingAttackRange
DisplayUnitStandingAttackRange: @ 0x08021B34
	push {r4, r5, lr}
	ldr r0, _08021B70 @ =0x0202E3E4
	ldr r0, [r0]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl BmMapFillg
	ldr r0, _08021B74 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _08021B78 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08021B7C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #1
	movs r3, #0xa
	bl MapAddInBoundedRange
	b _08021B8C
	.align 2, 0
_08021B70: .4byte 0x0202E3E4
_08021B74: .4byte 0x0202E3E8
_08021B78: .4byte 0x03004690
_08021B7C:
	adds r0, r2, #0
	adds r1, r5, #0
	bl GetUnitWeaponReach
	adds r1, r0, #0
	ldr r0, [r4]
	bl BuildUnitStandingRangeForReach
_08021B8C:
	movs r0, #3
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08021B9C
sub_08021B9C: @ 0x08021B9C
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start WeaponSelectMenu_IsAvailable
WeaponSelectMenu_IsAvailable: @ 0x08021BA8
	push {r4, r5, lr}
	ldr r5, _08021BE8 @ =0x03004690
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08021BEC
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08021BEC
	ldr r0, [r5]
	adds r1, r4, #0
	bl ListAttackTargetsForWeapon
	bl CountTargets
	cmp r0, #0
	beq _08021BEC
	movs r0, #1
	b _08021BEE
	.align 2, 0
_08021BE8: .4byte 0x03004690
_08021BEC:
	movs r0, #3
_08021BEE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start WeaponSelectMenu_Selected
WeaponSelectMenu_Selected: @ 0x08021BF4
	push {r4, lr}
	ldr r4, _08021C2C @ =0x03004690
	ldr r0, [r4]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl UnitEquipItemSlot
	ldr r1, _08021C30 @ =0x0203A85C
	movs r0, #0
	strb r0, [r1, #0x12]
	bl ClearUi
	ldr r0, [r4]
	ldrh r1, [r0, #0x1e]
	bl ListAttackTargetsForWeapon
	ldr r0, _08021C34 @ =0x08B95C98
	bl StartMapSelect
	bl sub_080790BC
	movs r0, #0x27
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08021C2C: .4byte 0x03004690
_08021C30: .4byte 0x0203A85C
_08021C34: .4byte 0x08B95C98

	thumb_func_start WeaponSelectMenu_Draw
WeaponSelectMenu_Draw: @ 0x08021C38
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08021C80 @ =0x03004690
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08021C84 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r4, #0
	bl DrawItemMenuLine
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08021C80: .4byte 0x03004690
_08021C84: .4byte 0x02022C60

	thumb_func_start WeaponSelectMenu_SwitchIn
WeaponSelectMenu_SwitchIn: @ 0x08021C88
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl UpdateMenuItemPanel
	ldr r0, _08021CD0 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08021CD4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _08021CD8 @ =0x03004690
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl GetUnitWeaponReach
	adds r1, r0, #0
	ldr r0, [r4]
	bl BuildUnitStandingRangeForReach
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021CD0: .4byte 0x0202E3E4
_08021CD4: .4byte 0x0202E3E8
_08021CD8: .4byte 0x03004690

	thumb_func_start sub_08021CDC
sub_08021CDC: @ 0x08021CDC
	push {lr}
	adds r0, #0x63
	movs r1, #4
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08021CEE
	bl HideMoveRangeGraphics
_08021CEE:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_08021CF4
sub_08021CF4: @ 0x08021CF4
	push {lr}
	ldr r2, _08021D20 @ =0x0203A85C
	movs r0, #2
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08021D14
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	ldrb r0, [r1, #3]
	strb r0, [r2, #0x15]
_08021D14:
	ldr r0, _08021D24 @ =0x08B96D5C
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021D20: .4byte 0x0203A85C
_08021D24: .4byte 0x08B96D5C

	thumb_func_start sub_08021D28
sub_08021D28: @ 0x08021D28
	push {lr}
	ldr r0, _08021D40 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl CameraMoveWatchPosition
	pop {r0}
	bx r0
	.align 2, 0
_08021D40: .4byte 0x03004690

	thumb_func_start GoToFightItemReview
GoToFightItemReview: @ 0x08021D44
	push {lr}
	movs r0, #0
	movs r1, #0
	bl UnitAttackCommandEffect
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08021D54
sub_08021D54: @ 0x08021D54
	push {lr}
	ldr r0, _08021D64 @ =0x08B93E0C
	movs r1, #3
	bl SpawnProc
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_08021D64: .4byte 0x08B93E0C

	thumb_func_start AttackMapSelect_SwitchIn
AttackMapSelect_SwitchIn: @ 0x08021D68
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08021D9E
	ldr r1, _08021DBC @ =0x0203A85C
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
	bl InitObstacleBattleUnit
_08021D9E:
	ldr r1, _08021DBC @ =0x0203A85C
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne _08021DC4
	ldr r0, _08021DC0 @ =0x03004690
	ldr r0, [r0]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	adds r1, r5, #0
	bl BattleGenerateBallistaSimulation
	b _08021DD8
	.align 2, 0
_08021DBC: .4byte 0x0203A85C
_08021DC0: .4byte 0x03004690
_08021DC4:
	ldr r0, _08021DE8 @ =0x03004690
	ldr r0, [r0]
	movs r3, #1
	rsbs r3, r3, #0
	ldrb r1, [r1, #0x12]
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r3, #0
	bl BattleGenerateSimulation
_08021DD8:
	bl UpdateBattleForecastContents
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021DE8: .4byte 0x03004690

	thumb_func_start AttackMapSelect_End
AttackMapSelect_End: @ 0x08021DEC
	push {lr}
	ldr r0, _08021E0C @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl HideMoveRangeGraphics
	bl CloseBattleForecast
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08021E0C: .4byte 0x02023C60

	thumb_func_start sub_08021E10
sub_08021E10: @ 0x08021E10
	push {lr}
	ldr r0, _08021E54 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08021E5C
	ldr r1, _08021E58 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08021E5C
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08021E5C
	adds r0, r2, #0
	bl MakeTradeTargetList
	bl CountTargets
	cmp r0, #0
	beq _08021E5C
	movs r0, #1
	b _08021E5E
	.align 2, 0
_08021E54: .4byte 0x03004690
_08021E58: .4byte 0x0202BBB8
_08021E5C:
	movs r0, #3
_08021E5E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start TradeCommandEffect
TradeCommandEffect: @ 0x08021E64
	push {lr}
	bl ClearUi
	ldr r0, _08021E80 @ =0x03004690
	ldr r0, [r0]
	bl MakeTradeTargetList
	ldr r0, _08021E84 @ =0x08B95C78
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021E80: .4byte 0x03004690
_08021E84: .4byte 0x08B95C78

	thumb_func_start sub_08021E88
sub_08021E88: @ 0x08021E88
	push {r4, lr}
	ldr r2, _08021EB0 @ =0x0203A85C
	movs r0, #0x1a
	strb r0, [r2, #0x11]
	ldr r0, _08021EB4 @ =0x03004690
	ldr r4, [r0]
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl sub_0802B678
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08021EB0: .4byte 0x0203A85C
_08021EB4: .4byte 0x03004690

	thumb_func_start UnitActionMenu_Seize_Available
UnitActionMenu_Seize_Available: @ 0x08021EB8
	push {r4, lr}
	ldr r4, _08021ED8 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08021ED4
	adds r0, r2, #0
	bl sub_08034884
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08021EDC
_08021ED4:
	movs r0, #3
	b _08021EF6
	.align 2, 0
_08021ED8: .4byte 0x03004690
_08021EDC:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0xf
	bne _08021EF4
	movs r1, #1
_08021EF4:
	adds r0, r1, #0
_08021EF6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08021EFC
sub_08021EFC: @ 0x08021EFC
	ldr r1, _08021F14 @ =0x0203A85C
	movs r0, #0xf
	strb r0, [r1, #0x11]
	ldr r0, _08021F18 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021F14: .4byte 0x0203A85C
_08021F18: .4byte 0x03004690

	thumb_func_start sub_08021F1C
sub_08021F1C: @ 0x08021F1C
	push {r4, lr}
	ldr r0, _08021F6C @ =0x03004690
	ldr r3, [r0]
	ldr r1, [r3, #0xc]
	movs r2, #0x40
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	bne _08021F68
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	ldr r1, _08021F70 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _08021F54
	cmp r0, #5
	beq _08021F54
	cmp r0, #0x38
	beq _08021F54
	cmp r0, #0x37
	bne _08021F68
_08021F54:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0xe
	beq _08021F74
_08021F68:
	movs r0, #3
	b _08021F86
	.align 2, 0
_08021F6C: .4byte 0x03004690
_08021F70: .4byte 0x0202E3E0
_08021F74:
	ldr r0, [r4]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08021F84
	movs r0, #1
	b _08021F86
_08021F84:
	movs r0, #2
_08021F86:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08021F8C
sub_08021F8C: @ 0x08021F8C
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08021FA4
	ldr r1, _08021FA0 @ =0x0203A85C
	movs r0, #0xe
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _08021FAC
	.align 2, 0
_08021FA0: .4byte 0x0203A85C
_08021FA4:
	ldr r1, _08021FB0 @ =0x00000736
	bl MenuFrozenHelpBox
	movs r0, #8
_08021FAC:
	pop {r1}
	bx r1
	.align 2, 0
_08021FB0: .4byte 0x00000736

	thumb_func_start sub_08021FB4
sub_08021FB4: @ 0x08021FB4
	push {r4, r5, r6, lr}
	ldr r6, _08021FD8 @ =0x03004690
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022012
	adds r0, r2, #0
	bl MakeTargetListForRefresh
	bl CountTargets
	cmp r0, #0
	beq _08021FDC
_08021FD2:
	movs r0, #1
	b _08022014
	.align 2, 0
_08021FD8: .4byte 0x03004690
_08021FDC:
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _08022012
_08021FE6:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0xc
	bne _08021FFE
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08021FD2
_08021FFE:
	adds r5, #1
	cmp r5, #4
	bgt _08022012
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08021FE6
_08022012:
	movs r0, #3
_08022014:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802201C
sub_0802201C: @ 0x0802201C
	push {lr}
	adds r3, r0, #0
	ldr r0, _08022048 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08022050
	ldr r1, _0802204C @ =0x0202BBB8
	movs r0, #0x9e
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_08021FB4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08022052
	.align 2, 0
_08022048: .4byte 0x03004690
_0802204C: .4byte 0x0202BBB8
_08022050:
	movs r0, #3
_08022052:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022058
sub_08022058: @ 0x08022058
	push {lr}
	adds r3, r0, #0
	ldr r0, _08022084 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802208C
	ldr r1, _08022088 @ =0x0202BBB8
	movs r0, #0x9d
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_08021FB4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0802208E
	.align 2, 0
_08022084: .4byte 0x03004690
_08022088: .4byte 0x0202BBB8
_0802208C:
	movs r0, #3
_0802208E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PlayCommandEffect
PlayCommandEffect: @ 0x08022094
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	mov sl, r1
	movs r7, #0
	ldr r6, _0802210C @ =0x03004690
	ldr r0, [r6]
	bl MakeTargetListForRefresh
	bl CountTargets
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r8, r1
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _080220F2
_080220C4:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0xc
	bne _080220DE
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080220DE
	movs r7, #1
_080220DE:
	adds r5, #1
	cmp r5, #4
	bgt _080220F2
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080220C4
_080220F2:
	mov r0, r8
	cmp r0, #0
	beq _08022110
	cmp r7, #0
	bne _08022110
	mov r0, sb
	mov r1, sl
	bl ItemMenu_Select1stCommand
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08022150
	.align 2, 0
_0802210C: .4byte 0x03004690
_08022110:
	ldr r0, _08022160 @ =0x08B959F8
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08022164 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0x17
_08022150:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08022160: .4byte 0x08B959F8
_08022164: .4byte 0x03004690

	thumb_func_start RefreshMapSelect_Select
RefreshMapSelect_Select: @ 0x08022168
	ldr r2, _08022178 @ =0x0203A85C
	movs r0, #4
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022178: .4byte 0x0203A85C

	thumb_func_start sub_0802217C
sub_0802217C: @ 0x0802217C
	ldr r0, _08022194 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022198
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	beq _08022198
	movs r0, #1
	b _0802219A
	.align 2, 0
_08022194: .4byte 0x03004690
_08022198:
	movs r0, #3
_0802219A:
	bx lr

	thumb_func_start sub_0802219C
sub_0802219C: @ 0x0802219C
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _080221F8
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ResetTextFont
	ldr r0, _080221F0 @ =0x08B95A40
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _080221F4 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #0x17
	b _080221FA
	.align 2, 0
_080221F0: .4byte 0x08B95A40
_080221F4: .4byte 0x03004690
_080221F8:
	movs r0, #0
_080221FA:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ItemSelectMenu_TextDraw
ItemSelectMenu_TextDraw: @ 0x08022204
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r7, _0802223C @ =0x03004690
	ldr r1, [r7]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022240
	adds r0, r6, #0
	adds r1, r4, #0
	bl WeaponSelectMenu_Draw
	movs r0, #0
	b _08022280
	.align 2, 0
_0802223C: .4byte 0x03004690
_08022240:
	adds r0, r5, #0
	bl GetItemKind
	cmp r0, #0xc
	bne _0802224E
	movs r2, #0
	b _0802225A
_0802224E:
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0802225A:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r4, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08022288 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r5, #0
	bl DrawItemMenuLine
	movs r0, #1
	bl EnableBgSync
_08022280:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08022288: .4byte 0x02022C60

	thumb_func_start ItemSelectMenu_Usability
ItemSelectMenu_Usability: @ 0x0802228C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r7, _080222A8 @ =0x03004690
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080222AC
	movs r0, #3
	b _080222D6
	.align 2, 0
_080222A8: .4byte 0x03004690
_080222AC:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080222C2
	adds r0, r6, #0
	adds r1, r5, #0
	bl WeaponSelectMenu_IsAvailable
_080222C2:
	ldr r0, [r7]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080222D4
	movs r1, #1
_080222D4:
	adds r0, r1, #0
_080222D6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080222DC
sub_080222DC: @ 0x080222DC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08022334 @ =0x0203A85C
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x2a]
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08022338 @ =0xFFFFFF00
	ands r5, r2
	orrs r5, r0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _0802233C @ =0xFFFF00FF
	ands r5, r1
	orrs r5, r0
	ldr r0, _08022340 @ =0xFF00FFFF
	ands r5, r0
	movs r0, #0xc0
	lsls r0, r0, #0xb
	orrs r5, r0
	ldr r0, _08022344 @ =0x00FFFFFF
	ands r5, r0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x10
	asrs r1, r1, #0x18
	bl sub_08022360
	ldr r0, _08022348 @ =0x08B959D4
	adds r1, r5, #0
	adds r2, r4, #0
	bl StartLockingMenuExt
	movs r0, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022334: .4byte 0x0203A85C
_08022338: .4byte 0xFFFFFF00
_0802233C: .4byte 0xFFFF00FF
_08022340: .4byte 0xFF00FFFF
_08022344: .4byte 0x00FFFFFF
_08022348: .4byte 0x08B959D4

	thumb_func_start sub_0802234C
sub_0802234C: @ 0x0802234C
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl UpdateMenuItemPanel
	pop {r1}
	bx r1

	thumb_func_start sub_0802235C
sub_0802235C: @ 0x0802235C
	bx lr
	.align 2, 0

	thumb_func_start sub_08022360
sub_08022360: @ 0x08022360
	push {lr}
	ldr r0, _0802238C @ =0x02002774
	ldr r1, _08022390 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0
	bl InitTextFont
	ldr r0, _08022394 @ =0x02022CB6
	ldr r1, _08022398 @ =0x0200323C
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_t
	ldr r0, _0802239C @ =0x020234B6
	ldr r1, _080223A0 @ =0x0200373C
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_t
	pop {r0}
	bx r0
	.align 2, 0
_0802238C: .4byte 0x02002774
_08022390: .4byte 0x06004000
_08022394: .4byte 0x02022CB6
_08022398: .4byte 0x0200323C
_0802239C: .4byte 0x020234B6
_080223A0: .4byte 0x0200373C

	thumb_func_start sub_080223A4
sub_080223A4: @ 0x080223A4
	push {lr}
	movs r0, #0
	bl SetTextFont
	pop {r0}
	bx r0

	thumb_func_start MenuCommand_SelectNo
MenuCommand_SelectNo: @ 0x080223B0
	push {lr}
	movs r0, #0
	bl SetTextFont
	ldr r0, _080223DC @ =0x0200323C
	ldr r1, _080223E0 @ =0x02022CB6
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_t
	ldr r0, _080223E4 @ =0x0200373C
	ldr r1, _080223E8 @ =0x020234B6
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_t
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_080223DC: .4byte 0x0200323C
_080223E0: .4byte 0x02022CB6
_080223E4: .4byte 0x0200373C
_080223E8: .4byte 0x020234B6

	thumb_func_start sub_080223EC
sub_080223EC: @ 0x080223EC
	push {lr}
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl EndAllMenus
	movs r0, #0x31
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022404
sub_08022404: @ 0x08022404
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_080223EC
	adds r0, r4, #0
	bl MenuCommand_SelectNo
	ldr r0, _08022454 @ =0x08B95A40
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _08022458 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022454: .4byte 0x08B95A40
_08022458: .4byte 0x03004690

	thumb_func_start sub_0802245C
sub_0802245C: @ 0x0802245C
	push {r4, r5, r6, lr}
	sub sp, #4
	bl sub_080223EC
	ldr r6, _080224E4 @ =0x03004690
	ldr r0, [r6]
	bl GetUnitItemCount
	cmp r0, #0
	beq _080224FC
	ldr r0, _080224E8 @ =0x0200323C
	ldr r5, _080224EC @ =0x02022CB6
	adds r1, r5, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_t
	ldr r0, _080224F0 @ =0x0200373C
	ldr r4, _080224F4 @ =0x020234B6
	adds r1, r4, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_t
	subs r5, #0x14
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_t
	subs r4, #0x14
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_t
	movs r0, #3
	bl EnableBgSync
	ldr r0, _080224F8 @ =0x08B95A40
	bl StartMenu
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r6]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #1
	b _0802251E
	.align 2, 0
_080224E4: .4byte 0x03004690
_080224E8: .4byte 0x0200323C
_080224EC: .4byte 0x02022CB6
_080224F0: .4byte 0x0200373C
_080224F4: .4byte 0x020234B6
_080224F8: .4byte 0x08B95A40
_080224FC:
	bl ClearUi
	movs r0, #0
	bl EndFaceById
	ldr r0, _08022528 @ =0x08B95AAC
	ldr r2, _0802252C @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	movs r0, #0x1b
_0802251E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022528: .4byte 0x08B95AAC
_0802252C: .4byte 0x0202BBB8

	thumb_func_start sub_08022530
sub_08022530: @ 0x08022530
	push {r4, r5, lr}
	ldr r5, _08022580 @ =0x03004690
	ldr r0, [r5]
	ldr r1, _08022584 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemEffect
	cmp r0, #0
	beq _0802257C
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #4
	beq _0802257C
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0xc
	beq _0802257C
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022588
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022588
_0802257C:
	movs r0, #3
	b _0802259E
	.align 2, 0
_08022580: .4byte 0x03004690
_08022584: .4byte 0x0203A85C
_08022588:
	ldr r0, _080225A4 @ =0x03004690
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0802259C
	movs r1, #1
_0802259C:
	adds r0, r1, #0
_0802259E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080225A4: .4byte 0x03004690

	thumb_func_start sub_080225A8
sub_080225A8: @ 0x080225A8
	push {r4, r5, lr}
	ldr r5, _080225CC @ =0x03004690
	ldr r0, [r5]
	ldr r1, _080225D0 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080225D4
	movs r0, #3
	b _080225E8
	.align 2, 0
_080225CC: .4byte 0x03004690
_080225D0: .4byte 0x0203A85C
_080225D4:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080225E6
	movs r1, #1
_080225E6:
	adds r0, r1, #0
_080225E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080225F0
sub_080225F0: @ 0x080225F0
	push {lr}
	ldr r0, _08022614 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _08022618 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0802261C
	movs r0, #1
	b _0802261E
	.align 2, 0
_08022614: .4byte 0x03004690
_08022618: .4byte 0x0203A85C
_0802261C:
	movs r0, #2
_0802261E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022624
sub_08022624: @ 0x08022624
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	bne _0802265C
	ldr r0, _08022654 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _08022658 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl GetItemCantUseMsgid
	adds r1, r0, #0
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
	b _08022698
	.align 2, 0
_08022654: .4byte 0x03004690
_08022658: .4byte 0x0203A85C
_0802265C:
	bl ClearUi
	ldr r0, _080226A0 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _080226A4 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	ldr r0, _080226A8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08022688
	ldr r0, _080226AC @ =0x0000038A
	bl m4aSongNumStart
_08022688:
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl EndAllMenus
	movs r0, #0x21
_08022698:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080226A0: .4byte 0x03004690
_080226A4: .4byte 0x0203A85C
_080226A8: .4byte 0x0202BBF8
_080226AC: .4byte 0x0000038A

	thumb_func_start sub_080226B0
sub_080226B0: @ 0x080226B0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080226DC
	ldr r0, _080226D4 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _080226D8 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	bl UnitEquipItemSlot
	adds r0, r4, #0
	bl sub_08022404
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080226E6
	.align 2, 0
_080226D4: .4byte 0x03004690
_080226D8: .4byte 0x0203A85C
_080226DC:
	ldr r1, _080226EC @ =0x00000737
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080226E6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080226EC: .4byte 0x00000737

	thumb_func_start ItemSubMenu_TradeItem
ItemSubMenu_TradeItem: @ 0x080226F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0802271C @ =0x0202BBB8
	ldr r1, _08022720 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	adds r0, #0x3f
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_080223EC
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	adds r1, r5, #0
	bl TradeCommandEffect
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802271C: .4byte 0x0202BBB8
_08022720: .4byte 0x0203A85C

	thumb_func_start sub_08022724
sub_08022724: @ 0x08022724
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _08022784
	ldrh r0, [r2, #0x2a]
	adds r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08022770 @ =0xFFFFFF00
	ands r3, r1
	orrs r3, r0
	ldrh r2, [r2, #0x2c]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _08022774 @ =0xFFFF00FF
	ands r3, r1
	orrs r3, r0
	ldr r0, _08022778 @ =0xFF00FFFF
	ands r3, r0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	orrs r3, r0
	ldr r0, _0802277C @ =0x00FFFFFF
	ands r3, r0
	ldr r0, _08022780 @ =0x08B959B0
	adds r1, r3, #0
	adds r2, r4, #0
	bl StartLockingMenuExt
	adds r0, #0x61
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x84
	b _0802278E
	.align 2, 0
_08022770: .4byte 0xFFFFFF00
_08022774: .4byte 0xFFFF00FF
_08022778: .4byte 0xFF00FFFF
_0802277C: .4byte 0x00FFFFFF
_08022780: .4byte 0x08B959B0
_08022784:
	ldr r1, _08022794 @ =0x00000739
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_0802278E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022794: .4byte 0x00000739

	thumb_func_start MenuCommand_SelectYes
MenuCommand_SelectYes: @ 0x08022798
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080227C4 @ =0x03004690
	ldr r0, [r0]
	ldr r4, _080227C8 @ =0x0203A85C
	ldrb r1, [r4, #0x12]
	bl UnitRemoveItem
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _080227B6
	ldr r0, _080227CC @ =0x02022C60
	movs r1, #0
	bl TmFill
_080227B6:
	adds r0, r5, #0
	bl sub_0802245C
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080227C4: .4byte 0x03004690
_080227C8: .4byte 0x0203A85C
_080227CC: .4byte 0x02022C60

	thumb_func_start BallistaRangeMenu_BallistaUsability
BallistaRangeMenu_BallistaUsability: @ 0x080227D0
	push {lr}
	ldr r0, _080227E4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080227E8
	movs r0, #3
	b _08022804
	.align 2, 0
_080227E4: .4byte 0x03004690
_080227E8:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetBallistaItemAt
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08022802
	movs r0, #2
	b _08022804
_08022802:
	movs r0, #1
_08022804:
	pop {r1}
	bx r1

	thumb_func_start BallistaRangeMenu_Draw
BallistaRangeMenu_Draw: @ 0x08022808
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0802281A
	movs r5, #1
_0802281A:
	ldr r0, _08022850 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x34
	adds r2, r5, #0
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r4, [r4, r5]
	adds r3, r3, r4
	lsls r3, r3, #1
	ldr r4, _08022854 @ =0x02022C60
	adds r3, r3, r4
	bl DrawItemMenuLine
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022850: .4byte 0x03004690
_08022854: .4byte 0x02022C60

	thumb_func_start BallistaRangeMenu_Select
BallistaRangeMenu_Select: @ 0x08022858
	push {lr}
	bl ClearUi
	ldr r1, _08022878 @ =0x0203A85C
	movs r0, #8
	strb r0, [r1, #0x12]
	ldr r0, _0802287C @ =0x03004690
	ldr r0, [r0]
	bl FillBallistaRangeMaybe
	ldr r0, _08022880 @ =0x08B95C98
	bl StartMapSelect
	movs r0, #0x26
	pop {r1}
	bx r1
	.align 2, 0
_08022878: .4byte 0x0203A85C
_0802287C: .4byte 0x03004690
_08022880: .4byte 0x08B95C98

	thumb_func_start FillBallistaRange
FillBallistaRange: @ 0x08022884
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08022900 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r4, _08022904 @ =0x0202E3E8
	ldr r0, [r4]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4]
	bl SetWorkingBmMap
	ldr r4, _08022908 @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r5, r0, #0
	bl UpdateMenuItemPanel
	ldr r0, [r4]
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl MapAddInBoundedRange
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022900: .4byte 0x0202E3E4
_08022904: .4byte 0x0202E3E8
_08022908: .4byte 0x03004690

	thumb_func_start StaffCommandUsability
StaffCommandUsability: @ 0x0802290C
	push {r4, r5, r6, lr}
	ldr r0, _08022920 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022928
	b _08022976
	.align 2, 0
_08022920: .4byte 0x03004690
_08022924:
	movs r0, #2
	b _08022978
_08022928:
	movs r6, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _08022976
_08022930:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #4
	bne _08022960
	ldr r5, _0802295C @ =0x03004690
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022960
	ldr r0, [r5]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022924
	movs r0, #1
	b _08022978
	.align 2, 0
_0802295C: .4byte 0x03004690
_08022960:
	adds r6, #1
	cmp r6, #4
	bgt _08022976
	ldr r0, _08022980 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08022930
_08022976:
	movs r0, #3
_08022978:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022980: .4byte 0x03004690

	thumb_func_start sub_08022984
sub_08022984: @ 0x08022984
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080229DC
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _080229D4 @ =0x08B95A1C
	bl StartMenu
	adds r5, r0, #0
	ldr r4, _080229D8 @ =0x03004690
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl StartEquipInfoWindow
	movs r0, #0x17
	b _080229E4
	.align 2, 0
_080229D4: .4byte 0x08B95A1C
_080229D8: .4byte 0x03004690
_080229DC:
	ldr r1, _080229EC @ =0x0000073B
	bl MenuFrozenHelpBox
	movs r0, #8
_080229E4:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080229EC: .4byte 0x0000073B

	thumb_func_start StaffCommandRange
StaffCommandRange: @ 0x080229F0
	push {r4, r5, r6, lr}
	ldr r5, _08022A2C @ =0x03004690
	ldr r0, [r5]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl GetUnitItemUseReachBits
	adds r6, r0, #0
	ldr r0, _08022A30 @ =0x0202E3E4
	ldr r0, [r0]
	adds r1, r4, #0
	bl BmMapFillg
	ldr r0, _08022A34 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #5
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022A2C: .4byte 0x03004690
_08022A30: .4byte 0x0202E3E4
_08022A34: .4byte 0x0202E3E8

	thumb_func_start sub_08022A38
sub_08022A38: @ 0x08022A38
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start StaffItemSelect_Usability
StaffItemSelect_Usability: @ 0x08022A44
	push {r4, r5, lr}
	ldr r5, _08022A70 @ =0x03004690
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #4
	bne _08022A74
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022A74
	movs r0, #1
	b _08022A76
	.align 2, 0
_08022A70: .4byte 0x03004690
_08022A74:
	movs r0, #3
_08022A76:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08022A7C
sub_08022A7C: @ 0x08022A7C
	push {r4, r5, lr}
	ldr r5, _08022AB4 @ =0x03004690
	ldr r0, [r5]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl UnitEquipItemSlot
	ldr r4, _08022AB8 @ =0x0203A85C
	movs r0, #0
	strb r0, [r4, #0x12]
	bl ClearUi
	ldr r0, [r5]
	ldrb r4, [r4, #0x12]
	lsls r2, r4, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022AB4: .4byte 0x03004690
_08022AB8: .4byte 0x0203A85C

	thumb_func_start sub_08022ABC
sub_08022ABC: @ 0x08022ABC
	push {lr}
	bl ItemSelectMenu_TextDraw
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StaffItemSelect_OnHover
StaffItemSelect_OnHover: @ 0x08022AC8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r5, _08022B10 @ =0x03004690
	ldr r0, [r5]
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl GetUnitItemUseReachBits
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl UpdateMenuItemPanel
	ldr r0, _08022B14 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08022B18 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #4
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022B10: .4byte 0x03004690
_08022B14: .4byte 0x0202E3E4
_08022B18: .4byte 0x0202E3E8

	thumb_func_start sub_08022B1C
sub_08022B1C: @ 0x08022B1C
	push {lr}
	adds r0, #0x63
	movs r1, #4
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08022B2E
	bl HideMoveRangeGraphics
_08022B2E:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_08022B34
sub_08022B34: @ 0x08022B34
	push {r4, lr}
	ldr r4, _08022B58 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022B52
	adds r0, r2, #0
	bl sub_08024094
	bl CountTargets
	cmp r0, #0
	bne _08022B5C
_08022B52:
	movs r0, #3
	b _08022B70
	.align 2, 0
_08022B58: .4byte 0x03004690
_08022B5C:
	ldr r1, [r4]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _08022B6E
	movs r0, #1
	b _08022B70
_08022B6E:
	movs r0, #2
_08022B70:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022B78
sub_08022B78: @ 0x08022B78
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022B9C
	ldr r0, _08022B94 @ =0x03004690
	ldr r0, [r0]
	bl sub_08024094
	ldr r0, _08022B98 @ =0x08B95C38
	bl StartMapSelect
	movs r0, #7
	b _08022BA4
	.align 2, 0
_08022B94: .4byte 0x03004690
_08022B98: .4byte 0x08B95C38
_08022B9C:
	ldr r1, _08022BA8 @ =0x0000073C
	bl MenuFrozenHelpBox
	movs r0, #8
_08022BA4:
	pop {r1}
	bx r1
	.align 2, 0
_08022BA8: .4byte 0x0000073C

	thumb_func_start sub_08022BAC
sub_08022BAC: @ 0x08022BAC
	ldr r2, _08022BBC @ =0x0203A85C
	movs r0, #0xc
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022BBC: .4byte 0x0203A85C

	thumb_func_start sub_08022BC0
sub_08022BC0: @ 0x08022BC0
	push {r4, lr}
	ldr r4, _08022BF0 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022BEC
	adds r0, r2, #0
	bl sub_080240C8
	bl CountTargets
	cmp r0, #0
	beq _08022BEC
	ldr r0, [r4]
	bl sub_08024094
	bl CountTargets
	cmp r0, #0
	beq _08022BF4
_08022BEC:
	movs r0, #3
	b _08022C08
	.align 2, 0
_08022BF0: .4byte 0x03004690
_08022BF4:
	ldr r1, [r4]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _08022C06
	movs r0, #1
	b _08022C08
_08022C06:
	movs r0, #2
_08022C08:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022C10
sub_08022C10: @ 0x08022C10
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022C34
	ldr r0, _08022C2C @ =0x03004690
	ldr r0, [r0]
	bl sub_080240C8
	ldr r0, _08022C30 @ =0x08B95C18
	bl StartMapSelect
	movs r0, #7
	b _08022C3C
	.align 2, 0
_08022C2C: .4byte 0x03004690
_08022C30: .4byte 0x08B95C18
_08022C34:
	ldr r1, _08022C40 @ =0x0000073C
	bl MenuFrozenHelpBox
	movs r0, #8
_08022C3C:
	pop {r1}
	bx r1
	.align 2, 0
_08022C40: .4byte 0x0000073C

	thumb_func_start sub_08022C44
sub_08022C44: @ 0x08022C44
	ldr r2, _08022C54 @ =0x0203A85C
	movs r0, #0xd
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022C54: .4byte 0x0203A85C

	thumb_func_start DoorCommandUsability
DoorCommandUsability: @ 0x08022C58
	push {r4, lr}
	ldr r4, _08022C78 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022C74
	adds r0, r2, #0
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _08022C7C
_08022C74:
	movs r0, #3
	b _08022C92
	.align 2, 0
_08022C78: .4byte 0x03004690
_08022C7C:
	ldr r0, [r4]
	movs r1, #0x1e
	bl MakeTargetListForDoorAndBridges
	bl CountTargets
	movs r1, #3
	cmp r0, #0
	beq _08022C90
	movs r1, #1
_08022C90:
	adds r0, r1, #0
_08022C92:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08022C98
sub_08022C98: @ 0x08022C98
	push {r4, lr}
	ldr r4, _08022CB8 @ =0x0203A85C
	movs r0, #0x10
	strb r0, [r4, #0x11]
	ldr r0, _08022CBC @ =0x03004690
	ldr r0, [r0]
	ldrb r1, [r0, #0xb]
	strb r1, [r4, #0xc]
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022CB8: .4byte 0x0203A85C
_08022CBC: .4byte 0x03004690

	thumb_func_start ChestCommandUsability
ChestCommandUsability: @ 0x08022CC0
	push {r4, lr}
	ldr r4, _08022CE0 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022CDC
	adds r0, r2, #0
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _08022CE4
_08022CDC:
	movs r0, #3
	b _08022CF6
	.align 2, 0
_08022CE0: .4byte 0x03004690
_08022CE4:
	ldr r0, [r4]
	bl CanUnitUseChestKeyItem
	lsls r0, r0, #0x18
	movs r1, #3
	cmp r0, #0
	beq _08022CF4
	movs r1, #1
_08022CF4:
	adds r0, r1, #0
_08022CF6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08022CFC
sub_08022CFC: @ 0x08022CFC
	push {r4, lr}
	ldr r4, _08022D18 @ =0x0203A85C
	movs r0, #0x12
	strb r0, [r4, #0x11]
	ldr r0, _08022D1C @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022D18: .4byte 0x0203A85C
_08022D1C: .4byte 0x03004690

	thumb_func_start sub_08022D20
sub_08022D20: @ 0x08022D20
	push {r4, lr}
	ldr r0, _08022D98 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022DAC
	ldr r1, _08022D9C @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08022DAC
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _08022D50
	bl GetConvoyItemCount
	cmp r0, #0
	beq _08022DAC
_08022D50:
	bl sub_08079D9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022DAC
	movs r0, #0x28
	bl GetUnitByPid
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08022DAC
	ldr r0, _08022D98 @ =0x03004690
	ldr r4, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	subs r1, r0, r2
	cmp r1, #0
	bge _08022D80
	subs r1, r2, r0
_08022D80:
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	subs r0, r4, r2
	cmp r0, #0
	blt _08022DA0
	adds r0, r1, r0
	cmp r0, #1
	beq _08022DA8
	b _08022DAC
	.align 2, 0
_08022D98: .4byte 0x03004690
_08022D9C: .4byte 0x0202BBB8
_08022DA0:
	subs r0, r2, r4
	adds r0, r1, r0
	cmp r0, #1
	bne _08022DAC
_08022DA8:
	movs r0, #1
	b _08022DAE
_08022DAC:
	movs r0, #3
_08022DAE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08022DB4
sub_08022DB4: @ 0x08022DB4
	push {lr}
	ldr r1, _08022DCC @ =0x0203A85C
	movs r0, #0x1a
	strb r0, [r1, #0x11]
	ldr r0, _08022DD0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0
	bl StartBmSupply
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022DCC: .4byte 0x0203A85C
_08022DD0: .4byte 0x03004690

	thumb_func_start sub_08022DD4
sub_08022DD4: @ 0x08022DD4
	push {lr}
	ldr r0, _08022DE8 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022DEC
	movs r0, #3
	b _08022E02
	.align 2, 0
_08022DE8: .4byte 0x03004690
_08022DEC:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0x13
	bne _08022E00
	movs r1, #1
_08022E00:
	adds r0, r1, #0
_08022E02:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022E08
sub_08022E08: @ 0x08022E08
	push {lr}
	ldr r0, _08022E24 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022E24: .4byte 0x03004690

	thumb_func_start sub_08022E28
sub_08022E28: @ 0x08022E28
	push {lr}
	ldr r0, _08022E3C @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022E40
	movs r0, #3
	b _08022E56
	.align 2, 0
_08022E3C: .4byte 0x03004690
_08022E40:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0x14
	bne _08022E54
	movs r1, #1
_08022E54:
	adds r0, r1, #0
_08022E56:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022E5C
sub_08022E5C: @ 0x08022E5C
	push {lr}
	ldr r0, _08022E78 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022E78: .4byte 0x03004690

	thumb_func_start sub_08022E7C
sub_08022E7C: @ 0x08022E7C
	push {lr}
	ldr r0, _08022E90 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022E94
	movs r0, #3
	b _08022EAA
	.align 2, 0
_08022E90: .4byte 0x03004690
_08022E94:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0x15
	bne _08022EA8
	movs r1, #1
_08022EA8:
	adds r0, r1, #0
_08022EAA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022EB0
sub_08022EB0: @ 0x08022EB0
	push {lr}
	ldr r0, _08022ECC @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022ECC: .4byte 0x03004690

	thumb_func_start sub_08022ED0
sub_08022ED0: @ 0x08022ED0
	push {lr}
	ldr r0, _08022F00 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022EFA
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08022F04 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	beq _08022F08
_08022EFA:
	movs r0, #3
	b _08022F1A
	.align 2, 0
_08022F00: .4byte 0x03004690
_08022F04: .4byte 0x0202E3E0
_08022F08:
	adds r0, r2, #0
	bl ArenaIsUnitAllowed
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _08022F18
	movs r1, #1
_08022F18:
	adds r0, r1, #0
_08022F1A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022F20
sub_08022F20: @ 0x08022F20
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	bne _08022F5C
	ldr r0, _08022F44 @ =0x03004690
	ldr r0, [r0]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022F4C
	ldr r1, _08022F48 @ =0x0000073D
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	b _08022F54
	.align 2, 0
_08022F44: .4byte 0x03004690
_08022F48: .4byte 0x0000073D
_08022F4C:
	ldr r1, _08022F58 @ =0x0000073E
	adds r0, r4, #0
	bl MenuFrozenHelpBox
_08022F54:
	movs r0, #8
	b _08022F62
	.align 2, 0
_08022F58: .4byte 0x0000073E
_08022F5C:
	bl sub_080B267C
	movs r0, #0x17
_08022F62:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08022F68
sub_08022F68: @ 0x08022F68
	movs r0, #3
	bx lr

	thumb_func_start sub_08022F6C
sub_08022F6C: @ 0x08022F6C
	ldr r1, _08022F74 @ =0x0203A85C
	movs r0, #0x20
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08022F74: .4byte 0x0203A85C

	thumb_func_start StealCommandUsability
StealCommandUsability: @ 0x08022F78
	push {r4, lr}
	ldr r4, _08022FAC @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08022FA8
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022FA8
	adds r0, r2, #0
	bl MakeTargetListForSteal
	bl CountTargets
	cmp r0, #0
	bne _08022FB0
_08022FA8:
	movs r0, #3
	b _08022FC0
	.align 2, 0
_08022FAC: .4byte 0x03004690
_08022FB0:
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	beq _08022FBE
	movs r0, #1
	b _08022FC0
_08022FBE:
	movs r0, #2
_08022FC0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022FC8
sub_08022FC8: @ 0x08022FC8
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022FF0
	bl ClearUi
	ldr r0, _08022FE8 @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForSteal
	ldr r0, _08022FEC @ =0x08B95BF8
	bl StartMapSelect
	movs r0, #7
	b _08022FF8
	.align 2, 0
_08022FE8: .4byte 0x03004690
_08022FEC: .4byte 0x08B95BF8
_08022FF0:
	ldr r1, _08022FFC @ =0x0000074B
	bl MenuFrozenHelpBox
	movs r0, #8
_08022FF8:
	pop {r1}
	bx r1
	.align 2, 0
_08022FFC: .4byte 0x0000074B

	thumb_func_start sub_08023000
sub_08023000: @ 0x08023000
	push {r4, lr}
	adds r4, r0, #0
	bl StartUnitInventoryInfoWindow
	ldr r0, _0802301C @ =0x00000721
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802301C: .4byte 0x00000721

	thumb_func_start sub_08023020
sub_08023020: @ 0x08023020
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitStealInventoryInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StealMapSelect_Select
StealMapSelect_Select: @ 0x08023044
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _080230D4 @ =0x0203A85C
	ldrb r0, [r1, #2]
	strb r0, [r6, #0xd]
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _080230D8 @ =0x08B95920
	bl StartMenu
	adds r0, r4, #0
	bl EndTargetSelection
	ldr r0, _080230DC @ =0x020234E4
	ldr r1, _080230E0 @ =0x081960D4
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_t
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	bl GetStringTextLen
	movs r4, #0x38
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	ldr r5, _080230E4 @ =0x02022D26
	movs r1, #7
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	adds r5, #0x80
	ldrb r0, [r6, #0xd]
	bl GetUnit
	bl GetUnitFid
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	movs r3, #5
	bl PutFace80x72_Core
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080230D4: .4byte 0x0203A85C
_080230D8: .4byte 0x08B95920
_080230DC: .4byte 0x020234E4
_080230E0: .4byte 0x081960D4
_080230E4: .4byte 0x02022D26

	thumb_func_start StealItemMenuCommand_Usability
StealItemMenuCommand_Usability: @ 0x080230E8
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _08023104 @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08023108
	movs r0, #3
	b _08023124
	.align 2, 0
_08023104: .4byte 0x0203A85C
_08023108:
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023122
	movs r0, #1
	b _08023124
_08023122:
	movs r0, #2
_08023124:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StealItemMenuCommand_Draw
StealItemMenuCommand_Draw: @ 0x0802312C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08023178 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl IsItemStealable
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _0802317C @ =0x02022C60
	adds r3, r3, r1
	adds r1, r4, #0
	bl DrawItemMenuLine
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023178: .4byte 0x0203A85C
_0802317C: .4byte 0x02022C60

	thumb_func_start sub_08023180
sub_08023180: @ 0x08023180
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080231A4
	ldr r1, _080231A0 @ =0x0203A85C
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x12]
	movs r0, #6
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _080231AE
	.align 2, 0
_080231A0: .4byte 0x0203A85C
_080231A4:
	ldr r1, _080231B4 @ =0x0000073F
	adds r0, r2, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080231AE:
	pop {r1}
	bx r1
	.align 2, 0
_080231B4: .4byte 0x0000073F

	thumb_func_start ConvoyMenu_HelpBox
ConvoyMenu_HelpBox: @ 0x080231B8
	push {r4, lr}
	adds r4, r1, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _080231E4
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _080231E0 @ =0x0202BBB8
	ldrh r2, [r2, #0x2c]
	bl StartItemHelpBox
	movs r0, #0
	b _08023204
	.align 2, 0
_080231E0: .4byte 0x0202BBB8
_080231E4:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _0802320C @ =0x03004690
	ldr r3, [r2]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r3, #0x1e
	adds r3, r3, r2
	ldrh r2, [r3]
	bl StartItemHelpBox
_08023204:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802320C: .4byte 0x03004690

	thumb_func_start ItemMenu_HelpBox
ItemMenu_HelpBox: @ 0x08023210
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _08023244 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0x2a
	ldrsh r3, [r4, r1]
	lsls r3, r3, #3
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	lsls r1, r1, #3
	adds r4, #0x3c
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r0, r3, #0
	bl StartItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023244: .4byte 0x0203A85C

	thumb_func_start BallistaRangeMenuHelpBox
BallistaRangeMenuHelpBox: @ 0x08023248
	push {r4, r5, lr}
	movs r0, #0x2a
	ldrsh r5, [r1, r0]
	lsls r5, r5, #3
	movs r0, #0x2c
	ldrsh r4, [r1, r0]
	lsls r4, r4, #3
	ldr r0, _08023278 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartItemHelpBox
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023278: .4byte 0x03004690

	thumb_func_start sub_0802327C
sub_0802327C: @ 0x0802327C
	push {lr}
	bl sub_08031DFC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08023288
sub_08023288: @ 0x08023288
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitHpInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080232AC
sub_080232AC: @ 0x080232AC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803202C
	ldr r0, _080232C8 @ =0x0000071C
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080232C8: .4byte 0x0000071C

	thumb_func_start sub_080232CC
sub_080232CC: @ 0x080232CC
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitRescueInfoWindows
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080232F0
sub_080232F0: @ 0x080232F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08023308 @ =0x0000071D
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023308: .4byte 0x0000071D

	thumb_func_start sub_0802330C
sub_0802330C: @ 0x0802330C
	bx lr
	.align 2, 0

	thumb_func_start sub_08023310
sub_08023310: @ 0x08023310
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080321E0
	ldr r0, _0802332C @ =0x0000071F
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802332C: .4byte 0x0000071F

	thumb_func_start sub_08023330
sub_08023330: @ 0x08023330
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitGiveInfoWindows
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023354
sub_08023354: @ 0x08023354
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803202C
	ldr r0, _08023370 @ =0x0000071E
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023370: .4byte 0x0000071E

	thumb_func_start sub_08023374
sub_08023374: @ 0x08023374
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitTakeInfoWindows
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023398
sub_08023398: @ 0x08023398
	push {r4, lr}
	adds r4, r0, #0
	bl StartUnitInventoryInfoWindow
	movs r0, #0xe4
	lsls r0, r0, #3
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TradeSelection_OnChange
TradeSelection_OnChange: @ 0x080233B8
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	bl ClearIcons
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitInventoryInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080233E0
sub_080233E0: @ 0x080233E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08031DFC
	ldr r0, _080233FC @ =0x00000723
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080233FC: .4byte 0x00000723

	thumb_func_start sub_08023400
sub_08023400: @ 0x08023400
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitHpInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023424
sub_08023424: @ 0x08023424
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08031DFC
	ldr r0, _08023440 @ =0x00000724
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023440: .4byte 0x00000724

	thumb_func_start sub_08023444
sub_08023444: @ 0x08023444
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitHpInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023468
sub_08023468: @ 0x08023468
	push {lr}
	bl sub_08031DFC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08023474
sub_08023474: @ 0x08023474
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl RefreshUnitHpInfoWindow
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023498
sub_08023498: @ 0x08023498
	push {lr}
	ldr r0, _080234E4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080234EC
	ldr r0, [r2, #0xc]
	movs r1, #0x83
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080234EC
	ldr r1, _080234E8 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080234EC
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _080234EC
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _080234EC
	movs r0, #1
	b _080234EE
	.align 2, 0
_080234E4: .4byte 0x03004690
_080234E8: .4byte 0x0202BBB8
_080234EC:
	movs r0, #3
_080234EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080234F4
sub_080234F4: @ 0x080234F4
	push {r4, lr}
	ldr r1, _08023518 @ =0x0203A85C
	movs r0, #0x1e
	strb r0, [r1, #0x11]
	ldr r4, _0802351C @ =0x03004690
	ldr r0, [r4]
	bl RideBallista
	bl EndAllMus
	ldr r0, [r4]
	bl StartMu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023518: .4byte 0x0203A85C
_0802351C: .4byte 0x03004690

	thumb_func_start sub_08023520
sub_08023520: @ 0x08023520
	ldr r0, _08023544 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802354C
	ldr r1, _08023548 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802354C
	movs r0, #1
	b _0802354E
	.align 2, 0
_08023544: .4byte 0x03004690
_08023548: .4byte 0x0202BBB8
_0802354C:
	movs r0, #3
_0802354E:
	bx lr

	thumb_func_start sub_08023550
sub_08023550: @ 0x08023550
	push {r4, lr}
	ldr r1, _08023574 @ =0x0203A85C
	movs r0, #0x1f
	strb r0, [r1, #0x11]
	ldr r4, _08023578 @ =0x03004690
	ldr r0, [r4]
	bl TryRemoveUnitFromBallista
	bl EndAllMus
	ldr r0, [r4]
	bl StartMu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023574: .4byte 0x0203A85C
_08023578: .4byte 0x03004690

	thumb_func_start GetUnitAttackCommandAvailability
GetUnitAttackCommandAvailability: @ 0x0802357C
	push {r4, r5, r6, lr}
	ldr r0, _08023598 @ =0x03004690
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080235EC
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _080235A0
	b _080235EC
	.align 2, 0
_08023598: .4byte 0x03004690
_0802359C:
	movs r0, #1
	b _080235EE
_080235A0:
	movs r6, #0
	ldrh r4, [r1, #0x1e]
	cmp r4, #0
	beq _080235EC
_080235A8:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080235D6
	ldr r5, _080235F4 @ =0x03004690
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080235D6
	ldr r0, [r5]
	adds r1, r4, #0
	bl ListAttackTargetsForWeapon
	bl CountTargets
	cmp r0, #0
	bne _0802359C
_080235D6:
	adds r6, #1
	cmp r6, #4
	bgt _080235EC
	ldr r0, _080235F4 @ =0x03004690
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080235A8
_080235EC:
	movs r0, #3
_080235EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080235F4: .4byte 0x03004690

	thumb_func_start GetUnitAttackBallistaCommandAvailability
GetUnitAttackBallistaCommandAvailability: @ 0x080235F8
	push {r4, r5, lr}
	ldr r5, _0802363C @ =0x03004690
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08023638
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	adds r4, r0, #0
	bl sub_080347E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023638
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	orrs r1, r2
	bl ListAttackTargetsForWeapon
	bl CountTargets
	cmp r0, #0
	bne _08023640
_08023638:
	movs r0, #3
	b _08023650
	.align 2, 0
_0802363C: .4byte 0x03004690
_08023640:
	adds r0, r4, #0
	bl sub_0803483C
	cmp r0, #0
	beq _0802364E
	movs r0, #1
	b _08023650
_0802364E:
	movs r0, #2
_08023650:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ItemMenu_Is1stCommandAvailable
ItemMenu_Is1stCommandAvailable: @ 0x08023658
	push {lr}
	ldr r0, _08023670 @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForRefresh
	bl CountTargets
	cmp r0, #0
	beq _08023674
	movs r0, #1
	b _08023676
	.align 2, 0
_08023670: .4byte 0x03004690
_08023674:
	movs r0, #3
_08023676:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ItemMenu_Draw1stCommand
ItemMenu_Draw1stCommand: @ 0x0802367C
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
	ldr r0, _080236B8 @ =0x0202BBB8
	ldrh r0, [r0, #0x2c]
	bl GetItemName
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080236BC @ =0x02022C60
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080236B8: .4byte 0x0202BBB8
_080236BC: .4byte 0x02022C60

	thumb_func_start ItemMenu_Select1stCommand
ItemMenu_Select1stCommand: @ 0x080236C0
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080236E4
	ldr r0, _080236DC @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForRefresh
	ldr r0, _080236E0 @ =0x08B95B98
	bl StartMapSelect
	movs r0, #0x27
	b _080236E6
	.align 2, 0
_080236DC: .4byte 0x03004690
_080236E0: .4byte 0x08B95B98
_080236E4:
	movs r0, #8
_080236E6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ItemMenu_AreOtherCommandsAvailable
ItemMenu_AreOtherCommandsAvailable: @ 0x080236EC
	push {r4, r5, lr}
	ldr r5, _08023718 @ =0x03004690
	ldr r0, [r5]
	subs r1, #1
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0xc
	bne _0802371C
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802371C
	movs r0, #1
	b _0802371E
	.align 2, 0
_08023718: .4byte 0x03004690
_0802371C:
	movs r0, #3
_0802371E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start ItemMenu_DrawOtherCommands
ItemMenu_DrawOtherCommands: @ 0x08023724
	push {r4, lr}
	adds r2, r1, #0
	ldr r0, _08023764 @ =0x03004690
	ldr r1, [r0]
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, #0
	adds r0, #0x34
	movs r4, #0x2c
	ldrsh r3, [r2, r4]
	lsls r3, r3, #5
	movs r4, #0x2a
	ldrsh r2, [r2, r4]
	adds r3, r3, r2
	lsls r3, r3, #1
	ldr r2, _08023768 @ =0x02022C60
	adds r3, r3, r2
	movs r2, #1
	bl DrawItemMenuLine
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023764: .4byte 0x03004690
_08023768: .4byte 0x02022C60

	thumb_func_start sub_0802376C
sub_0802376C: @ 0x0802376C
	push {r4, lr}
	ldr r4, _08023798 @ =0x0203A85C
	adds r1, #0x3c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r4, #0x12]
	bl ClearUi
	ldr r0, _0802379C @ =0x03004690
	ldr r0, [r0]
	ldrb r4, [r4, #0x12]
	lsls r2, r4, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023798: .4byte 0x0203A85C
_0802379C: .4byte 0x03004690

	thumb_func_start ItemMenu_SwitchIn
ItemMenu_SwitchIn: @ 0x080237A0
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080237B4
	movs r0, #5
	bl UpdateMenuItemPanel
	b _080237BE
_080237B4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #1
	bl UpdateMenuItemPanel
_080237BE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080237C4
sub_080237C4: @ 0x080237C4
	bx lr
	.align 2, 0

	thumb_func_start ItemMenuHelpBox
ItemMenuHelpBox: @ 0x080237C8
	push {r4, lr}
	adds r3, r1, #0
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080237E4
	ldr r0, _080237E0 @ =0x0202BBB8
	ldrh r2, [r0, #0x2c]
	b _080237F6
	.align 2, 0
_080237E0: .4byte 0x0202BBB8
_080237E4:
	ldr r0, _0802380C @ =0x03004690
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r2, [r1]
_080237F6:
	movs r1, #0x2a
	ldrsh r0, [r3, r1]
	lsls r0, r0, #3
	movs r4, #0x2c
	ldrsh r1, [r3, r4]
	lsls r1, r1, #3
	bl StartItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802380C: .4byte 0x03004690

	thumb_func_start CountFactionMoveableUnits
CountFactionMoveableUnits: @ 0x08023810
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _08023860
_0802381A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802385C
	ldr r3, [r2]
	cmp r3, #0
	beq _0802385C
	ldr r0, [r2, #0xc]
	ldr r1, _08023870 @ =0x000100AE
	ands r0, r1
	cmp r0, #0
	bne _0802385C
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _0802385C
	cmp r1, #4
	beq _0802385C
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _0802385C
	adds r6, #1
_0802385C:
	adds r4, #1
	adds r0, r5, #0
_08023860:
	adds r0, #0x40
	cmp r4, r0
	blt _0802381A
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023870: .4byte 0x000100AE

	thumb_func_start CountFactionUnitsWithoutFlags
CountFactionUnitsWithoutFlags: @ 0x08023874
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
	adds r4, r5, #1
	b _080238A0
_08023880:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0802389C
	ldr r0, [r1]
	cmp r0, #0
	beq _0802389C
	ldr r0, [r1, #0xc]
	ands r0, r7
	cmp r0, #0
	bne _0802389C
	adds r6, #1
_0802389C:
	adds r4, #1
	adds r0, r5, #0
_080238A0:
	adds r0, #0x40
	cmp r4, r0
	blt _08023880
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start AreUnitIdsAllied
AreUnitIdsAllied: @ 0x080238B0
	movs r2, #0x80
	ands r1, r2
	movs r3, #0
	ands r2, r0
	cmp r2, r1
	bne _080238BE
	movs r3, #1
_080238BE:
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start AreUnitIdsSameFaction
AreUnitIdsSameFaction: @ 0x080238C4
	movs r2, #0xc0
	ands r1, r2
	movs r3, #0
	ands r2, r0
	cmp r2, r1
	bne _080238D2
	movs r3, #1
_080238D2:
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start GetActiveFactionAlliance
GetActiveFactionAlliance: @ 0x080238D8
	ldr r1, _080238E8 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080238E8: .4byte 0x0202BBF8

	thumb_func_start GetActiveFactionOpposingAlliance
GetActiveFactionOpposingAlliance: @ 0x080238EC
	ldr r1, _08023900 @ =0x0202BBF8
	movs r2, #0x80
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	eors r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08023900: .4byte 0x0202BBF8
