	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020098
sub_08020098: @ 0x08020098
	adds r1, #0x4c
	strh r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_080200A0
sub_080200A0: @ 0x080200A0
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

	thumb_func_start sub_080200D0
sub_080200D0: @ 0x080200D0
	adds r0, #0x52
	movs r1, #2
	strh r1, [r0]
	bx lr

	thumb_func_start sub_080200D8
sub_080200D8: @ 0x080200D8
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0802010C
	bl sub_080C57C4
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
	bl sub_0802DE6C
	adds r0, r4, #0
	bl Proc_Break
_0802010C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020114: .4byte 0x0202BBF8

	thumb_func_start sub_08020118
sub_08020118: @ 0x08020118
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

	thumb_func_start sub_080201C8
sub_080201C8: @ 0x080201C8
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
	bl sub_08001434
	movs r0, #3
	movs r1, #0
	bl sub_08001434
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
	bl sub_0801F488
	bl sub_0801F3B4
	movs r0, #0xc
	bl EnableBgSync
	ldr r0, _08020344 @ =sub_080201C8
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
	bl sub_080020BC
	ldr r4, _08020350 @ =0x02022860
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_080020F4
	adds r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	movs r3, #1
	bl sub_080020F4
	adds r5, #0x4c
	movs r0, #0x15
	strh r0, [r5]
	movs r4, #9
_0802030C:
	bl sub_080C57C4
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
_08020344: .4byte sub_080201C8
_08020348: .4byte 0x0000FFE0
_0802034C: .4byte 0x0000E0FF
_08020350: .4byte 0x02022860

	thumb_func_start sub_08020354
sub_08020354: @ 0x08020354
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _08020382
	bl sub_080C57C4
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

	thumb_func_start sub_08020388
sub_08020388: @ 0x08020388
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

	thumb_func_start sub_080203D0
sub_080203D0: @ 0x080203D0
	push {r4, r5, lr}
	bl sub_080020BC
	ldr r4, _08020404 @ =0x02022860
	movs r5, #1
	rsbs r5, r5, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl sub_080020F4
	adds r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl sub_080020F4
	movs r0, #4
	bl FadeBgmOut
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020404: .4byte 0x02022860

	thumb_func_start sub_08020408
sub_08020408: @ 0x08020408
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080C57C4
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
	bl sub_080BE594
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

	thumb_func_start sub_0802061C
sub_0802061C: @ 0x0802061C
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

	thumb_func_start sub_08020668
sub_08020668: @ 0x08020668
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

	thumb_func_start sub_0802071C
sub_0802071C: @ 0x0802071C
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

	thumb_func_start sub_0802078C
sub_0802078C: @ 0x0802078C
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

	thumb_func_start sub_080207DC
sub_080207DC: @ 0x080207DC
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
	bl sub_080BE594
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
	bl sub_080BE594
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

	thumb_func_start sub_08020C5C
sub_08020C5C: @ 0x08020C5C
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
	bl sub_080BFA68
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
	bl sub_08001434
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

	thumb_func_start sub_08020E34
sub_08020E34: @ 0x08020E34
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
	bl sub_080069F4
_08020ECE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020ED8: .4byte 0x08B905B0

	thumb_func_start sub_08020EDC
sub_08020EDC: @ 0x08020EDC
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
	bl sub_08012FE8
	str r0, [r5]
	mov r0, r8
	ldr r1, [r0]
	str r4, [sp]
	movs r0, #0
	mov r2, sb
	adds r3, r6, #0
	bl sub_08012FE8
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
	bl sub_08020EDC
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
	bl sub_08020EDC
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

	thumb_func_start sub_080210E4
sub_080210E4: @ 0x080210E4
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
	bl sub_08003078
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

	thumb_func_start sub_0802114C
sub_0802114C: @ 0x0802114C
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

	thumb_func_start sub_08021174
sub_08021174: @ 0x08021174
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

	thumb_func_start sub_080211AC
sub_080211AC: @ 0x080211AC
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

	thumb_func_start sub_08021234
sub_08021234: @ 0x08021234
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

	thumb_func_start sub_080212D8
sub_080212D8: @ 0x080212D8
	push {lr}
	ldr r0, _080212F0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080212EC
	ldr r0, _080212F4 @ =0x000002F9
	bl sub_080BE594
_080212EC:
	pop {r0}
	bx r0
	.align 2, 0
_080212F0: .4byte 0x0202BBF8
_080212F4: .4byte 0x000002F9

	thumb_func_start sub_080212F8
sub_080212F8: @ 0x080212F8
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
	bl sub_0801245C
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

	thumb_func_start sub_080214F4
sub_080214F4: @ 0x080214F4
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

	thumb_func_start sub_08021544
sub_08021544: @ 0x08021544
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

	thumb_func_start sub_08021594
sub_08021594: @ 0x08021594
	push {lr}
	ldr r0, _080215AC @ =0x08B93374
	bl Proc_Find
	movs r1, #0xa
	bl Proc_Goto
	bl sub_0808AAF4
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

	thumb_func_start sub_080215C4
sub_080215C4: @ 0x080215C4
	push {lr}
	movs r0, #0
	bl sub_08087190
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080215D4
sub_080215D4: @ 0x080215D4
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

	thumb_func_start sub_08021644
sub_08021644: @ 0x08021644
	ldr r1, _08021650 @ =0x0203A85C
	movs r0, #1
	strb r0, [r1, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021650: .4byte 0x0203A85C

	thumb_func_start sub_08021654
sub_08021654: @ 0x08021654
	push {lr}
	bl sub_0804AF00
	ldr r0, _080216A0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	bl sub_0801D2D4
	ldr r0, _080216A4 @ =0x08B95AAC
	ldr r2, _080216A8 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_0804AB00
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
	bl sub_08015D70
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

	thumb_func_start sub_08021714
sub_08021714: @ 0x08021714
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
	bl sub_0804AB00
	pop {r0}
	bx r0
	.align 2, 0
_08021730: .4byte 0x08B95AAC
_08021734: .4byte 0x0202BBB8

	thumb_func_start sub_08021738
sub_08021738: @ 0x08021738
	push {lr}
	bl sub_0804AF00
	ldr r0, _08021764 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl sub_0801D2D4
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

	thumb_func_start sub_0802176C
sub_0802176C: @ 0x0802176C
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
	bl sub_0804AB00
	bl sub_0801D2D4
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

	thumb_func_start sub_080217B0
sub_080217B0: @ 0x080217B0
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
	bl sub_08023E38
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
	bl sub_08023E38
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

	thumb_func_start sub_0802181C
sub_0802181C: @ 0x0802181C
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
	bl sub_08023EC4
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

	thumb_func_start sub_08021854
sub_08021854: @ 0x08021854
	push {lr}
	ldr r0, _0802186C @ =0x03004690
	ldr r0, [r0]
	bl sub_08023EC4
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

	thumb_func_start sub_08021968
sub_08021968: @ 0x08021968
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl sub_0803279C
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl sub_0801D3DC
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_0801D4D0
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
	bl sub_08021968
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
	bl sub_08021968
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
	bl sub_08007A64
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
	bl sub_08007A64
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

	thumb_func_start sub_08021B34
sub_08021B34: @ 0x08021B34
	push {r4, r5, lr}
	ldr r0, _08021B70 @ =0x0202E3E4
	ldr r0, [r0]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl MapFill
	ldr r0, _08021B74 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
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
	bl sub_0801B19C
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
	bl sub_0801D2A0
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08021B9C
sub_08021B9C: @ 0x08021B9C
	push {lr}
	bl sub_0801D2D4
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_08021BA8
sub_08021BA8: @ 0x08021BA8
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

	thumb_func_start sub_08021BF4
sub_08021BF4: @ 0x08021BF4
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

	thumb_func_start sub_08021C38
sub_08021C38: @ 0x08021C38
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
	bl sub_08016470
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08021C80: .4byte 0x03004690
_08021C84: .4byte 0x02022C60

	thumb_func_start sub_08021C88
sub_08021C88: @ 0x08021C88
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl sub_0801DFC0
	ldr r0, _08021CD0 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08021CD4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r4, _08021CD8 @ =0x03004690
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl GetUnitWeaponReach
	adds r1, r0, #0
	ldr r0, [r4]
	bl BuildUnitStandingRangeForReach
	movs r0, #2
	bl sub_0801D2A0
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
	bl sub_0801D2D4
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

	thumb_func_start sub_08021D68
sub_08021D68: @ 0x08021D68
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
	bl sub_0801EC10
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
	bl sub_0802A254
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
	bl sub_08034164
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08021DE8: .4byte 0x03004690

	thumb_func_start sub_08021DEC
sub_08021DEC: @ 0x08021DEC
	push {lr}
	ldr r0, _08021E0C @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl sub_0801D2D4
	bl sub_0803418C
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
	bl sub_08023D64
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

	thumb_func_start sub_08021E64
sub_08021E64: @ 0x08021E64
	push {lr}
	bl ClearUi
	ldr r0, _08021E80 @ =0x03004690
	ldr r0, [r0]
	bl sub_08023D64
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
	bl sub_08078BD0
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
	bl sub_08078BD0
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
	bl sub_0801878C
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
	bl sub_08024478
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
	bl sub_08026CD0
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

	thumb_func_start sub_08022094
sub_08022094: @ 0x08022094
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
	bl sub_08024478
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
	bl sub_08026CD0
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
	bl sub_080236C0
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
	bl sub_08007A64
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

	thumb_func_start sub_08022168
sub_08022168: @ 0x08022168
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
	bl sub_08007A64
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

	thumb_func_start sub_08022204
sub_08022204: @ 0x08022204
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
	bl sub_08021C38
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
	bl sub_08026CD0
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
	bl sub_08016470
	movs r0, #1
	bl EnableBgSync
_08022280:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08022288: .4byte 0x02022C60

	thumb_func_start sub_0802228C
sub_0802228C: @ 0x0802228C
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
	bl sub_08021BA8
_080222C2:
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_08026CD0
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
	bl StartMenuExt
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
	bl sub_0801DFC0
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

	thumb_func_start sub_080223B0
sub_080223B0: @ 0x080223B0
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
	bl sub_0804A490
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
	bl sub_080223B0
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
	bl sub_08007A64
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
	bl sub_080176DC
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
	bl sub_08007A64
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
	bl sub_08006D50
	ldr r0, _08022528 @ =0x08B95AAC
	ldr r2, _0802252C @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_0804AB00
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
	bl sub_08026CD0
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
	bl sub_08026F4C
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
	bl sub_080270FC
	ldr r0, _080226A8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08022688
	ldr r0, _080226AC @ =0x0000038A
	bl sub_080BE594
_08022688:
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl sub_0804A490
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

	thumb_func_start sub_080226F0
sub_080226F0: @ 0x080226F0
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
	bl sub_08006D50
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08021E64
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
	bl StartMenuExt
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

	thumb_func_start sub_08022798
sub_08022798: @ 0x08022798
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080227C4 @ =0x03004690
	ldr r0, [r0]
	ldr r4, _080227C8 @ =0x0203A85C
	ldrb r1, [r4, #0x12]
	bl sub_08018D50
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

	thumb_func_start sub_080227D0
sub_080227D0: @ 0x080227D0
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
	bl sub_080346C8
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

	thumb_func_start sub_08022808
sub_08022808: @ 0x08022808
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
	bl sub_080346C8
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
	bl sub_08016470
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022850: .4byte 0x03004690
_08022854: .4byte 0x02022C60

	thumb_func_start sub_08022858
sub_08022858: @ 0x08022858
	push {lr}
	bl ClearUi
	ldr r1, _08022878 @ =0x0203A85C
	movs r0, #8
	strb r0, [r1, #0x12]
	ldr r0, _0802287C @ =0x03004690
	ldr r0, [r0]
	bl sub_080241AC
	ldr r0, _08022880 @ =0x08B95C98
	bl StartMapSelect
	movs r0, #0x26
	pop {r1}
	bx r1
	.align 2, 0
_08022878: .4byte 0x0203A85C
_0802287C: .4byte 0x03004690
_08022880: .4byte 0x08B95C98

	thumb_func_start sub_08022884
sub_08022884: @ 0x08022884
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08022900 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r4, _08022904 @ =0x0202E3E8
	ldr r0, [r4]
	movs r1, #0
	bl MapFill
	ldr r0, [r4]
	bl sub_0801B190
	ldr r4, _08022908 @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_080346C8
	adds r5, r0, #0
	bl sub_0801DFC0
	ldr r0, [r4]
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	bl sub_0801736C
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl sub_08017384
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl sub_0801B19C
	movs r0, #2
	bl sub_0801D2A0
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

	thumb_func_start sub_0802290C
sub_0802290C: @ 0x0802290C
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
	bl sub_08026CD0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022960
	ldr r0, [r5]
	bl sub_0801878C
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
	bl sub_08007A64
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

	thumb_func_start sub_080229F0
sub_080229F0: @ 0x080229F0
	push {r4, r5, r6, lr}
	ldr r5, _08022A2C @ =0x03004690
	ldr r0, [r5]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl sub_08016F10
	adds r6, r0, #0
	ldr r0, _08022A30 @ =0x0202E3E4
	ldr r0, [r0]
	adds r1, r4, #0
	bl MapFill
	ldr r0, _08022A34 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #5
	bl sub_0801D2A0
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
	bl sub_0801D2D4
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_08022A44
sub_08022A44: @ 0x08022A44
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
	bl sub_08026CD0
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
	bl sub_080270FC
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
	bl sub_08022204
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08022AC8
sub_08022AC8: @ 0x08022AC8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r5, _08022B10 @ =0x03004690
	ldr r0, [r5]
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl sub_08016F10
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_0801DFC0
	ldr r0, _08022B14 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08022B18 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #4
	bl sub_0801D2A0
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
	bl sub_0801D2D4
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

	thumb_func_start sub_08022C58
sub_08022C58: @ 0x08022C58
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
	bl sub_08024298
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

	thumb_func_start sub_08022CC0
sub_08022CC0: @ 0x08022CC0
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
	bl sub_08027354
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
	bl sub_080176DC
	cmp r0, #0
	bne _08022D50
	bl sub_0802E770
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
	bl sub_080974CC
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
	bl sub_08078BD0
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
	bl sub_08078C14
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
	bl sub_08078BD0
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
	bl sub_08078C14
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
	bl sub_08078BD0
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
	bl sub_08078C14
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
	bl sub_0802F158
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
	bl sub_0801878C
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

	thumb_func_start sub_08022F78
sub_08022F78: @ 0x08022F78
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
	bl sub_08024504
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
	bl sub_080176DC
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
	bl sub_08024504
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
	bl sub_08031A74
	ldr r0, _0802301C @ =0x00000721
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
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
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08031BA8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023044
sub_08023044: @ 0x08023044
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
	bl sub_0804AF00
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
	bl sub_080055FC
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
	bl sub_08005AD4
	adds r5, #0x80
	ldrb r0, [r6, #0xd]
	bl GetUnit
	bl GetUnitFid
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	movs r3, #5
	bl sub_080072D0
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

	thumb_func_start sub_080230E8
sub_080230E8: @ 0x080230E8
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

	thumb_func_start sub_0802312C
sub_0802312C: @ 0x0802312C
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
	bl sub_08016470
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

	thumb_func_start sub_080231B8
sub_080231B8: @ 0x080231B8
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
	bl sub_0808198C
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
	bl sub_0808198C
_08023204:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802320C: .4byte 0x03004690

	thumb_func_start sub_08023210
sub_08023210: @ 0x08023210
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
	bl sub_0808198C
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023244: .4byte 0x0203A85C

	thumb_func_start sub_08023248
sub_08023248: @ 0x08023248
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
	bl sub_080346C8
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0808198C
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
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08031E10
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
	bl sub_08032560
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
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08032064
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
	bl sub_08032560
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
	bl sub_08032560
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
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08032218
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
	bl sub_08032560
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
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_0803211C
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08023398
sub_08023398: @ 0x08023398
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08031A74
	movs r0, #0xe4
	lsls r0, r0, #3
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080233B8
sub_080233B8: @ 0x080233B8
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_0801EC10
	bl ClearIcons
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08031A98
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
	bl sub_08032560
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
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08031E10
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
	bl sub_08032560
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
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08031E10
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
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08031E10
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
	bl sub_0802BA70
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
	bl sub_08034770
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
	bl sub_080347A8
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
	bl sub_0802BA70
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

	thumb_func_start sub_08023658
sub_08023658: @ 0x08023658
	push {lr}
	ldr r0, _08023670 @ =0x03004690
	ldr r0, [r0]
	bl sub_08024478
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

	thumb_func_start sub_0802367C
sub_0802367C: @ 0x0802367C
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
	bl sub_08005590
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080236B8: .4byte 0x0202BBB8
_080236BC: .4byte 0x02022C60

	thumb_func_start sub_080236C0
sub_080236C0: @ 0x080236C0
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080236E4
	ldr r0, _080236DC @ =0x03004690
	ldr r0, [r0]
	bl sub_08024478
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

	thumb_func_start sub_080236EC
sub_080236EC: @ 0x080236EC
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
	bl sub_08026CD0
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

	thumb_func_start sub_08023724
sub_08023724: @ 0x08023724
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
	bl sub_08016470
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
	bl sub_080270FC
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023798: .4byte 0x0203A85C
_0802379C: .4byte 0x03004690

	thumb_func_start sub_080237A0
sub_080237A0: @ 0x080237A0
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080237B4
	movs r0, #5
	bl sub_0801DFC0
	b _080237BE
_080237B4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #1
	bl sub_0801DFC0
_080237BE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080237C4
sub_080237C4: @ 0x080237C4
	bx lr
	.align 2, 0

	thumb_func_start sub_080237C8
sub_080237C8: @ 0x080237C8
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
	bl sub_0808198C
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802380C: .4byte 0x03004690

	thumb_func_start sub_08023810
sub_08023810: @ 0x08023810
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

	thumb_func_start sub_08023874
sub_08023874: @ 0x08023874
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

	thumb_func_start sub_080238C4
sub_080238C4: @ 0x080238C4
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

	thumb_func_start sub_080238D8
sub_080238D8: @ 0x080238D8
	ldr r1, _080238E8 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080238E8: .4byte 0x0202BBF8

	thumb_func_start sub_080238EC
sub_080238EC: @ 0x080238EC
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

	thumb_func_start GetGold
GetGold: @ 0x08023904
	ldr r0, _0802390C @ =0x0202BBF8
	ldr r0, [r0, #8]
	bx lr
	.align 2, 0
_0802390C: .4byte 0x0202BBF8

	thumb_func_start SetGold
SetGold: @ 0x08023910
	ldr r2, _08023920 @ =0x0202BBF8
	str r0, [r2, #8]
	ldr r1, _08023924 @ =0x000F423F
	cmp r0, r1
	ble _0802391C
	str r1, [r2, #8]
_0802391C:
	bx lr
	.align 2, 0
_08023920: .4byte 0x0202BBF8
_08023924: .4byte 0x000F423F

	thumb_func_start sub_08023928
sub_08023928: @ 0x08023928
	ldr r2, _0802393C @ =0x0202BBF8
	ldr r1, [r2, #8]
	adds r1, r1, r0
	str r1, [r2, #8]
	ldr r0, _08023940 @ =0x000F423F
	cmp r1, r0
	ble _08023938
	str r0, [r2, #8]
_08023938:
	bx lr
	.align 2, 0
_0802393C: .4byte 0x0202BBF8
_08023940: .4byte 0x000F423F

	thumb_func_start sub_08023944
sub_08023944: @ 0x08023944
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _080239A4 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0802399C
_08023954:
	ldr r0, _080239A4 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08023996
	lsls r5, r1, #2
_08023964:
	ldr r0, _080239A8 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023990
	ldr r0, _080239AC @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08023990
	bl GetUnit
	bl sub_080BFC68
_08023990:
	subs r4, #1
	cmp r4, #0
	bge _08023964
_08023996:
	adds r1, r6, #0
	cmp r1, #0
	bge _08023954
_0802399C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080239A4: .4byte 0x0202E3D8
_080239A8: .4byte 0x0202E3E4
_080239AC: .4byte 0x0202E3DC

	thumb_func_start sub_080239B0
sub_080239B0: @ 0x080239B0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08023A10 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08023A08
_080239C0:
	ldr r0, _08023A10 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08023A02
	lsls r5, r1, #2
_080239D0:
	ldr r0, _08023A14 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080239FC
	ldr r0, _08023A18 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080239FC
	bl GetUnit
	bl sub_080BFC68
_080239FC:
	subs r4, #1
	cmp r4, #0
	bge _080239D0
_08023A02:
	adds r1, r6, #0
	cmp r1, #0
	bge _080239C0
_08023A08:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023A10: .4byte 0x0202E3D8
_08023A14: .4byte 0x0202E3E8
_08023A18: .4byte 0x0202E3DC

	thumb_func_start sub_08023A1C
sub_08023A1C: @ 0x08023A1C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08023A6C @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08023A64
_08023A2C:
	ldr r0, _08023A6C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _08023A5E
_08023A3A:
	ldr r0, _08023A70 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023A58
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080BFC68
_08023A58:
	subs r4, #1
	cmp r4, #0
	bge _08023A3A
_08023A5E:
	adds r5, r6, #0
	cmp r5, #0
	bge _08023A2C
_08023A64:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023A6C: .4byte 0x0202E3D8
_08023A70: .4byte 0x0202E3E8

	thumb_func_start sub_08023A74
sub_08023A74: @ 0x08023A74
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A2D4
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0801A2D4
	adds r0, r6, #0
	bl sub_080239B0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08023AA8
sub_08023AA8: @ 0x08023AA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A2D4
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0801A2D4
	adds r0, r6, #0
	bl sub_08023A1C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08023ADC
sub_08023ADC: @ 0x08023ADC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl sub_0801A2D4
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0801A2D4
	adds r0, r6, #0
	bl sub_08023A1C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08023B10
sub_08023B10: @ 0x08023B10
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _08023B5C @ =0x02033E40
	ldr r0, [r6]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl BeginTargetList
	ldr r0, [r6]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_0801A2D4
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0801A2D4
	mov r0, r8
	bl sub_080239B0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023B5C: .4byte 0x02033E40

	thumb_func_start sub_08023B60
sub_08023B60: @ 0x08023B60
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08023C12
	ldr r6, _08023C18 @ =0x0202E3E0
	ldr r5, _08023C1C @ =0x0202E3E8
_08023B74:
	cmp r0, #2
	bne _08023C0A
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08023BA8
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023BA8
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08023BA8:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08023BDA
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023BDA
	adds r1, #1
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08023BDA:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _08023C0A
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023C0A
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08023C0A:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08023B74
_08023C12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023C18: .4byte 0x0202E3E0
_08023C1C: .4byte 0x0202E3E8

	thumb_func_start sub_08023C20
sub_08023C20: @ 0x08023C20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08023C54 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08023C4E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08023C4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023C54: .4byte 0x02033E40

	thumb_func_start ListAttackTargetsForWeapon
ListAttackTargetsForWeapon: @ 0x08023C58
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08023CB4 @ =0x02033E40
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	ldr r0, _08023CB8 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	mov r0, r8
	bl sub_0801736C
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl sub_08017384
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0801B19C
	ldr r0, _08023CBC @ =sub_08023C20
	bl sub_080239B0
	bl sub_08023B60
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023CB4: .4byte 0x02033E40
_08023CB8: .4byte 0x0202E3E8
_08023CBC: .4byte sub_08023C20

	thumb_func_start sub_08023CC0
sub_08023CC0: @ 0x08023CC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08023D60 @ =0x02033E40
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl sub_080238C4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023D5A
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08023D1E
	ldr r0, [r5]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _08023CF8
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _08023D1E
_08023CF8:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08023D1E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08023D1E:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023D5A
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _08023D5A
	ldr r0, _08023D60 @ =0x02033E40
	ldr r0, [r0]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _08023D4C
	ldrh r0, [r1, #0x1e]
	cmp r0, #0
	beq _08023D5A
_08023D4C:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0
	bl EnlistTarget
_08023D5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023D60: .4byte 0x02033E40

	thumb_func_start sub_08023D64
sub_08023D64: @ 0x08023D64
	push {r4, r5, r6, r7, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r6, _08023DCC @ =0x02033E40
	str r0, [r6]
	ldr r0, _08023DD0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r7, _08023DD4 @ =sub_08023CC0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_08023A74
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023DC6
	bl CountTargets
	adds r4, r0, #0
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	bl sub_080BFC68
	bl CountTargets
	cmp r4, r0
	beq _08023DC6
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x11]
	strb r1, [r0, #1]
_08023DC6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023DCC: .4byte 0x02033E40
_08023DD0: .4byte 0x0202E3E8
_08023DD4: .4byte sub_08023CC0

	thumb_func_start sub_08023DD8
sub_08023DD8: @ 0x08023DD8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08023E34 @ =0x02033E40
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023E2C
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08023E2C
	ldr r0, [r4, #0xc]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08023E2C
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitCarry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023E2C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08023E2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023E34: .4byte 0x02033E40

	thumb_func_start sub_08023E38
sub_08023E38: @ 0x08023E38
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08023E60 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08023E64 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08023E68 @ =sub_08023DD8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023E60: .4byte 0x02033E40
_08023E64: .4byte 0x0202E3E8
_08023E68: .4byte sub_08023DD8

	thumb_func_start sub_08023E6C
sub_08023E6C: @ 0x08023E6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08023EB8 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r5, r6, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08023EB0
	ldr r0, _08023EBC @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	ldr r1, _08023EC0 @ =0x0202E3E0
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl sub_08018D68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023EB0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08023EB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023EB8: .4byte 0x0202E3DC
_08023EBC: .4byte 0x02033E40
_08023EC0: .4byte 0x0202E3E0

	thumb_func_start sub_08023EC4
sub_08023EC4: @ 0x08023EC4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08023EEC @ =0x02033E40
	str r0, [r1]
	ldr r0, _08023EF0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08023EF4 @ =sub_08023E6C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023AA8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023EEC: .4byte 0x02033E40
_08023EF0: .4byte 0x0202E3E8
_08023EF4: .4byte sub_08023E6C

	thumb_func_start sub_08023EF8
sub_08023EF8: @ 0x08023EF8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08023F60 @ =0x02033E40
	ldr r0, [r4]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl sub_080238C4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023F5A
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023F5A
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08023F5A
	ldr r4, [r4]
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitCarry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023F5A
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08023F5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023F60: .4byte 0x02033E40

	thumb_func_start sub_08023F64
sub_08023F64: @ 0x08023F64
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08023F8C @ =0x02033E40
	str r0, [r1]
	ldr r0, _08023F90 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08023F94 @ =sub_08023EF8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023F8C: .4byte 0x02033E40
_08023F90: .4byte 0x0202E3E8
_08023F94: .4byte sub_08023EF8

	thumb_func_start sub_08023F98
sub_08023F98: @ 0x08023F98
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08024014 @ =0x02033E40
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl sub_080238C4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802400C
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802400C
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _0802400C
	cmp r1, #2
	beq _0802400C
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802400C
	ldr r0, [r5]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitCarry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802400C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_0802400C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024014: .4byte 0x02033E40

	thumb_func_start sub_08024018
sub_08024018: @ 0x08024018
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024040 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024044 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08024048 @ =sub_08023F98
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024040: .4byte 0x02033E40
_08024044: .4byte 0x0202E3E8
_08024048: .4byte sub_08023F98

	thumb_func_start sub_0802404C
sub_0802404C: @ 0x0802404C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _0802408A
	cmp r1, #2
	beq _0802408A
	ldr r0, _08024090 @ =0x02033E40
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_080789FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802408A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	ldr r3, [r4]
	ldrb r3, [r3, #4]
	bl EnlistTarget
_0802408A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024090: .4byte 0x02033E40

	thumb_func_start sub_08024094
sub_08024094: @ 0x08024094
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080240BC @ =0x02033E40
	str r0, [r1]
	ldr r0, _080240C0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _080240C4 @ =sub_0802404C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080240BC: .4byte 0x02033E40
_080240C0: .4byte 0x0202E3E8
_080240C4: .4byte sub_0802404C

	thumb_func_start sub_080240C8
sub_080240C8: @ 0x080240C8
	push {r4, r5, r6, r7, lr}
	ldr r4, _0802416C @ =0x02033E40
	str r0, [r4]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl BeginTargetList
	ldr r0, [r4]
	bl sub_08026628
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _08024166
	adds r7, r4, #0
_080240EC:
	ldr r0, [r7]
	adds r1, r5, #0
	bl sub_0802664C
	adds r4, r0, #0
	cmp r4, #0
	beq _08024160
	ldr r3, [r7]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802410C
	subs r1, r0, r2
_0802410C:
	ldrb r3, [r3, #0x11]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _0802411E
	subs r0, r2, r3
_0802411E:
	adds r0, r1, r0
	cmp r0, #1
	bne _08024160
	ldr r0, [r7]
	adds r1, r5, #0
	bl sub_08026778
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024160
	ldr r0, [r4, #0xc]
	ldr r1, _08024170 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08024160
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _08024160
	cmp r1, #2
	beq _08024160
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	adds r3, r5, #0
	bl EnlistTarget
_08024160:
	adds r5, #1
	cmp r5, r6
	blt _080240EC
_08024166:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802416C: .4byte 0x02033E40
_08024170: .4byte 0x0001002C

	thumb_func_start sub_08024174
sub_08024174: @ 0x08024174
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080241A8 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080241A2
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #1
	bl EnlistTarget
_080241A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080241A8: .4byte 0x02033E40

	thumb_func_start sub_080241AC
sub_080241AC: @ 0x080241AC
	push {r4, r5, r6, r7, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _0802420C @ =0x02033E40
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08034710
	adds r7, r0, #0
	cmp r7, #0
	beq _08024206
	ldr r0, _08024210 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	adds r0, r7, #0
	bl sub_0801736C
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl sub_08017384
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0801B19C
	ldr r0, _08024214 @ =sub_08024174
	bl sub_080239B0
	bl sub_08023B60
_08024206:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802420C: .4byte 0x02033E40
_08024210: .4byte 0x0202E3E8
_08024214: .4byte sub_08024174

	thumb_func_start sub_08024218
sub_08024218: @ 0x08024218
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024254 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _0802424E
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl sub_08078F24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802424E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x1e
	movs r3, #0
	bl EnlistTarget
_0802424E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024254: .4byte 0x0202E3E0

	thumb_func_start sub_08024258
sub_08024258: @ 0x08024258
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024294 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _0802428E
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl sub_08078F24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802428E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
	movs r3, #0
	bl EnlistTarget
_0802428E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024294: .4byte 0x0202E3E0

	thumb_func_start sub_08024298
sub_08024298: @ 0x08024298
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _080242C8 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080242CC @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	cmp r4, #0x14
	beq _080242D4
	cmp r4, #0x1e
	bne _080242DE
	ldr r2, _080242D0 @ =sub_08024218
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08023AA8
	b _080242DE
	.align 2, 0
_080242C8: .4byte 0x02033E40
_080242CC: .4byte 0x0202E3E8
_080242D0: .4byte sub_08024218
_080242D4:
	ldr r2, _080242E4 @ =sub_08024258
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08023AA8
_080242DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080242E4: .4byte sub_08024258

	thumb_func_start sub_080242E8
sub_080242E8: @ 0x080242E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	mov r7, r8
	b _080243A0
_080242FC:
	adds r0, r7, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _080243A0
	ldr r0, [r5]
	cmp r0, #0
	beq _080243A0
	ldr r0, [r5, #0xc]
	ldr r1, _080243B4 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080243A0
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, _080243B8 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r6, #0
	bl sub_08019B20
	cmp r0, #0
	beq _08024372
	adds r0, r5, #0
	bl sub_08018A70
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _08024372
	adds r0, r6, #0
	bl sub_08019B20
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r3, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	bl EnlistTarget
_08024372:
	adds r0, r6, #0
	bl sub_08019B30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080243A0
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080243A0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #1
	rsbs r3, r3, #0
	bl EnlistTarget
_080243A0:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _080242FC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080243B4: .4byte 0x0001002C
_080243B8: .4byte 0x0202E3E0

	thumb_func_start sub_080243BC
sub_080243BC: @ 0x080243BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	mov r7, r8
	b _0802441A
_080243D0:
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802441A
	ldr r0, [r2]
	cmp r0, #0
	beq _0802441A
	ldr r0, [r2, #0xc]
	ldr r1, _08024430 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _0802441A
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _0802441A
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	movs r6, #0xb
	ldrsb r6, [r2, r6]
	movs r0, #3
	bl RandNext
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EnlistTarget
_0802441A:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _080243D0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024430: .4byte 0x0001002C

	thumb_func_start sub_08024434
sub_08024434: @ 0x08024434
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024474 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl sub_080238C4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802446C
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802446C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_0802446C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024474: .4byte 0x02033E40

	thumb_func_start sub_08024478
sub_08024478: @ 0x08024478
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080244A0 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080244A4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _080244A8 @ =sub_08024434
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080244A0: .4byte 0x02033E40
_080244A4: .4byte 0x0202E3E8
_080244A8: .4byte sub_08024434

	thumb_func_start sub_080244AC
sub_080244AC: @ 0x080244AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xc0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	cmp r0, #0x80
	bne _080244FC
	ldr r0, _080244F0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	blt _080244FC
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x1e
_080244D0:
	ldrh r0, [r4]
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080244F4
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
	b _080244FC
	.align 2, 0
_080244F0: .4byte 0x03004690
_080244F4:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _080244D0
_080244FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08024504
sub_08024504: @ 0x08024504
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _0802452C @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024530 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08024534 @ =sub_080244AC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802452C: .4byte 0x02033E40
_08024530: .4byte 0x0202E3E8
_08024534: .4byte sub_080244AC

	thumb_func_start sub_08024538
sub_08024538: @ 0x08024538
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08024588 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024582
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08024582
	adds r0, r5, #0
	bl sub_08018A70
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _08024582
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08024582:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024588: .4byte 0x02033E40

	thumb_func_start sub_0802458C
sub_0802458C: @ 0x0802458C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080245B4 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080245B8 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _080245BC @ =sub_08024538
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080245B4: .4byte 0x02033E40
_080245B8: .4byte 0x0202E3E8
_080245BC: .4byte sub_08024538

	thumb_func_start sub_080245C0
sub_080245C0: @ 0x080245C0
	push {r4, r5, r6, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r4, _08024600 @ =0x02033E40
	str r0, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	ldr r0, _08024604 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r4]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_0801A2D4
	ldr r0, _08024608 @ =sub_08024538
	bl sub_080239B0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024600: .4byte 0x02033E40
_08024604: .4byte 0x0202E3E8
_08024608: .4byte sub_08024538

	thumb_func_start sub_0802460C
sub_0802460C: @ 0x0802460C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024658 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024652
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08024652
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08024652
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024652:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024658: .4byte 0x02033E40

	thumb_func_start sub_0802465C
sub_0802465C: @ 0x0802465C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024684 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024688 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _0802468C @ =sub_0802460C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024684: .4byte 0x02033E40
_08024688: .4byte 0x0202E3E8
_0802468C: .4byte sub_0802460C

	thumb_func_start sub_08024690
sub_08024690: @ 0x08024690
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080246DC @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080246D4
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080246D4
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #6
	bhi _080246D4
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080246D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080246DC: .4byte 0x02033E40

	thumb_func_start sub_080246E0
sub_080246E0: @ 0x080246E0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024708 @ =0x02033E40
	str r0, [r1]
	ldr r0, _0802470C @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08024710 @ =sub_08024690
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024708: .4byte 0x02033E40
_0802470C: .4byte 0x0202E3E8
_08024710: .4byte sub_08024690

	thumb_func_start sub_08024714
sub_08024714: @ 0x08024714
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024748 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024742
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024742:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024748: .4byte 0x02033E40

	thumb_func_start sub_0802474C
sub_0802474C: @ 0x0802474C
	push {lr}
	ldr r1, _08024768 @ =0x02033E40
	str r0, [r1]
	ldr r0, _0802476C @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, _08024770 @ =sub_08024714
	bl sub_08023B10
	pop {r0}
	bx r0
	.align 2, 0
_08024768: .4byte 0x02033E40
_0802476C: .4byte 0x0202E3E8
_08024770: .4byte sub_08024714

	thumb_func_start sub_08024774
sub_08024774: @ 0x08024774
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080247BC @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080247B4
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080247A2
	cmp r1, #3
	bne _080247B4
_080247A2:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080247B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080247BC: .4byte 0x02033E40

	thumb_func_start sub_080247C0
sub_080247C0: @ 0x080247C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024808 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08024800
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080247EE
	cmp r1, #2
	bne _08024800
_080247EE:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024800:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024808: .4byte 0x02033E40

	thumb_func_start sub_0802480C
sub_0802480C: @ 0x0802480C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024854 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802484C
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0802483A
	cmp r1, #4
	bne _0802484C
_0802483A:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_0802484C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024854: .4byte 0x02033E40

	thumb_func_start sub_08024858
sub_08024858: @ 0x08024858
	push {lr}
	ldr r1, _08024874 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024878 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, _0802487C @ =sub_08024774
	bl sub_08023B10
	pop {r0}
	bx r0
	.align 2, 0
_08024874: .4byte 0x02033E40
_08024878: .4byte 0x0202E3E8
_0802487C: .4byte sub_08024774

	thumb_func_start sub_08024880
sub_08024880: @ 0x08024880
	push {lr}
	ldr r1, _0802489C @ =0x02033E40
	str r0, [r1]
	ldr r0, _080248A0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, _080248A4 @ =sub_080247C0
	bl sub_08023B10
	pop {r0}
	bx r0
	.align 2, 0
_0802489C: .4byte 0x02033E40
_080248A0: .4byte 0x0202E3E8
_080248A4: .4byte sub_080247C0

	thumb_func_start sub_080248A8
sub_080248A8: @ 0x080248A8
	push {lr}
	ldr r1, _080248C4 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080248C8 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, _080248CC @ =sub_0802480C
	bl sub_08023B10
	pop {r0}
	bx r0
	.align 2, 0
_080248C4: .4byte 0x02033E40
_080248C8: .4byte 0x0202E3E8
_080248CC: .4byte sub_0802480C

	thumb_func_start sub_080248D0
sub_080248D0: @ 0x080248D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024904 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080248FE
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080248FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024904: .4byte 0x02033E40

	thumb_func_start sub_08024908
sub_08024908: @ 0x08024908
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024930 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024934 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08024938 @ =sub_080248D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024930: .4byte 0x02033E40
_08024934: .4byte 0x0202E3E8
_08024938: .4byte sub_080248D0

	thumb_func_start sub_0802493C
sub_0802493C: @ 0x0802493C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024964 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024968 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _0802496C @ =sub_08024218
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023ADC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024964: .4byte 0x02033E40
_08024968: .4byte 0x0202E3E8
_0802496C: .4byte sub_08024218

	thumb_func_start sub_08024970
sub_08024970: @ 0x08024970
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08024990 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl sub_080238C4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080249C0
	movs r5, #0
	b _08024996
	.align 2, 0
_08024990: .4byte 0x02033E40
_08024994:
	adds r5, #1
_08024996:
	cmp r5, #4
	bgt _080249C0
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl IsItemRepairable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024994
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080249C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080249C8
sub_080249C8: @ 0x080249C8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080249F0 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080249F4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _080249F8 @ =sub_08024970
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080249F0: .4byte 0x02033E40
_080249F4: .4byte 0x0202E3E8
_080249F8: .4byte sub_08024970

	thumb_func_start sub_080249FC
sub_080249FC: @ 0x080249FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl BeginTargetList
	bl sub_080238D8
	adds r7, r0, #0
	adds r6, r7, #1
	b _08024A74
_08024A1E:
	adds r0, r6, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _08024A70
	ldr r0, [r5]
	cmp r0, #0
	beq _08024A70
	ldr r0, [r5, #0xc]
	ldr r1, _08024A84 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08024A70
	adds r0, r5, #0
	bl sub_08018A70
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	bne _08024A5A
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08024A70
_08024A5A:
	cmp r5, r8
	beq _08024A70
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08024A70:
	adds r6, #1
	adds r0, r7, #0
_08024A74:
	adds r0, #0x80
	cmp r6, r0
	blt _08024A1E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024A84: .4byte 0x0001000C

	thumb_func_start sub_08024A88
sub_08024A88: @ 0x08024A88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	bl CountTargets
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _08024AD4
_08024A9C:
	adds r0, r6, #0
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	bl sub_08018A70
	movs r1, #3
	ldrsb r1, [r4, r1]
	cmp r0, r1
	bgt _08024ACE
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	movs r1, #0
	mov r2, r8
	bl sub_0809FEE8
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_0809FDFC
_08024ACE:
	adds r6, #1
	cmp r6, r7
	blt _08024A9C
_08024AD4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08024AE0
sub_08024AE0: @ 0x08024AE0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024B50 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024B48
	ldr r0, _08024B54 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08024B10
	ldr r0, _08024B58 @ =0x0202E3EC
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024B48
_08024B10:
	ldr r0, _08024B5C @ =0x02033E40
	ldr r0, [r0]
	ldr r1, _08024B60 @ =0x0202E3E0
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl sub_08018D68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024B48
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802BA70
	cmp r0, #0
	beq _08024B3C
	ldrb r0, [r0, #2]
	cmp r0, #0xa
	bne _08024B48
_08024B3C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08024B48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024B50: .4byte 0x0202E3DC
_08024B54: .4byte 0x0202BBF8
_08024B58: .4byte 0x0202E3EC
_08024B5C: .4byte 0x02033E40
_08024B60: .4byte 0x0202E3E0

	thumb_func_start sub_08024B64
sub_08024B64: @ 0x08024B64
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024B8C @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024B90 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08024B94 @ =sub_08024AE0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023AA8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024B8C: .4byte 0x02033E40
_08024B90: .4byte 0x0202E3E8
_08024B94: .4byte sub_08024AE0

	thumb_func_start sub_08024B98
sub_08024B98: @ 0x08024B98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024BE4 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r6, r5, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024BDE
	adds r0, r4, #0
	bl sub_0802BA70
	cmp r0, #0
	bne _08024BDE
	ldr r1, _08024BE8 @ =0x08BE3C16
	ldr r0, _08024BEC @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	adds r1, r0, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08024BDE
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08024BDE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024BE4: .4byte 0x0202E3DC
_08024BE8: .4byte 0x08BE3C16
_08024BEC: .4byte 0x0202E3E0

	thumb_func_start sub_08024BF0
sub_08024BF0: @ 0x08024BF0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024C18 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024C1C @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08024C20 @ =sub_08024B98
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023AA8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024C18: .4byte 0x02033E40
_08024C1C: .4byte 0x0202E3E8
_08024C20: .4byte sub_08024B98

	thumb_func_start sub_08024C24
sub_08024C24: @ 0x08024C24
	push {lr}
	adds r3, r0, #0
	movs r2, #0xb
	ldrsb r2, [r3, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _08024C50
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08024C50
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	movs r3, #0
	bl EnlistTarget
_08024C50:
	pop {r0}
	bx r0

	thumb_func_start sub_08024C54
sub_08024C54: @ 0x08024C54
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024C7C @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024C80 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, _08024C84 @ =sub_08024C24
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08023A74
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024C7C: .4byte 0x02033E40
_08024C80: .4byte 0x0202E3E8
_08024C84: .4byte sub_08024C24

	thumb_func_start sub_08024C88
sub_08024C88: @ 0x08024C88
	ldr r1, _08024C94 @ =0x0203A3D0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08024C94: .4byte 0x0203A3D0

	thumb_func_start ApplyUnitSpritePalettes
ApplyUnitSpritePalettes: @ 0x08024C98
	push {lr}
	ldr r0, _08024CC0 @ =0x08194594
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r1, _08024CC4 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08024CCC
	ldr r0, _08024CC8 @ =0x08194614
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08024CD8
	.align 2, 0
_08024CC0: .4byte 0x08194594
_08024CC4: .4byte 0x0202BBB8
_08024CC8: .4byte 0x08194614
_08024CCC:
	ldr r0, _08024CDC @ =0x08194634
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
_08024CD8:
	pop {r0}
	bx r0
	.align 2, 0
_08024CDC: .4byte 0x08194634

	thumb_func_start sub_08024CE0
sub_08024CE0: @ 0x08024CE0
	push {lr}
	ldr r0, _08024CF4 @ =0x08194654
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08024CF4: .4byte 0x08194654

	thumb_func_start ResetUnitSprites
ResetUnitSprites: @ 0x08024CF8
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _08024D20 @ =0x02039F18
	ldr r6, _08024D24 @ =0x02039F14
	ldr r4, _08024D28 @ =0x02033E44
	movs r3, #0xff
_08024D04:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _08024D04
	movs r0, #0
	str r0, [r5]
	movs r0, #0x3f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024D20: .4byte 0x02039F18
_08024D24: .4byte 0x02039F14
_08024D28: .4byte 0x02033E44

	thumb_func_start sub_08024D2C
sub_08024D2C: @ 0x08024D2C
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _08024D54 @ =0x02039F18
	ldr r6, _08024D58 @ =0x02039F14
	ldr r4, _08024D5C @ =0x02033E44
	movs r3, #0xff
_08024D38:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _08024D38
	movs r0, #0
	str r0, [r5]
	movs r0, #0x5f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024D54: .4byte 0x02039F18
_08024D58: .4byte 0x02039F14
_08024D5C: .4byte 0x02033E44

	thumb_func_start sub_08024D60
sub_08024D60: @ 0x08024D60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r1, _08024D9C @ =0x08B93E48
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r5, _08024DA0 @ =0x08C99700
	movs r4, #0x7f
	ands r4, r7
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08024DA4 @ =0x08B93E44
	ldr r1, [r1]
	bl Decompress
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08024DB8
	cmp r0, #1
	bgt _08024DA8
	cmp r0, #0
	beq _08024DAE
	b _08024DD6
	.align 2, 0
_08024D9C: .4byte 0x08B93E48
_08024DA0: .4byte 0x08C99700
_08024DA4: .4byte 0x08B93E44
_08024DA8:
	cmp r0, #2
	beq _08024DC2
	b _08024DD6
_08024DAE:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08024F4C
	b _08024DCA
_08024DB8:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08025028
	b _08024DCA
_08024DC2:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08025118
_08024DCA:
	ldr r2, _08024DE8 @ =0x02033E44
	add r2, r8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2]
_08024DD6:
	ldr r0, _08024DE8 @ =0x02033E44
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024DE8: .4byte 0x02033E44

	thumb_func_start sub_08024DEC
sub_08024DEC: @ 0x08024DEC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08024E24 @ =0x02033E44
	adds r7, r6, r0
	ldrb r1, [r7]
	cmp r1, #0xff
	bne _08024EA0
	ldr r5, _08024E28 @ =0x08C99700
	movs r4, #0x7f
	ands r4, r6
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08024E2C @ =0x08B93E44
	ldr r1, [r1]
	bl Decompress
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08024E54
	cmp r0, #1
	bgt _08024E30
	cmp r0, #0
	beq _08024E36
	b _08024E96
	.align 2, 0
_08024E24: .4byte 0x02033E44
_08024E28: .4byte 0x08C99700
_08024E2C: .4byte 0x08B93E44
_08024E30:
	cmp r0, #2
	beq _08024E70
	b _08024E96
_08024E36:
	ldr r4, _08024E50 @ =0x02039F14
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_08024EB8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	subs r0, #1
	b _08024E94
	.align 2, 0
_08024E50: .4byte 0x02039F14
_08024E54:
	ldr r4, _08024E6C @ =0x02039F18
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_08025028
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #2
	b _08024E94
	.align 2, 0
_08024E6C: .4byte 0x02039F18
_08024E70:
	ldr r4, _08024EAC @ =0x02039F18
	ldr r1, [r4]
	movs r0, #0x1e
	ands r0, r1
	cmp r0, #0x1e
	bne _08024E80
	adds r0, r1, #2
	str r0, [r4]
_08024E80:
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_08025118
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #4
_08024E94:
	str r0, [r4]
_08024E96:
	ldr r1, _08024EB0 @ =0x0203A3D0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08024EB4 @ =0x02033E44
_08024EA0:
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024EAC: .4byte 0x02039F18
_08024EB0: .4byte 0x0203A3D0
_08024EB4: .4byte 0x02033E44

	thumb_func_start sub_08024EB8
sub_08024EB8: @ 0x08024EB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _08024F40 @ =0x08B93E58
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	mov sb, r0
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r6, #0
	ldr r0, _08024F44 @ =0x08B93E44
	mov sl, r0
	movs r0, #0x80
	lsls r0, r0, #3
	add r0, sb
	ldr r2, _08024F48 @ =0x02033F14
	adds r4, r0, r2
	movs r3, #0x40
	mov r8, r3
	movs r7, #0
	lsls r5, r1, #7
_08024EF2:
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	lsls r1, r6, #0xd
	ldr r2, _08024F48 @ =0x02033F14
	add r2, sb
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuFastSet
	mov r2, sl
	ldr r0, [r2]
	add r0, r8
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r4, r4, r3
	add r8, r5
	adds r7, r7, r5
	adds r6, #1
	cmp r6, #2
	ble _08024EF2
	ldr r0, _08024F40 @ =0x08B93E58
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024F40: .4byte 0x08B93E58
_08024F44: .4byte 0x08B93E44
_08024F48: .4byte 0x02033F14

	thumb_func_start sub_08024F4C
sub_08024F4C: @ 0x08024F4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	mov sb, r1
	ldr r1, _08025018 @ =0x08B93E58
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r5, r0, #5
	mov r1, sb
	lsrs r0, r1, #7
	movs r2, #1
	mov sb, r2
	mov r1, sb
	bics r1, r0
	mov sb, r1
	movs r7, #0
	mov r2, sp
	adds r2, #4
	str r2, [sp, #0xc]
	ldr r0, _0802501C @ =0x02033F14
	mov r8, r0
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r5, r1
	mov r2, r8
	adds r6, r0, r2
	movs r0, #0x40
	str r0, [sp, #0x10]
	movs r1, #0
	mov sl, r1
_08024F92:
	movs r2, #0
	str r2, [sp]
	lsls r4, r7, #0xd
	mov r0, r8
	adds r1, r5, r0
	adds r1, r4, r1
	mov r0, sp
	ldr r2, _08025020 @ =0x01000010
	bl CpuFastSet
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, r8
	adds r1, r4, r1
	adds r1, r1, r5
	ldr r0, [sp, #0xc]
	ldr r2, _08025020 @ =0x01000010
	bl CpuFastSet
	ldr r2, _08025024 @ =0x08B93E44
	ldr r0, [r2]
	add r0, sl
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	adds r4, r4, r1
	adds r4, r4, r5
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	ldr r1, _08025024 @ =0x08B93E44
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r6, r0
	mov r1, sb
	lsls r0, r1, #7
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	add sl, r0
	adds r7, #1
	cmp r7, #2
	ble _08024F92
	ldr r0, _08025018 @ =0x08B93E58
	ldr r2, [sp, #8]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08025018: .4byte 0x08B93E58
_0802501C: .4byte 0x02033F14
_08025020: .4byte 0x01000010
_08025024: .4byte 0x08B93E44

	thumb_func_start sub_08025028
sub_08025028: @ 0x08025028
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _0802510C @ =0x08B93E58
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r6, r0, #5
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r0, #0
	mov sb, r0
	ldr r2, _08025110 @ =0x08B93E44
	mov r8, r2
	ldr r3, _08025114 @ =0x02033F14
	mov sl, r3
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r7, r0, r3
	movs r3, #0xc0
	str r3, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r2, #0x40
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	lsls r5, r1, #8
_0802506E:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	mov r3, sb
	lsls r4, r3, #0xd
	mov r2, sl
	adds r1, r6, r2
	adds r1, r4, r1
	movs r2, #0x10
	bl CpuFastSet
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, sl
	adds r1, r4, r1
	adds r1, r1, r6
	movs r2, #0x10
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldr r3, [sp, #8]
	adds r0, r0, r3
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, sl
	adds r4, r4, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r1, r7, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r7, r7, r3
	ldr r0, [sp, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r1, r1, r5
	str r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r2, r2, r5
	str r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r3, r3, r5
	str r3, [sp, #0x10]
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #2
	ble _0802506E
	ldr r0, _0802510C @ =0x08B93E58
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802510C: .4byte 0x08B93E58
_08025110: .4byte 0x08B93E44
_08025114: .4byte 0x02033F14

	thumb_func_start sub_08025118
sub_08025118: @ 0x08025118
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _08025200 @ =0x08B93E58
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r6, r0, #5
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r0, #0
	mov sb, r0
	ldr r2, _08025204 @ =0x08B93E44
	mov r8, r2
	ldr r3, _08025208 @ =0x02033F14
	mov sl, r3
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r7, r0, r3
	movs r3, #0xc0
	lsls r3, r3, #1
	str r3, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #8]
	movs r2, #0x80
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	lsls r5, r1, #9
_08025162:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	mov r3, sb
	lsls r4, r3, #0xd
	mov r2, sl
	adds r1, r6, r2
	adds r1, r4, r1
	movs r2, #0x20
	bl CpuFastSet
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, sl
	adds r1, r4, r1
	adds r1, r1, r6
	movs r2, #0x20
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldr r3, [sp, #8]
	adds r0, r0, r3
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, sl
	adds r4, r4, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r1, r7, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r7, r7, r3
	ldr r0, [sp, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r1, r1, r5
	str r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r2, r2, r5
	str r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r3, r3, r5
	str r3, [sp, #0x10]
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #2
	ble _08025162
	ldr r0, _08025200 @ =0x08B93E58
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08025200: .4byte 0x08B93E58
_08025204: .4byte 0x08B93E44
_08025208: .4byte 0x02033F14

	thumb_func_start sub_0802520C
sub_0802520C: @ 0x0802520C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	bl sub_08017610
	str r0, [sp, #4]
	bl sub_08024DEC
	lsls r6, r0, #5
	ldr r1, _08025274 @ =0x08B93F18
	ldr r2, [sp]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r1, #0x43
	ble _08025244
	movs r4, #1
_08025244:
	cmp r1, #0x23
	ble _0802524A
	movs r4, #2
_0802524A:
	cmp r1, #0x1f
	ble _08025250
	movs r4, #1
_08025250:
	cmp r1, #0
	blt _08025256
	movs r4, #0
_08025256:
	ldr r1, _08025278 @ =0x08C99700
	movs r0, #0x7f
	ldr r3, [sp, #4]
	ands r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08025304
	cmp r0, #1
	bgt _0802527C
	cmp r0, #0
	beq _08025284
	b _080254DE
	.align 2, 0
_08025274: .4byte 0x08B93F18
_08025278: .4byte 0x08C99700
_0802527C:
	cmp r0, #2
	bne _08025282
	b _080253FC
_08025282:
	b _080254DE
_08025284:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r7, _080252F8 @ =0x02033F14
	mov sb, r7
	lsrs r7, r5, #1
	movs r0, #1
	bics r0, r5
	lsls r0, r0, #2
	movs r4, #0xf
	lsls r4, r0
_0802529A:
	movs r5, #0
	lsls r3, r1, #0xd
	adds r1, #1
	mov r8, r1
	adds r0, r6, r7
	adds r0, r0, r3
	mov r1, sb
	adds r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r7, r1
	adds r0, r6, r0
	adds r0, r0, r3
	mov r3, sb
	adds r1, r0, r3
_080252B8:
	adds r0, r4, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r0, r4, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r2, #0x20
	adds r1, #0x20
	adds r5, #1
	cmp r5, #1
	ble _080252B8
	mov r1, r8
	cmp r1, #2
	ble _0802529A
	ldr r7, _080252F8 @ =0x02033F14
	adds r0, r6, r7
	add r0, sl
	ldr r2, _080252FC @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r7, r3
	add r0, sl
	adds r0, r0, r6
	ldr r7, _08025300 @ =0x06011400
	adds r1, r6, r7
	b _080253E0
	.align 2, 0
_080252F8: .4byte 0x02033F14
_080252FC: .4byte 0x06011000
_08025300: .4byte 0x06011400
_08025304:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r2, _080253E8 @ =0x02033F14
	mov sb, r2
	lsrs r3, r5, #1
	str r3, [sp, #8]
	bics r0, r5
	lsls r0, r0, #2
	movs r7, #0xf
	mov ip, r7
	mov r2, ip
	lsls r2, r0
	mov ip, r2
_08025320:
	movs r5, #0
	lsls r3, r1, #0xd
	adds r1, #1
	mov r8, r1
	adds r4, r3, #0
	ldr r3, [sp, #8]
	adds r0, r6, r3
	adds r0, r0, r4
	mov r7, sb
	adds r3, r0, r7
_08025334:
	lsls r2, r5, #5
	mov r0, ip
	ldrb r1, [r3]
	ands r0, r1
	strb r0, [r3]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r2, r7
	adds r0, r6, r0
	ldr r1, [sp, #8]
	adds r0, r0, r1
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r6, r2
	ldr r1, [sp, #8]
	adds r2, r2, r1
	adds r2, r2, r4
	add r2, sb
	mov r0, ip
	ldrb r7, [r2]
	ands r0, r7
	strb r0, [r2]
	adds r3, #0x20
	adds r5, #1
	cmp r5, #1
	ble _08025334
	mov r1, r8
	cmp r1, #2
	ble _08025320
	ldr r1, _080253E8 @ =0x02033F14
	adds r0, r6, r1
	add r0, sl
	ldr r2, _080253EC @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _080253E8 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _080253F0 @ =0x06011400
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _080253E8 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _080253F4 @ =0x06011800
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _080253E8 @ =0x02033F14
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _080253F8 @ =0x06011C00
	adds r1, r6, r2
_080253E0:
	movs r2, #0x10
	bl CpuFastSet
	b _080254DE
	.align 2, 0
_080253E8: .4byte 0x02033F14
_080253EC: .4byte 0x06011000
_080253F0: .4byte 0x06011400
_080253F4: .4byte 0x06011800
_080253F8: .4byte 0x06011C00
_080253FC:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r3, _08025500 @ =0x02033F14
	mov sb, r3
	lsrs r7, r5, #1
	str r7, [sp, #8]
	movs r0, #1
	bics r0, r5
	lsls r0, r0, #2
	movs r2, #0xf
	mov ip, r2
	mov r3, ip
	lsls r3, r0
	mov ip, r3
_0802541A:
	movs r5, #0
	adds r7, r1, #1
	mov r8, r7
	lsls r4, r1, #0xd
	ldr r1, [sp, #8]
	adds r0, r6, r1
	adds r0, r0, r4
	mov r2, sb
	adds r3, r0, r2
_0802542C:
	lsls r2, r5, #5
	mov r0, ip
	ldrb r7, [r3]
	ands r0, r7
	strb r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r6, r2
	ldr r1, [sp, #8]
	adds r2, r2, r1
	adds r2, r2, r4
	add r2, sb
	mov r0, ip
	ldrb r7, [r2]
	ands r0, r7
	strb r0, [r2]
	adds r3, #0x20
	adds r5, #1
	cmp r5, #3
	ble _0802542C
	mov r1, r8
	cmp r1, #2
	ble _0802541A
	ldr r1, _08025500 @ =0x02033F14
	adds r0, r6, r1
	add r0, sl
	ldr r2, _08025504 @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _08025500 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025508 @ =0x06011400
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _08025500 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _0802550C @ =0x06011800
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _08025500 @ =0x02033F14
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025510 @ =0x06011C00
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
_080254DE:
	ldr r3, [sp]
	cmp r3, #0x3f
	bne _080254EE
	ldr r0, _08025514 @ =0x02033E44
	ldr r7, [sp, #4]
	adds r0, r7, r0
	movs r1, #0xff
	strb r1, [r0]
_080254EE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025500: .4byte 0x02033F14
_08025504: .4byte 0x06011000
_08025508: .4byte 0x06011400
_0802550C: .4byte 0x06011800
_08025510: .4byte 0x06011C00
_08025514: .4byte 0x02033E44

	thumb_func_start sub_08025518
sub_08025518: @ 0x08025518
	push {r4, r5, lr}
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r4, r0, #0
	adds r5, r4, #0
	cmp r4, #0
	bne _08025538
	ldr r0, _08025570 @ =0x02033F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025538:
	cmp r4, #0x20
	bne _08025548
	ldr r0, _08025578 @ =0x02035F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025548:
	cmp r4, #0x24
	bne _08025558
	ldr r0, _0802557C @ =0x02037F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025558:
	cmp r5, #0x44
	bne _08025568
	ldr r0, _08025578 @ =0x02035F14
	ldr r1, _08025574 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08025568:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025570: .4byte 0x02033F14
_08025574: .4byte 0x06011000
_08025578: .4byte 0x02035F14
_0802557C: .4byte 0x02037F14

	thumb_func_start ForceSyncUnitSpriteSheet
ForceSyncUnitSpriteSheet: @ 0x08025580
	push {lr}
	ldr r0, _080255A0 @ =0x0203A3D0
	movs r1, #0
	str r1, [r0]
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r0, #0x43
	bgt _080255AC
	cmp r0, #0x23
	ble _080255A8
	ldr r0, _080255A4 @ =0x02037F14
	b _080255AE
	.align 2, 0
_080255A0: .4byte 0x0203A3D0
_080255A4: .4byte 0x02037F14
_080255A8:
	cmp r0, #0x1f
	ble _080255C4
_080255AC:
	ldr r0, _080255BC @ =0x02035F14
_080255AE:
	ldr r1, _080255C0 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_08003078
	b _080255D4
	.align 2, 0
_080255BC: .4byte 0x02035F14
_080255C0: .4byte 0x06011000
_080255C4:
	cmp r1, #0
	blt _080255D4
	ldr r0, _080255D8 @ =0x02033F14
	ldr r1, _080255DC @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_08003078
_080255D4:
	pop {r0}
	bx r0
	.align 2, 0
_080255D8: .4byte 0x02033F14
_080255DC: .4byte 0x06011000

	thumb_func_start sub_080255E0
sub_080255E0: @ 0x080255E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0
	bne _080255FA
	ldr r2, _08025644 @ =0x02033F14
_080255FA:
	cmp r0, #0x20
	bne _08025600
	ldr r2, _08025648 @ =0x02035F14
_08025600:
	cmp r0, #0x24
	bne _08025606
	ldr r2, _0802564C @ =0x02037F14
_08025606:
	cmp r1, #0x44
	bne _0802560C
	ldr r2, _08025648 @ =0x02035F14
_0802560C:
	cmp r2, #0
	beq _0802563C
	ldr r1, _08025650 @ =0x08B93E48
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_08025624:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _08025624
_0802563C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025644: .4byte 0x02033F14
_08025648: .4byte 0x02035F14
_0802564C: .4byte 0x02037F14
_08025650: .4byte 0x08B93E48

	thumb_func_start sub_08025654
sub_08025654: @ 0x08025654
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0x43
	bgt _0802567C
	cmp r0, #0x23
	ble _08025678
	ldr r2, _08025674 @ =0x02037F14
	b _0802568A
	.align 2, 0
_08025674: .4byte 0x02037F14
_08025678:
	cmp r0, #0x1f
	ble _08025684
_0802567C:
	ldr r2, _08025680 @ =0x02035F14
	b _0802568A
	.align 2, 0
_08025680: .4byte 0x02035F14
_08025684:
	cmp r1, #0
	blt _0802568A
	ldr r2, _080256C0 @ =0x02033F14
_0802568A:
	cmp r2, #0
	beq _080256BA
	ldr r1, _080256C4 @ =0x08B93E48
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_080256A2:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl sub_08003078
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _080256A2
_080256BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080256C0: .4byte 0x02033F14
_080256C4: .4byte 0x08B93E48

	thumb_func_start sub_080256C8
sub_080256C8: @ 0x080256C8
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r1
	cmp r0, #0
	beq _080256DC
	movs r0, #0xb
	b _080256EE
_080256DC:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080256EC
	adds r0, r2, #0
	bl GetUnitSpritePalette
	b _080256EE
_080256EC:
	movs r0, #0xf
_080256EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitSpritePalette
GetUnitSpritePalette: @ 0x080256F4
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0x40
	beq _0802571A
	cmp r1, #0x40
	bgt _08025708
	cmp r1, #0
	beq _08025712
	b _08025720
_08025708:
	cmp r1, #0x80
	beq _08025716
	cmp r1, #0xc0
	beq _0802571E
	b _08025720
_08025712:
	movs r0, #0xc
	b _08025720
_08025716:
	movs r0, #0xd
	b _08025720
_0802571A:
	movs r0, #0xe
	b _08025720
_0802571E:
	movs r0, #0xb
_08025720:
	bx lr
	.align 2, 0

	thumb_func_start RefreshUnitSprites
RefreshUnitSprites: @ 0x08025724
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r0, _0802582C @ =0x0203A3CC
	ldr r1, _08025830 @ =0x02039F1C
	mov r2, r8
	str r2, [r1]
	movs r2, #0x80
	lsls r2, r2, #3
	strh r2, [r1, #6]
	adds r1, #0xc
	str r1, [r0]
	movs r7, #1
_08025744:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _080257EE
	ldr r0, [r6]
	cmp r0, #0
	beq _080257EE
	movs r0, #0
	str r0, [r6, #0x3c]
	ldr r0, [r6, #0xc]
	ldr r1, _08025834 @ =0x00000201
	ands r0, r1
	cmp r0, #0
	bne _080257EE
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	ldr r0, _08025838 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080257EE
	lsls r0, r2, #4
	bl sub_080258D8
	adds r5, r0, #0
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	adds r0, r6, #0
	bl sub_08017610
	bl sub_08024DEC
	adds r4, r0, #0
	adds r0, r6, #0
	bl sub_080256C8
	adds r4, #0x80
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r4, r4, r1
	strh r4, [r5, #8]
	adds r0, r6, #0
	bl sub_08017610
	ldr r2, _0802583C @ =0x08C99700
	movs r1, #0x7f
	ands r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #2]
	adds r2, r0, #0
	strb r0, [r5, #0xb]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080257DA
	adds r0, r2, #3
	strb r0, [r5, #0xb]
_080257DA:
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _080257EC
	ldrb r0, [r5, #0xb]
	adds r0, #0x40
	strb r0, [r5, #0xb]
_080257EC:
	str r5, [r6, #0x3c]
_080257EE:
	adds r7, #1
	cmp r7, #0xc5
	ble _08025744
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _080258B8
	ldr r1, _08025840 @ =0xFFFFC080
	adds r6, r1, #0
	ldr r7, _08025844 @ =0x08C99992
	movs r2, #0x28
	adds r2, r2, r7
	mov sb, r2
_0802580E:
	cmp r0, #1
	bne _08025882
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08025882
	ldrb r0, [r4, #3]
	cmp r0, #0x35
	beq _08025852
	cmp r0, #0x35
	bgt _08025848
	cmp r0, #0x34
	beq _0802584E
	b _08025864
	.align 2, 0
_0802582C: .4byte 0x0203A3CC
_08025830: .4byte 0x02039F1C
_08025834: .4byte 0x00000201
_08025838: .4byte 0x0202E3DC
_0802583C: .4byte 0x08C99700
_08025840: .4byte 0xFFFFC080
_08025844: .4byte 0x08C99992
_08025848:
	cmp r0, #0x36
	beq _08025856
	b _08025864
_0802584E:
	movs r0, #0x52
	b _08025858
_08025852:
	movs r0, #0x53
	b _08025858
_08025856:
	movs r0, #0x54
_08025858:
	bl sub_08024DEC
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08025864:
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	bl sub_080258D8
	adds r5, r0, #0
	ldrb r2, [r4, #1]
	lsls r0, r2, #4
	strh r0, [r5, #6]
	ldrb r1, [r4]
	lsls r0, r1, #4
	strh r0, [r5, #4]
	mov r2, r8
	strh r2, [r5, #8]
	ldrh r0, [r7]
	strb r0, [r5, #0xb]
_08025882:
	ldrb r0, [r4, #2]
	cmp r0, #0xc
	bne _080258B0
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	bl sub_080258D8
	adds r5, r0, #0
	ldrb r2, [r4, #1]
	lsls r0, r2, #4
	strh r0, [r5, #6]
	ldrb r1, [r4]
	lsls r0, r1, #4
	strh r0, [r5, #4]
	movs r0, #0x57
	bl sub_08024DEC
	ldr r2, _080258D0 @ =0xFFFFB080
	adds r0, r0, r2
	strh r0, [r5, #8]
	mov r1, sb
	ldrh r0, [r1]
	strb r0, [r5, #0xb]
_080258B0:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802580E
_080258B8:
	ldr r0, _080258D4 @ =0x0203A3D0
	ldr r0, [r0]
	cmp r0, #0
	beq _080258C4
	bl ForceSyncUnitSpriteSheet
_080258C4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080258D0: .4byte 0xFFFFB080
_080258D4: .4byte 0x0203A3D0

	thumb_func_start sub_080258D8
sub_080258D8: @ 0x080258D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _080258F4 @ =0x02039F1C
	ldr r3, _080258F8 @ =0x0203A3CC
_080258E0:
	ldr r1, [r2]
	cmp r1, #0
	beq _080258FC
	movs r5, #6
	ldrsh r0, [r1, r5]
	cmp r0, r4
	blt _080258FC
	adds r2, r1, #0
	b _080258E0
	.align 2, 0
_080258F4: .4byte 0x02039F1C
_080258F8: .4byte 0x0203A3CC
_080258FC:
	ldr r0, [r3]
	str r1, [r0]
	str r0, [r2]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r3]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08025910
sub_08025910: @ 0x08025910
	push {r4, r5, r6, lr}
	ldr r0, _08025984 @ =0x02039F1C
	ldr r6, [r0]
	bl sub_08025B54
	cmp r6, #0
	bne _08025920
	b _08025A92
_08025920:
	movs r3, #0
	movs r0, #4
	ldrsh r1, [r6, r0]
	ldr r2, _08025988 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r5, #6
	ldrsh r1, [r6, r5]
	movs r5, #0xe
	ldrsh r0, [r2, r5]
	subs r5, r1, r0
	adds r1, r4, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _08025946
	b _08025A8A
_08025946:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bls _08025950
	b _08025A8A
_08025950:
	movs r0, #0x80
	ldrb r1, [r6, #0xb]
	ands r0, r1
	cmp r0, #0
	beq _0802595C
	b _08025A8A
_0802595C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802596E
	bl GetGameTime
	adds r3, r0, #0
	movs r0, #2
	ands r3, r0
_0802596E:
	movs r0, #0xf
	ldrb r2, [r6, #0xb]
	ands r0, r2
	cmp r0, #5
	bls _0802597A
	b _08025A8A
_0802597A:
	lsls r0, r0, #2
	ldr r1, _0802598C @ =_08025990
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025984: .4byte 0x02039F1C
_08025988: .4byte 0x0202BBB8
_0802598C: .4byte _08025990
_08025990: @ jump table
	.4byte _080259A8 @ case 0
	.4byte _080259D0 @ case 1
	.4byte _080259F4 @ case 2
	.4byte _08025A1C @ case 3
	.4byte _08025A3C @ case 4
	.4byte _08025A64 @ case 5
_080259A8:
	adds r0, r4, r3
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r1, _080259C8 @ =0x000001FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080259CC @ =0x08B905B8
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025A58
	.align 2, 0
_080259C8: .4byte 0x000001FF
_080259CC: .4byte 0x08B905B8
_080259D0:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080259F0 @ =0x08B905D8
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025A58
	.align 2, 0
_080259F0: .4byte 0x08B905D8
_080259F4:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A18 @ =0x08B905C0
	ldrh r4, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #4
	b _08025A58
	.align 2, 0
_08025A18: .4byte 0x08B905C0
_08025A1C:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A38 @ =0x08B905B8
	b _08025A52
	.align 2, 0
_08025A38: .4byte 0x08B905B8
_08025A3C:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A60 @ =0x08B905D8
_08025A52:
	ldrh r4, [r6, #8]
	movs r5, #0xc0
	lsls r5, r5, #4
_08025A58:
	adds r3, r4, r5
	bl PutOamHiRam
	b _08025A8A
	.align 2, 0
_08025A60: .4byte 0x08B905D8
_08025A64:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025A98 @ =0x08B905C0
	ldrh r4, [r6, #8]
	movs r5, #0xc0
	lsls r5, r5, #4
	adds r3, r4, r5
	bl PutOamHiRam
_08025A8A:
	ldr r6, [r6]
	cmp r6, #0
	beq _08025A92
	b _08025920
_08025A92:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025A98: .4byte 0x08B905C0

	thumb_func_start sub_08025A9C
sub_08025A9C: @ 0x08025A9C
	push {r4, r5, lr}
	ldr r4, _08025B38 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x93
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x94
	ldrb r4, [r0]
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08025AC8
	movs r2, #1
_08025AC8:
	cmp r5, #0xff
	beq _08025B32
	cmp r2, #0
	beq _08025B32
	ldr r0, _08025B3C @ =0x0202E3EC
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025B32
	ldr r0, _08025B40 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _08025B32
	lsls r1, r5, #4
	ldr r2, _08025B44 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	lsls r1, r4, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r2, r1, r0
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025B32
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025B32
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r3, r1
	subs r1, #5
	ands r0, r1
	ldr r3, _08025B48 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025B4C @ =0x08B905B0
	ldr r3, _08025B50 @ =0x00000C51
	bl PutOamHiRam
_08025B32:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025B38: .4byte 0x0202BBF8
_08025B3C: .4byte 0x0202E3EC
_08025B40: .4byte 0x0202E3E0
_08025B44: .4byte 0x0202BBB8
_08025B48: .4byte 0x00000107
_08025B4C: .4byte 0x08B905B0
_08025B50: .4byte 0x00000C51

	thumb_func_start sub_08025B54
sub_08025B54: @ 0x08025B54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, _08025C2C @ =0x081C3CB8
	mov r0, sp
	movs r2, #6
	bl memcpy
	ldr r0, _08025C30 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x92
	ldrb r0, [r0]
	str r0, [sp, #8]
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08025B8C
	movs r2, #1
_08025B8C:
	adds r7, r2, #0
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #0xc
	bl __umodsi3
	str r0, [sp, #0xc]
	bl GetGameTime
	lsrs r0, r0, #4
	movs r1, #7
	bl __umodsi3
	str r0, [sp, #0x10]
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #9
	bl __umodsi3
	mov sl, r0
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0x12
	bl __umodsi3
	mov sb, r0
	movs r0, #0x91
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025BD4
	b _08025F62
_08025BD4:
	bl sub_08025A9C
	movs r0, #1
	mov r8, r0
_08025BDC:
	mov r0, r8
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08025BEA
	b _08025F56
_08025BEA:
	ldr r0, [r4]
	cmp r0, #0
	bne _08025BF2
	b _08025F56
_08025BF2:
	ldr r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08025BFE
	b _08025F56
_08025BFE:
	adds r0, r4, #0
	bl sub_080265A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025C0C
	b _08025F56
_08025C0C:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	lsls r6, r7, #0x18
	cmp r0, #7
	bls _08025C20
	b _08025DFE
_08025C20:
	lsls r0, r0, #2
	ldr r1, _08025C34 @ =_08025C38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025C2C: .4byte 0x081C3CB8
_08025C30: .4byte 0x0202BBF8
_08025C34: .4byte _08025C38
_08025C38: @ jump table
	.4byte _08025C58 @ case 0
	.4byte _08025D00 @ case 1
	.4byte _08025CAC @ case 2
	.4byte _08025D50 @ case 3
	.4byte _08025DB0 @ case 4
	.4byte _08025DB0 @ case 5
	.4byte _08025DB0 @ case 6
	.4byte _08025DB0 @ case 7
_08025C58:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025CA4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bls _08025C82
	b _08025DFE
_08025C82:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08025C8C
	b _08025DFE
_08025C8C:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08025CA8 @ =0x08B94114
	ldr r5, [sp, #0xc]
	b _08025D94
	.align 2, 0
_08025CA4: .4byte 0x0202BBB8
_08025CA8: .4byte 0x08B94114
_08025CAC:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025CF8 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bls _08025CD6
	b _08025DFE
_08025CD6:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08025CE0
	b _08025DFE
_08025CE0:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08025CFC @ =0x08B94074
	mov r5, sb
	b _08025D94
	.align 2, 0
_08025CF8: .4byte 0x0202BBB8
_08025CFC: .4byte 0x08B94074
_08025D00:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025D44 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r0, r3, #0
	adds r0, #0x10
	movs r5, #0x80
	lsls r5, r5, #1
	lsls r6, r7, #0x18
	cmp r0, r5
	bhi _08025DFE
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025DFE
	ldr r1, _08025D48 @ =0x00000202
	adds r0, r3, r1
	subs r1, #3
	ands r0, r1
	adds r1, r2, r5
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08025D4C @ =0x08B93FD0
	ldr r5, [sp, #0x10]
	b _08025D94
	.align 2, 0
_08025D44: .4byte 0x0202BBB8
_08025D48: .4byte 0x00000202
_08025D4C: .4byte 0x08B93FD0
_08025D50:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025DA4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bhi _08025DFE
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025DFE
	ldr r1, _08025DA8 @ =0x00000201
	adds r0, r3, r1
	subs r1, #2
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08025DAC @ =0x08B94034
	mov r5, sl
_08025D94:
	lsls r2, r5, #2
	adds r2, r2, r3
	ldr r2, [r2]
	movs r3, #0
	bl PutOamHiRam
	b _08025DFE
	.align 2, 0
_08025DA4: .4byte 0x0202BBB8
_08025DA8: .4byte 0x00000201
_08025DAC: .4byte 0x08B94034
_08025DB0:
	lsls r0, r7, #0x18
	adds r6, r0, #0
	cmp r6, #0
	bne _08025DBA
	b _08025F56
_08025DBA:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025E70 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025DFE
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025DFE
	ldr r1, _08025E74 @ =0x000001FF
	adds r0, r3, r1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025E78 @ =0x08B94144
	movs r3, #0
	bl PutOamHiRam
_08025DFE:
	cmp r6, #0
	bne _08025E04
	b _08025F56
_08025E04:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08025E8C
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025E70 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _08025E36
	b _08025F56
_08025E36:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08025E40
	b _08025F56
_08025E40:
	ldr r1, _08025E7C @ =0x00000209
	adds r0, r3, r1
	subs r1, #0xa
	ands r0, r1
	ldr r3, _08025E80 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025E84 @ =0x08B905B0
	ldrb r4, [r4, #0x1b]
	lsrs r3, r4, #6
	lsls r3, r3, #1
	mov r5, sp
	adds r4, r5, r3
	movs r3, #0xf
	ldrh r4, [r4]
	ands r3, r4
	lsls r3, r3, #0xc
	ldr r4, _08025E88 @ =0x00000803
	adds r3, r3, r4
	bl PutOamHiRam
	b _08025F56
	.align 2, 0
_08025E70: .4byte 0x0202BBB8
_08025E74: .4byte 0x000001FF
_08025E78: .4byte 0x08B94144
_08025E7C: .4byte 0x00000209
_08025E80: .4byte 0x00000107
_08025E84: .4byte 0x08B905B0
_08025E88: .4byte 0x00000803
_08025E8C:
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	ldr r2, [r4]
	cmp r0, #0
	beq _08025F08
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08025F08
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025EF4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025F56
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025F56
	ldr r5, _08025EF8 @ =0x00000209
	adds r0, r3, r5
	ldr r1, _08025EFC @ =0x000001FF
	ands r0, r1
	ldr r3, _08025F00 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025F04 @ =0x08B905B0
	movs r3, #0x81
	lsls r3, r3, #4
	bl PutOamHiRam
	b _08025F56
	.align 2, 0
_08025EF4: .4byte 0x0202BBB8
_08025EF8: .4byte 0x00000209
_08025EFC: .4byte 0x000001FF
_08025F00: .4byte 0x00000107
_08025F04: .4byte 0x08B905B0
_08025F08:
	ldr r5, [sp, #8]
	ldrb r2, [r2, #4]
	cmp r5, r2
	bne _08025F56
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08025F74 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025F56
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025F56
	ldr r5, _08025F78 @ =0x00000209
	adds r0, r3, r5
	ldr r1, _08025F7C @ =0x000001FF
	ands r0, r1
	ldr r3, _08025F80 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025F84 @ =0x08B905B0
	ldr r3, _08025F88 @ =0x00000811
	bl PutOamHiRam
_08025F56:
	movs r4, #1
	add r8, r4
	mov r5, r8
	cmp r5, #0xbf
	bgt _08025F62
	b _08025BDC
_08025F62:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025F74: .4byte 0x0202BBB8
_08025F78: .4byte 0x00000209
_08025F7C: .4byte 0x000001FF
_08025F80: .4byte 0x00000107
_08025F84: .4byte 0x08B905B0
_08025F88: .4byte 0x00000811

	thumb_func_start sub_08025F8C
sub_08025F8C: @ 0x08025F8C
	ldr r1, _08025F94 @ =0x0202BBB8
	ldr r0, _08025F98 @ =0x0000FFFF
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08025F94: .4byte 0x0202BBB8
_08025F98: .4byte 0x0000FFFF

	thumb_func_start sub_08025F9C
sub_08025F9C: @ 0x08025F9C
	ldr r1, _08025FA4 @ =0x0203A3D4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08025FA4: .4byte 0x0203A3D4

	thumb_func_start sub_08025FA8
sub_08025FA8: @ 0x08025FA8
	push {r4, lr}
	ldr r2, _0802600C @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08026010 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026018
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08026018
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08026018
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _08026018
	cmp r1, #2
	beq _08026018
	ldr r1, _08026014 @ =0x0203A3D4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #5
	bne _08026018
	adds r0, r4, #0
	bl StartMu
	adds r0, r4, #0
	bl HideUnitSprite
	b _08026052
	.align 2, 0
_0802600C: .4byte 0x0202BBB8
_08026010: .4byte 0x0202E3DC
_08026014: .4byte 0x0203A3D4
_08026018:
	ldr r2, _08026058 @ =0x0202BBB8
	ldr r1, [r2, #0x18]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	beq _08026052
	ldr r1, _0802605C @ =0x0203A3D4
	movs r0, #0
	str r0, [r1]
	movs r3, #0x1a
	ldrsh r0, [r2, r3]
	ldr r1, _08026060 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x18
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026052
	bl EndAllMus
	adds r0, r4, #0
	bl ShowUnitSprite
_08026052:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026058: .4byte 0x0202BBB8
_0802605C: .4byte 0x0203A3D4
_08026060: .4byte 0x0202E3DC

	thumb_func_start sub_08026064
sub_08026064: @ 0x08026064
	push {lr}
	ldr r2, _080260A8 @ =0x0202E3DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080260AC
	ldr r0, [r2, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080260AC
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080260AC
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _080260AC
	cmp r1, #2
	beq _080260AC
	movs r0, #1
	b _080260AE
	.align 2, 0
_080260A8: .4byte 0x0202E3DC
_080260AC:
	movs r0, #0
_080260AE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080260B4
sub_080260B4: @ 0x080260B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r7, r2, #0
	adds r4, r3, #0
	adds r0, r4, #0
	bl sub_08017610
	adds r5, r0, #0
	bl sub_08024DEC
	adds r6, r0, #0
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802618A
	adds r0, r7, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802618A
	ldr r1, _08026104 @ =0x08C99700
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026138
	cmp r0, #1
	bgt _08026108
	cmp r0, #0
	beq _0802610E
	b _0802618A
	.align 2, 0
_08026104: .4byte 0x08C99700
_08026108:
	cmp r0, #2
	beq _08026164
	b _0802618A
_0802610E:
	adds r0, r4, #0
	bl sub_080256C8
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	ldr r3, _08026134 @ =0x08B905B8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r7, #0
	bl sub_080069F4
	b _0802618A
	.align 2, 0
_08026134: .4byte 0x08B905B8
_08026138:
	adds r0, r4, #0
	bl sub_080256C8
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08026160 @ =0x08B905D8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl sub_080069F4
	b _0802618A
	.align 2, 0
_08026160: .4byte 0x08B905D8
_08026164:
	adds r0, r4, #0
	bl sub_080256C8
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r1, #0x88
	lsls r1, r1, #4
	adds r0, r6, r1
	adds r4, r4, r0
	mov r1, r8
	subs r1, #8
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08026198 @ =0x08B905C0
	str r4, [sp]
	mov r0, sb
	bl sub_080069F4
_0802618A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026198: .4byte 0x08B905C0

	thumb_func_start sub_0802619C
sub_0802619C: @ 0x0802619C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl sub_08018814
	mov r8, r0
	bl sub_08024DEC
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802623C
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802623C
	ldr r1, _080261F0 @ =0x08C99700
	movs r0, #0x7f
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026210
	cmp r0, #1
	bgt _080261F4
	cmp r0, #0
	beq _080261FA
	b _0802623C
	.align 2, 0
_080261F0: .4byte 0x08C99700
_080261F4:
	cmp r0, #2
	beq _08026228
	b _0802623C
_080261FA:
	ldr r3, _0802620C @ =0x08B905B8
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_080069F4
	b _0802623C
	.align 2, 0
_0802620C: .4byte 0x08B905B8
_08026210:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08026224 @ =0x08B905D8
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	bl sub_080069F4
	b _0802623C
	.align 2, 0
_08026224: .4byte 0x08B905D8
_08026228:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _0802624C @ =0x08B905C0
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	bl sub_080069F4
_0802623C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802624C: .4byte 0x08B905C0

	thumb_func_start sub_08026250
sub_08026250: @ 0x08026250
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r3, #0
	bl sub_08018814
	adds r6, r0, #0
	bl sub_08024DEC
	adds r7, r0, #0
	adds r7, #0x80
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080262F4
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _080262F4
	ldr r1, _0802629C @ =0x08C99700
	movs r0, #0x7f
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _080262B4
	cmp r0, #1
	bgt _080262A0
	cmp r0, #0
	beq _080262A6
	b _080262F4
	.align 2, 0
_0802629C: .4byte 0x08C99700
_080262A0:
	cmp r0, #2
	beq _080262D4
	b _080262F4
_080262A6:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r4, r0
	ldr r3, _080262B0 @ =0x08B905B8
	b _080262C4
	.align 2, 0
_080262B0: .4byte 0x08B905B8
_080262B4:
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _080262D0 @ =0x08B905D8
_080262C4:
	str r7, [sp]
	mov r0, r8
	adds r1, r5, #0
	bl sub_08006A34
	b _080262F4
	.align 2, 0
_080262D0: .4byte 0x08B905D8
_080262D4:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _08026300 @ =0x000001FF
	ands r1, r0
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _08026304 @ =0x08B905C0
	str r7, [sp]
	mov r0, r8
	bl sub_08006A34
_080262F4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026300: .4byte 0x000001FF
_08026304: .4byte 0x08B905C0

	thumb_func_start sub_08026308
sub_08026308: @ 0x08026308
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl sub_08018814
	adds r2, r0, #0
	ldr r0, _0802635C @ =0x08B93E48
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r4, r0, #1
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08026390
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08026390
	ldr r1, _08026360 @ =0x08C99700
	movs r0, #0x7f
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	blt _08026390
	cmp r0, #1
	ble _08026364
	cmp r0, #2
	beq _0802637C
	b _08026390
	.align 2, 0
_0802635C: .4byte 0x08B93E48
_08026360: .4byte 0x08C99700
_08026364:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08026378 @ =0x08B905D8
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	bl sub_080069F4
	b _08026390
	.align 2, 0
_08026378: .4byte 0x08B905D8
_0802637C:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _0802639C @ =0x08B905C0
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	bl sub_080069F4
_08026390:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802639C: .4byte 0x08B905C0

	thumb_func_start sub_080263A0
sub_080263A0: @ 0x080263A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [sp, #0x20]
	bl sub_08017610
	adds r4, r0, #0
	bl sub_08024DEC
	adds r5, r0, #0
	adds r5, #0x80
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802646A
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0802646A
	ldr r1, _080263F0 @ =0x08C99700
	movs r0, #0x7f
	ands r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026420
	cmp r0, #1
	bgt _080263F4
	cmp r0, #0
	beq _080263FA
	b _0802646A
	.align 2, 0
_080263F0: .4byte 0x08C99700
_080263F4:
	cmp r0, #2
	beq _08026448
	b _0802646A
_080263FA:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	ldr r3, _0802641C @ =0x08B905B8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	adds r2, r6, #0
	bl sub_080069F4
	b _0802646A
	.align 2, 0
_0802641C: .4byte 0x08B905B8
_08026420:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08026444 @ =0x08B905D8
	str r1, [sp]
	mov r0, sb
	mov r1, r8
	bl sub_080069F4
	b _0802646A
	.align 2, 0
_08026444: .4byte 0x08B905D8
_08026448:
	ldr r0, [sp, #0x20]
	bl GetUnitSpritePalette
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r4, r7, r4
	adds r4, r4, r5
	mov r1, r8
	subs r1, #8
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08026478 @ =0x08B905C0
	str r4, [sp]
	mov r0, sb
	bl sub_080069F4
_0802646A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026478: .4byte 0x08B905C0

	thumb_func_start sub_0802647C
sub_0802647C: @ 0x0802647C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	bl sub_08017610
	adds r5, r0, #0
	bl sub_08024DEC
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r7, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08026550
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08026550
	ldr r1, _080264CC @ =0x08C99700
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026500
	cmp r0, #1
	bgt _080264D0
	cmp r0, #0
	beq _080264D6
	b _08026550
	.align 2, 0
_080264CC: .4byte 0x08C99700
_080264D0:
	cmp r0, #2
	beq _0802652C
	b _08026550
_080264D6:
	ldr r3, _080264F8 @ =0x08B94152
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_080069F4
	ldr r3, _080264FC @ =0x08B9416A
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_080069F4
	b _08026550
	.align 2, 0
_080264F8: .4byte 0x08B94152
_080264FC: .4byte 0x08B9416A
_08026500:
	adds r5, r6, #0
	subs r5, #0x10
	ldr r3, _08026524 @ =0x08B9415A
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_080069F4
	ldr r3, _08026528 @ =0x08B94172
	str r4, [sp]
	mov r0, sb
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_080069F4
	b _08026550
	.align 2, 0
_08026524: .4byte 0x08B9415A
_08026528: .4byte 0x08B94172
_0802652C:
	adds r5, r7, #0
	subs r5, #8
	subs r6, #0x10
	ldr r3, _08026560 @ =0x08B94162
	add r4, r8
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080069F4
	ldr r3, _08026564 @ =0x08B9417A
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080069F4
_08026550:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026560: .4byte 0x08B94162
_08026564: .4byte 0x08B9417A

	thumb_func_start sub_08026568
sub_08026568: @ 0x08026568
	ldr r1, _08026570 @ =0x02039F1C
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08026570: .4byte 0x02039F1C

	thumb_func_start HideUnitSprite
HideUnitSprite: @ 0x08026574
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _08026580
	bl RefreshUnitSprites
_08026580:
	ldr r1, [r4, #0x3c]
	cmp r1, #0
	beq _08026592
	movs r2, #0x80
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r2, [r1, #0xb]
	orrs r0, r2
	strb r0, [r1, #0xb]
_08026592:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ShowUnitSprite
ShowUnitSprite: @ 0x08026598
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	beq _080265A6
	movs r0, #0x7f
	ldrb r2, [r1, #0xb]
	ands r0, r2
	strb r0, [r1, #0xb]
_080265A6:
	bx lr

	thumb_func_start sub_080265A8
sub_080265A8: @ 0x080265A8
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	beq _080265BC
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080265BE
_080265BC:
	movs r0, #0x80
_080265BE:
	bx lr

	thumb_func_start sub_080265C0
sub_080265C0: @ 0x080265C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r5, r1, #0
	mov sb, r2
	ldr r0, _08026624 @ =0x08B93F18
	lsls r3, r3, #1
	adds r3, r3, r0
	ldrh r6, [r3]
	movs r3, #0
	cmp r3, sb
	bge _08026618
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #2
	movs r1, #0xf
	mov ip, r1
	mov r7, ip
	lsls r7, r0
	mov ip, r7
_080265EC:
	adds r4, r3, #1
	cmp r5, #0
	ble _08026612
	mov r0, ip
	mvns r2, r0
	asrs r1, r6, #3
	lsls r1, r1, #2
	lsls r0, r3, #0xa
	adds r3, r5, #0
	adds r0, r0, r1
	mov r7, r8
	adds r1, r7, r0
_08026604:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x20
	subs r3, #1
	cmp r3, #0
	bne _08026604
_08026612:
	adds r3, r4, #0
	cmp r3, sb
	blt _080265EC
_08026618:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026624: .4byte 0x08B93F18

	thumb_func_start sub_08026628
sub_08026628: @ 0x08026628
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026634
	ldrb r0, [r0, #0x15]
	b _08026636
_08026634:
	movs r0, #0
_08026636:
	bx lr

	thumb_func_start sub_08026638
sub_08026638: @ 0x08026638
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026646
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08026648
_08026646:
	movs r0, #0
_08026648:
	bx lr
	.align 2, 0

	thumb_func_start sub_0802664C
sub_0802664C: @ 0x0802664C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_08026638
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0xc0
	ldrb r4, [r4, #0xb]
	ands r0, r4
	adds r5, r0, #1
	adds r6, r0, #0
	adds r6, #0x40
	cmp r5, r6
	bge _0802668A
_08026668:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026684
	ldr r0, [r4]
	cmp r0, #0
	beq _08026684
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _08026684
	adds r0, r4, #0
	b _0802668C
_08026684:
	adds r5, #1
	cmp r5, r6
	blt _08026668
_0802668A:
	movs r0, #0
_0802668C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08026694
sub_08026694: @ 0x08026694
	adds r0, #0x32
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xf0
	ble _080266A2
	movs r0, #3
	b _080266B4
_080266A2:
	cmp r0, #0xa0
	ble _080266AA
	movs r0, #2
	b _080266B4
_080266AA:
	cmp r0, #0x50
	bgt _080266B2
	movs r0, #0
	b _080266B4
_080266B2:
	movs r0, #1
_080266B4:
	bx lr
	.align 2, 0

	thumb_func_start sub_080266B8
sub_080266B8: @ 0x080266B8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_08026628
	adds r5, r0, #0
	movs r4, #0
	movs r6, #0
	cmp r6, r5
	bge _080266DA
_080266CA:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_08026694
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _080266CA
_080266DA:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080266E4
sub_080266E4: @ 0x080266E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, _0802673C @ =0x0202BBF8
	mov r8, r0
	ldrb r3, [r0, #0x1b]
	cmp r3, #1
	beq _08026730
	ldr r0, [r2]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026730
	adds r0, #0xe
	adds r0, r0, r1
	ldrb r6, [r0]
	adds r0, r2, #0
	adds r0, #0x32
	adds r7, r0, r1
	ldrb r5, [r7]
	ldr r4, _08026740 @ =0x08B94184
	adds r0, r2, #0
	bl sub_08026694
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, r6
	cmp r0, r1
	ble _08026722
	subs r6, r1, r5
_08026722:
	adds r0, r5, r6
	strb r0, [r7]
	mov r1, r8
	ldrh r1, [r1, #0x16]
	adds r0, r1, r6
	mov r2, r8
	strh r0, [r2, #0x16]
_08026730:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802673C: .4byte 0x0202BBF8
_08026740: .4byte 0x08B94184

	thumb_func_start sub_08026744
sub_08026744: @ 0x08026744
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0x32
	adds r2, r2, r1
	ldrb r3, [r2]
	adds r3, #1
	strb r3, [r2]
	ldr r3, _08026774 @ =0x0202BBF8
	ldrh r2, [r3, #0x16]
	adds r2, #1
	strh r2, [r3, #0x16]
	ldr r2, [r0]
	ldrb r4, [r2, #4]
	bl sub_08026638
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_08026BA0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026774: .4byte 0x0202BBF8

	thumb_func_start sub_08026778
sub_08026778: @ 0x08026778
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _080267DC @ =0x0202BBF8
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080267D6
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080267D6
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08026BF0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080267D6
	adds r0, r5, #0
	bl sub_080266B8
	cmp r0, #4
	bgt _080267D6
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0802664C
	bl sub_080266B8
	cmp r0, #4
	bgt _080267D6
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	ldrb r7, [r0]
	ldr r4, _080267E0 @ =0x08B94184
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08026694
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r7, #0xf1
	bne _080267E4
_080267D6:
	movs r0, #0
	b _080267EE
	.align 2, 0
_080267DC: .4byte 0x0202BBF8
_080267E0: .4byte 0x08B94184
_080267E4:
	movs r1, #0
	cmp r7, r0
	bne _080267EC
	movs r1, #1
_080267EC:
	adds r0, r1, #0
_080267EE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080267F4
sub_080267F4: @ 0x080267F4
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026804
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08026808
_08026804:
	movs r0, #1
	rsbs r0, r0, #0
_08026808:
	bx lr
	.align 2, 0

	thumb_func_start sub_0802680C
sub_0802680C: @ 0x0802680C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	bl sub_08026628
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802683A
_08026820:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08026638
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r7
	bne _08026834
	adds r0, r4, #0
	b _0802683E
_08026834:
	adds r4, #1
	cmp r4, r5
	blt _08026820
_0802683A:
	movs r0, #1
	rsbs r0, r0, #0
_0802683E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ClearUnitSupports
ClearUnitSupports: @ 0x08026844
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	bl sub_08026628
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _0802688C
	mov r8, r6
_0802685A:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0802664C
	adds r4, r0, #0
	cmp r4, #0
	beq _08026886
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl sub_0802680C
	adds r1, r4, #0
	adds r1, #0x32
	adds r1, r1, r0
	mov r0, r8
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	mov r1, r8
	strb r1, [r0]
_08026886:
	adds r6, #1
	cmp r6, r7
	blt _0802685A
_0802688C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08026898
sub_08026898: @ 0x08026898
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _08026938 @ =0x0202BBF8
	ldrh r0, [r1, #0x10]
	cmp r0, #1
	beq _08026984
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08026984
	movs r4, #1
_080268B4:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov sb, r4
	cmp r5, #0
	beq _0802697E
	ldr r0, [r5]
	cmp r0, #0
	beq _0802697E
	ldr r0, [r5, #0xc]
	ldr r1, _0802693C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0802697E
	adds r0, r5, #0
	bl sub_080266B8
	cmp r0, #4
	bgt _0802697E
	adds r0, r5, #0
	bl sub_08026628
	mov r8, r0
	movs r7, #0
	cmp r7, r8
	bge _0802697E
_080268EC:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_0802664C
	adds r4, r0, #0
	cmp r4, #0
	beq _08026978
	ldr r1, [r4, #0xc]
	ldr r0, _0802693C @ =0x0001000C
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0
	bne _08026978
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	mov ip, r1
	cmp r0, #0
	bne _08026978
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08026924
	subs r1, r0, r2
_08026924:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _08026940
	adds r0, r1, r2
	b _08026944
	.align 2, 0
_08026938: .4byte 0x0202BBF8
_0802693C: .4byte 0x0001000C
_08026940:
	subs r0, r0, r3
	adds r0, r1, r0
_08026944:
	cmp r0, #0
	beq _0802694E
	cmp r0, #1
	beq _08026956
	b _08026978
_0802694E:
	ldrb r0, [r5, #0x1b]
	cmp r0, ip
	bne _08026978
	b _08026966
_08026956:
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08026978
	ands r6, r1
	cmp r6, #0
	bne _08026978
_08026966:
	adds r0, r4, #0
	bl sub_080266B8
	cmp r0, #4
	bgt _08026978
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_080266E4
_08026978:
	adds r7, #1
	cmp r7, r8
	blt _080268EC
_0802697E:
	mov r4, sb
	cmp r4, #0x3f
	ble _080268B4
_08026984:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08026990
sub_08026990: @ 0x08026990
	adds r2, r0, #0
	ldr r1, _08026998 @ =0x08C9A1C0
	b _080269A8
	.align 2, 0
_08026998: .4byte 0x08C9A1C0
_0802699C:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080269A6
	adds r0, r1, #0
	b _080269AE
_080269A6:
	adds r1, #8
_080269A8:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0802699C
_080269AE:
	bx lr

	thumb_func_start sub_080269B0
sub_080269B0: @ 0x080269B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	bl sub_08026990
	ldrb r2, [r0, #1]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #1]
	adds r1, r2, r1
	strb r1, [r4, #1]
	ldrb r2, [r0, #2]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #2]
	adds r1, r2, r1
	strb r1, [r4, #2]
	ldrb r2, [r0, #3]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #3]
	adds r1, r2, r1
	strb r1, [r4, #3]
	ldrb r2, [r0, #4]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #4]
	adds r1, r2, r1
	strb r1, [r4, #4]
	ldrb r2, [r0, #5]
	adds r1, r2, #0
	muls r1, r5, r1
	ldrb r2, [r4, #5]
	adds r1, r2, r1
	strb r1, [r4, #5]
	ldrb r0, [r0, #6]
	muls r0, r5, r0
	ldrb r1, [r4, #6]
	adds r0, r1, r0
	strb r0, [r4, #6]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08026A08
sub_08026A08: @ 0x08026A08
	movs r1, #0
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	bx lr

	thumb_func_start sub_08026A18
sub_08026A18: @ 0x08026A18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	movs r0, #0
	mov sb, r0
	adds r0, r6, #0
	bl sub_08026A08
	adds r0, r7, #0
	bl sub_08026628
	mov sl, r0
	movs r1, #0
	mov r8, r1
	cmp sb, sl
	bge _08026AE4
	subs r0, #1
	str r0, [sp]
_08026A46:
	mov r1, sb
	asrs r1, r1, #1
	mov sb, r1
	adds r0, r7, #0
	mov r1, r8
	bl sub_0802664C
	adds r5, r0, #0
	cmp r5, #0
	beq _08026ADC
	ldr r1, _08026B1C @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08026A8C
	movs r2, #0x10
	ldrsb r2, [r7, r2]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08026A76
	subs r1, r0, r2
_08026A76:
	movs r3, #0x11
	ldrsb r3, [r7, r3]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _08026A86
	subs r0, r2, r3
_08026A86:
	adds r0, r1, r0
	cmp r0, #3
	bgt _08026ADC
_08026A8C:
	ldr r0, [r5, #0xc]
	ldr r1, _08026B20 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08026ADC
	ldr r0, [r7]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl sub_0802680C
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_08026694
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r4, #0
	bl sub_080269B0
	adds r0, r7, #0
	mov r1, r8
	bl sub_08026694
	adds r5, r0, #0
	ldr r0, [r7]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r5, #0
	bl sub_080269B0
	cmp r4, #0
	beq _08026ADC
	cmp r5, #0
	beq _08026ADC
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r1
	add sb, r0
_08026ADC:
	movs r0, #1
	add r8, r0
	cmp r8, sl
	blt _08026A46
_08026AE4:
	ldrb r1, [r6, #1]
	lsrs r0, r1, #1
	strb r0, [r6, #1]
	ldrb r1, [r6, #2]
	lsrs r0, r1, #1
	strb r0, [r6, #2]
	ldrb r1, [r6, #3]
	lsrs r0, r1, #1
	strb r0, [r6, #3]
	ldrb r1, [r6, #4]
	lsrs r0, r1, #1
	strb r0, [r6, #4]
	ldrb r1, [r6, #5]
	lsrs r0, r1, #1
	strb r0, [r6, #5]
	ldrb r1, [r6, #6]
	lsrs r0, r1, #1
	strb r0, [r6, #6]
	mov r0, sb
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026B1C: .4byte 0x0202BBB8
_08026B20: .4byte 0x0001002C

	thumb_func_start sub_08026B24
sub_08026B24: @ 0x08026B24
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _08026B30
	adds r0, #0x79
	b _08026B34
_08026B30:
	movs r0, #1
	rsbs r0, r0, #0
_08026B34:
	bx lr
	.align 2, 0

	thumb_func_start sub_08026B38
sub_08026B38: @ 0x08026B38
	push {lr}
	bl sub_08018D38
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _08026B48
	adds r0, #0x79
	b _08026B4C
_08026B48:
	movs r0, #1
	rsbs r0, r0, #0
_08026B4C:
	pop {r1}
	bx r1

	thumb_func_start sub_08026B50
sub_08026B50: @ 0x08026B50
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08026B70 @ =0x081C3CC0
	mov r0, sp
	movs r2, #4
	bl memcpy
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08026B70: .4byte 0x081C3CC0

	thumb_func_start sub_08026B74
sub_08026B74: @ 0x08026B74
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08026B9C @ =0x081C3CC4
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl GetMsg
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08026B9C: .4byte 0x081C3CC4

	thumb_func_start sub_08026BA0
sub_08026BA0: @ 0x08026BA0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl GetUnitByPid
	adds r7, r0, #0
	adds r1, r5, #0
	bl sub_0802680C
	adds r2, r0, #0
	adds r1, r7, #0
	adds r1, #0x39
	movs r4, #1
	adds r0, r4, #0
	lsls r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	bl GetUnitByPid
	adds r7, r0, #0
	adds r1, r6, #0
	bl sub_0802680C
	adds r2, r0, #0
	adds r0, r7, #0
	adds r0, #0x39
	lsls r4, r2
	ldrb r1, [r0]
	orrs r4, r1
	strb r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08026BF0
sub_08026BF0: @ 0x08026BF0
	adds r0, #0x39
	movs r2, #1
	lsls r2, r1
	ldrb r0, [r0]
	ands r2, r0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0

	thumb_func_start sub_08026C08
sub_08026C08: @ 0x08026C08
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitByPid
	adds r5, r0, #0
	adds r1, r4, #0
	bl sub_0802680C
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_08026694
	cmp r0, #2
	bgt _08026C30
	movs r0, #0
	b _08026C32
_08026C30:
	movs r0, #1
_08026C32:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08026C38
sub_08026C38: @ 0x08026C38
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r2, #0
	beq _08026CCC
	cmp r3, #0
	beq _08026CCC
	ldrb r1, [r2, #8]
	ldrb r0, [r3, #8]
	strb r0, [r2, #8]
	strb r1, [r3, #8]
	ldrb r1, [r2, #9]
	ldrb r0, [r3, #9]
	strb r0, [r2, #9]
	strb r1, [r3, #9]
	ldrb r1, [r2, #0x12]
	ldrb r0, [r3, #0x12]
	strb r0, [r2, #0x12]
	strb r1, [r3, #0x12]
	ldrb r1, [r2, #0x13]
	ldrb r0, [r3, #0x13]
	strb r0, [r2, #0x13]
	strb r1, [r3, #0x13]
	ldrb r1, [r2, #0x14]
	ldrb r0, [r3, #0x14]
	strb r0, [r2, #0x14]
	strb r1, [r3, #0x14]
	ldrb r1, [r2, #0x15]
	ldrb r0, [r3, #0x15]
	strb r0, [r2, #0x15]
	strb r1, [r3, #0x15]
	ldrb r1, [r2, #0x16]
	ldrb r0, [r3, #0x16]
	strb r0, [r2, #0x16]
	strb r1, [r3, #0x16]
	ldrb r1, [r2, #0x17]
	ldrb r0, [r3, #0x17]
	strb r0, [r2, #0x17]
	strb r1, [r3, #0x17]
	ldrb r1, [r2, #0x18]
	ldrb r0, [r3, #0x18]
	strb r0, [r2, #0x18]
	strb r1, [r3, #0x18]
	ldrb r1, [r2, #0x19]
	ldrb r0, [r3, #0x19]
	strb r0, [r2, #0x19]
	strb r1, [r3, #0x19]
	ldrb r1, [r2, #0x1a]
	ldrb r0, [r3, #0x1a]
	strb r0, [r2, #0x1a]
	strb r1, [r3, #0x1a]
	ldrb r1, [r2, #0x1d]
	ldrb r0, [r3, #0x1d]
	strb r0, [r2, #0x1d]
	strb r1, [r3, #0x1d]
	ldrh r1, [r2, #0x1e]
	ldrh r0, [r3, #0x1e]
	strh r0, [r2, #0x1e]
	strh r1, [r3, #0x1e]
	ldrh r1, [r2, #0x20]
	ldrh r0, [r3, #0x20]
	strh r0, [r2, #0x20]
	strh r1, [r3, #0x20]
	ldrh r1, [r2, #0x22]
	ldrh r0, [r3, #0x22]
	strh r0, [r2, #0x22]
	strh r1, [r3, #0x22]
	ldrh r1, [r2, #0x24]
	ldrh r0, [r3, #0x24]
	strh r0, [r2, #0x24]
	strh r1, [r3, #0x24]
	ldrh r1, [r2, #0x26]
	ldrh r0, [r3, #0x26]
	strh r0, [r2, #0x26]
	strh r1, [r3, #0x26]
_08026CCC:
	bx lr
	.align 2, 0

	thumb_func_start sub_08026CD0
sub_08026CD0: @ 0x08026CD0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08026CF4
	adds r0, r4, #0
	adds r1, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08026CF4
	b _08026F44
_08026CF4:
	adds r0, r5, #0
	bl GetItemIid
	subs r0, #0x4a
	cmp r0, #0x50
	bls _08026D02
	b _08026F44
_08026D02:
	lsls r0, r0, #2
	ldr r1, _08026D0C @ =_08026D10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026D0C: .4byte _08026D10
_08026D10: @ jump table
	.4byte _08026E54 @ case 0
	.4byte _08026E54 @ case 1
	.4byte _08026E54 @ case 2
	.4byte _08026E5C @ case 3
	.4byte _08026E64 @ case 4
	.4byte _08026E6C @ case 5
	.4byte _08026E84 @ case 6
	.4byte _08026E8C @ case 7
	.4byte _08026E94 @ case 8
	.4byte _08026E9C @ case 9
	.4byte _08026E74 @ case 10
	.4byte _08026F10 @ case 11
	.4byte _08026EA4 @ case 12
	.4byte _08026EAC @ case 13
	.4byte _08026E7C @ case 14
	.4byte _08026F44 @ case 15
	.4byte _08026EB4 @ case 16
	.4byte _08026EB4 @ case 17
	.4byte _08026EB4 @ case 18
	.4byte _08026EB4 @ case 19
	.4byte _08026EB4 @ case 20
	.4byte _08026EB4 @ case 21
	.4byte _08026EB4 @ case 22
	.4byte _08026EB4 @ case 23
	.4byte _08026EB4 @ case 24
	.4byte _08026EBE @ case 25
	.4byte _08026EBE @ case 26
	.4byte _08026EBE @ case 27
	.4byte _08026EBE @ case 28
	.4byte _08026EBE @ case 29
	.4byte _08026EE8 @ case 30
	.4byte _08026EF0 @ case 31
	.4byte _08026EF8 @ case 32
	.4byte _08026EC8 @ case 33
	.4byte _08026EC8 @ case 34
	.4byte _08026ED0 @ case 35
	.4byte _08026EE0 @ case 36
	.4byte _08026ED8 @ case 37
	.4byte _08026F44 @ case 38
	.4byte _08026F44 @ case 39
	.4byte _08026F44 @ case 40
	.4byte _08026F44 @ case 41
	.4byte _08026F44 @ case 42
	.4byte _08026F44 @ case 43
	.4byte _08026F44 @ case 44
	.4byte _08026F44 @ case 45
	.4byte _08026EE8 @ case 46
	.4byte _08026F00 @ case 47
	.4byte _08026F08 @ case 48
	.4byte _08026F44 @ case 49
	.4byte _08026F20 @ case 50
	.4byte _08026F20 @ case 51
	.4byte _08026F20 @ case 52
	.4byte _08026F20 @ case 53
	.4byte _08026F44 @ case 54
	.4byte _08026F44 @ case 55
	.4byte _08026F44 @ case 56
	.4byte _08026F44 @ case 57
	.4byte _08026F44 @ case 58
	.4byte _08026F44 @ case 59
	.4byte _08026F44 @ case 60
	.4byte _08026EBE @ case 61
	.4byte _08026F34 @ case 62
	.4byte _08026EBE @ case 63
	.4byte _08026F44 @ case 64
	.4byte _08026EBE @ case 65
	.4byte _08026F44 @ case 66
	.4byte _08026F44 @ case 67
	.4byte _08026F44 @ case 68
	.4byte _08026F44 @ case 69
	.4byte _08026F44 @ case 70
	.4byte _08026F44 @ case 71
	.4byte _08026F44 @ case 72
	.4byte _08026F44 @ case 73
	.4byte _08026F44 @ case 74
	.4byte _08026F44 @ case 75
	.4byte _08026EBE @ case 76
	.4byte _08026F44 @ case 77
	.4byte _08026F44 @ case 78
	.4byte _08026F44 @ case 79
	.4byte _08026EC8 @ case 80
_08026E54:
	ldr r1, _08026E58 @ =sub_0802458C
	b _08026F22
	.align 2, 0
_08026E58: .4byte sub_0802458C
_08026E5C:
	ldr r1, _08026E60 @ =sub_080245C0
	b _08026F22
	.align 2, 0
_08026E60: .4byte sub_080245C0
_08026E64:
	ldr r1, _08026E68 @ =sub_080245C0
	b _08026F22
	.align 2, 0
_08026E68: .4byte sub_080245C0
_08026E6C:
	ldr r1, _08026E70 @ =sub_0802465C
	b _08026F22
	.align 2, 0
_08026E70: .4byte sub_0802465C
_08026E74:
	ldr r1, _08026E78 @ =sub_0802474C
	b _08026F22
	.align 2, 0
_08026E78: .4byte sub_0802474C
_08026E7C:
	ldr r1, _08026E80 @ =sub_080246E0
	b _08026F22
	.align 2, 0
_08026E80: .4byte sub_080246E0
_08026E84:
	ldr r1, _08026E88 @ =sub_08024858
	b _08026F22
	.align 2, 0
_08026E88: .4byte sub_08024858
_08026E8C:
	ldr r1, _08026E90 @ =sub_08024880
	b _08026F22
	.align 2, 0
_08026E90: .4byte sub_08024880
_08026E94:
	ldr r1, _08026E98 @ =sub_080248A8
	b _08026F22
	.align 2, 0
_08026E98: .4byte sub_080248A8
_08026E9C:
	ldr r1, _08026EA0 @ =sub_08024908
	b _08026F22
	.align 2, 0
_08026EA0: .4byte sub_08024908
_08026EA4:
	ldr r1, _08026EA8 @ =sub_080249C8
	b _08026F22
	.align 2, 0
_08026EA8: .4byte sub_080249C8
_08026EAC:
	ldr r1, _08026EB0 @ =sub_0802493C
	b _08026F22
	.align 2, 0
_08026EB0: .4byte sub_0802493C
_08026EB4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CanUnitUseStatGainItem
	b _08026F28
_08026EBE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08027400
	b _08026F28
_08026EC8:
	adds r0, r4, #0
	bl sub_080272E4
	b _08026F28
_08026ED0:
	adds r0, r4, #0
	bl sub_08027308
	b _08026F28
_08026ED8:
	adds r0, r4, #0
	bl sub_0802731C
	b _08026F28
_08026EE0:
	adds r0, r4, #0
	bl sub_08027340
	b _08026F28
_08026EE8:
	adds r0, r4, #0
	bl sub_08027354
	b _08026F28
_08026EF0:
	adds r0, r4, #0
	bl sub_08027390
	b _08026F28
_08026EF8:
	adds r0, r4, #0
	bl sub_080273B8
	b _08026F28
_08026F00:
	ldr r1, _08026F04 @ =sub_08024B64
	b _08026F22
	.align 2, 0
_08026F04: .4byte sub_08024B64
_08026F08:
	ldr r1, _08026F0C @ =sub_08024BF0
	b _08026F22
	.align 2, 0
_08026F0C: .4byte sub_08024BF0
_08026F10:
	ldr r1, _08026F1C @ =0x0202BBF8
	ldrb r2, [r1, #0xd]
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	b _08026F46
	.align 2, 0
_08026F1C: .4byte 0x0202BBF8
_08026F20:
	ldr r1, _08026F30 @ =sub_08024C54
_08026F22:
	adds r0, r4, #0
	bl sub_080272D0
_08026F28:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08026F46
	.align 2, 0
_08026F30: .4byte sub_08024C54
_08026F34:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _08026F44
	movs r0, #1
	b _08026F46
_08026F44:
	movs r0, #0
_08026F46:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08026F4C
sub_08026F4C: @ 0x08026F4C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetItemIid
	subs r0, #0x55
	cmp r0, #0x45
	bls _08026F5E
	b _080270F0
_08026F5E:
	lsls r0, r0, #2
	ldr r1, _08026F68 @ =_08026F6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026F68: .4byte _08026F6C
_08026F6C: @ jump table
	.4byte _08027084 @ case 0
	.4byte _080270F0 @ case 1
	.4byte _080270F0 @ case 2
	.4byte _080270F0 @ case 3
	.4byte _080270F0 @ case 4
	.4byte _08027084 @ case 5
	.4byte _08027084 @ case 6
	.4byte _08027084 @ case 7
	.4byte _08027084 @ case 8
	.4byte _08027084 @ case 9
	.4byte _08027084 @ case 10
	.4byte _08027084 @ case 11
	.4byte _08027084 @ case 12
	.4byte _08027084 @ case 13
	.4byte _080270C6 @ case 14
	.4byte _080270C6 @ case 15
	.4byte _080270C6 @ case 16
	.4byte _080270C6 @ case 17
	.4byte _080270C6 @ case 18
	.4byte _0802708C @ case 19
	.4byte _08027094 @ case 20
	.4byte _0802709C @ case 21
	.4byte _08027084 @ case 22
	.4byte _08027084 @ case 23
	.4byte _08027084 @ case 24
	.4byte _08027084 @ case 25
	.4byte _08027084 @ case 26
	.4byte _080270F0 @ case 27
	.4byte _080270F0 @ case 28
	.4byte _080270F0 @ case 29
	.4byte _080270F0 @ case 30
	.4byte _080270F0 @ case 31
	.4byte _080270F0 @ case 32
	.4byte _080270F0 @ case 33
	.4byte _080270F0 @ case 34
	.4byte _0802708C @ case 35
	.4byte _080270F0 @ case 36
	.4byte _080270F0 @ case 37
	.4byte _080270F0 @ case 38
	.4byte _080270F0 @ case 39
	.4byte _080270F0 @ case 40
	.4byte _080270F0 @ case 41
	.4byte _080270F0 @ case 42
	.4byte _080270F0 @ case 43
	.4byte _080270F0 @ case 44
	.4byte _080270F0 @ case 45
	.4byte _080270F0 @ case 46
	.4byte _080270F0 @ case 47
	.4byte _080270F0 @ case 48
	.4byte _080270F0 @ case 49
	.4byte _080270C6 @ case 50
	.4byte _080270F0 @ case 51
	.4byte _080270C6 @ case 52
	.4byte _080270F0 @ case 53
	.4byte _080270C6 @ case 54
	.4byte _080270F0 @ case 55
	.4byte _080270F0 @ case 56
	.4byte _080270F0 @ case 57
	.4byte _080270F0 @ case 58
	.4byte _080270F0 @ case 59
	.4byte _080270F0 @ case 60
	.4byte _080270F0 @ case 61
	.4byte _080270F0 @ case 62
	.4byte _080270F0 @ case 63
	.4byte _080270F0 @ case 64
	.4byte _080270C6 @ case 65
	.4byte _080270F0 @ case 66
	.4byte _080270F0 @ case 67
	.4byte _080270F0 @ case 68
	.4byte _08027084 @ case 69
_08027084:
	ldr r0, _08027088 @ =0x00000743
	b _080270F2
	.align 2, 0
_08027088: .4byte 0x00000743
_0802708C:
	ldr r0, _08027090 @ =0x00000747
	b _080270F2
	.align 2, 0
_08027090: .4byte 0x00000747
_08027094:
	ldr r0, _08027098 @ =0x00000746
	b _080270F2
	.align 2, 0
_08027098: .4byte 0x00000746
_0802709C:
	ldr r0, _080270B8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080270C0
	ldr r0, _080270BC @ =0x0000074A
	b _080270F2
	.align 2, 0
_080270B8: .4byte 0x03004690
_080270BC: .4byte 0x0000074A
_080270C0:
	movs r0, #0xe9
	lsls r0, r0, #3
	b _080270F2
_080270C6:
	ldr r4, _080270E8 @ =0x03004690
	ldr r1, [r4]
	movs r5, #8
	ldrsb r5, [r1, r5]
	movs r0, #0xa
	strb r0, [r1, #8]
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_08027400
	ldr r1, [r4]
	strb r5, [r1, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080270F0
	ldr r0, _080270EC @ =0x00000745
	b _080270F2
	.align 2, 0
_080270E8: .4byte 0x03004690
_080270EC: .4byte 0x00000745
_080270F0:
	ldr r0, _080270F8 @ =0x00000744
_080270F2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080270F8: .4byte 0x00000744

	thumb_func_start sub_080270FC
sub_080270FC: @ 0x080270FC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ClearUi
	movs r0, #0
	bl sub_08006D50
	adds r0, r4, #0
	bl GetItemIid
	subs r0, #0x4a
	cmp r0, #0x35
	bls _0802711A
	b _080272C4
_0802711A:
	lsls r0, r0, #2
	ldr r1, _08027124 @ =_08027128
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08027124: .4byte _08027128
_08027128: @ jump table
	.4byte _08027200 @ case 0
	.4byte _08027200 @ case 1
	.4byte _08027200 @ case 2
	.4byte _08027208 @ case 3
	.4byte _0802727C @ case 4
	.4byte _08027228 @ case 5
	.4byte _08027238 @ case 6
	.4byte _08027240 @ case 7
	.4byte _08027248 @ case 8
	.4byte _0802726C @ case 9
	.4byte _08027218 @ case 10
	.4byte _080272A8 @ case 11
	.4byte _08027274 @ case 12
	.4byte _08027260 @ case 13
	.4byte _08027258 @ case 14
	.4byte _080272C4 @ case 15
	.4byte _080272C4 @ case 16
	.4byte _080272C4 @ case 17
	.4byte _080272C4 @ case 18
	.4byte _080272C4 @ case 19
	.4byte _080272C4 @ case 20
	.4byte _080272C4 @ case 21
	.4byte _080272C4 @ case 22
	.4byte _080272C4 @ case 23
	.4byte _080272C4 @ case 24
	.4byte _080272C4 @ case 25
	.4byte _080272C4 @ case 26
	.4byte _080272C4 @ case 27
	.4byte _080272C4 @ case 28
	.4byte _080272C4 @ case 29
	.4byte _080272C4 @ case 30
	.4byte _080272C4 @ case 31
	.4byte _080272C4 @ case 32
	.4byte _080272C4 @ case 33
	.4byte _080272C4 @ case 34
	.4byte _080272C4 @ case 35
	.4byte _080272C4 @ case 36
	.4byte _080272C4 @ case 37
	.4byte _080272C4 @ case 38
	.4byte _080272C4 @ case 39
	.4byte _080272C4 @ case 40
	.4byte _080272C4 @ case 41
	.4byte _080272C4 @ case 42
	.4byte _080272C4 @ case 43
	.4byte _080272C4 @ case 44
	.4byte _080272C4 @ case 45
	.4byte _080272C4 @ case 46
	.4byte _08027284 @ case 47
	.4byte _08027294 @ case 48
	.4byte _080272C4 @ case 49
	.4byte _080272B0 @ case 50
	.4byte _080272B0 @ case 51
	.4byte _080272B0 @ case 52
	.4byte _080272B0 @ case 53
_08027200:
	ldr r1, _08027204 @ =sub_0802458C
	b _0802720A
	.align 2, 0
_08027204: .4byte sub_0802458C
_08027208:
	ldr r1, _08027214 @ =sub_080245C0
_0802720A:
	adds r0, r5, #0
	bl sub_08027CBC
	b _080272CA
	.align 2, 0
_08027214: .4byte sub_080245C0
_08027218:
	ldr r1, _08027224 @ =sub_0802474C
	adds r0, r5, #0
	bl sub_08027698
	b _080272CA
	.align 2, 0
_08027224: .4byte sub_0802474C
_08027228:
	ldr r1, _08027234 @ =sub_0802465C
	adds r0, r5, #0
	bl sub_08027CF8
	b _080272CA
	.align 2, 0
_08027234: .4byte sub_0802465C
_08027238:
	ldr r1, _0802723C @ =sub_08024858
	b _0802724A
	.align 2, 0
_0802723C: .4byte sub_08024858
_08027240:
	ldr r1, _08027244 @ =sub_08024880
	b _0802724A
	.align 2, 0
_08027244: .4byte sub_08024880
_08027248:
	ldr r1, _08027254 @ =sub_080248A8
_0802724A:
	adds r0, r5, #0
	bl sub_08027DD0
	b _080272CA
	.align 2, 0
_08027254: .4byte sub_080248A8
_08027258:
	adds r0, r5, #0
	bl sub_08027D64
	b _080272CA
_08027260:
	ldr r1, _08027268 @ =sub_0802493C
	movs r2, #0xe6
	lsls r2, r2, #3
	b _08027298
	.align 2, 0
_08027268: .4byte sub_0802493C
_0802726C:
	adds r0, r5, #0
	bl sub_080279B8
	b _080272CA
_08027274:
	adds r0, r5, #0
	bl sub_08027AE8
	b _080272CA
_0802727C:
	adds r0, r5, #0
	bl sub_0802764C
	b _080272CA
_08027284:
	ldr r1, _0802728C @ =sub_08024B64
	ldr r2, _08027290 @ =0x00000732
	b _08027298
	.align 2, 0
_0802728C: .4byte sub_08024B64
_08027290: .4byte 0x00000732
_08027294:
	ldr r1, _080272A0 @ =sub_08024BF0
	ldr r2, _080272A4 @ =0x00000733
_08027298:
	adds r0, r5, #0
	bl sub_08027A30
	b _080272CA
	.align 2, 0
_080272A0: .4byte sub_08024BF0
_080272A4: .4byte 0x00000733
_080272A8:
	adds r0, r5, #0
	bl sub_08028010
	b _080272CA
_080272B0:
	ldr r1, _080272BC @ =sub_08024C54
	ldr r2, _080272C0 @ =0x00000734
	adds r0, r5, #0
	bl sub_080276D8
	b _080272CA
	.align 2, 0
_080272BC: .4byte sub_08024C54
_080272C0: .4byte 0x00000734
_080272C4:
	adds r0, r5, #0
	bl sub_08027674
_080272CA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080272D0
sub_080272D0: @ 0x080272D0
	push {lr}
	bl _call_via_r1
	bl CountTargets
	cmp r0, #0
	beq _080272E0
	movs r0, #1
_080272E0:
	pop {r1}
	bx r1

	thumb_func_start sub_080272E4
sub_080272E4: @ 0x080272E4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_08018A70
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r5, r0
	beq _080272FC
	movs r0, #1
	b _080272FE
_080272FC:
	movs r0, #0
_080272FE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08027304
sub_08027304: @ 0x08027304
	movs r0, #0
	bx lr

	thumb_func_start sub_08027308
sub_08027308: @ 0x08027308
	adds r0, #0x31
	movs r1, #0xf0
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0x70
	beq _08027318
	movs r0, #1
	b _0802731A
_08027318:
	movs r0, #0
_0802731A:
	bx lr

	thumb_func_start sub_0802731C
sub_0802731C: @ 0x0802731C
	adds r1, r0, #0
	ldr r0, _08027338 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0802733C
	adds r1, #0x31
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _0802733C
	movs r0, #1
	b _0802733E
	.align 2, 0
_08027338: .4byte 0x0202BBF8
_0802733C:
	movs r0, #0
_0802733E:
	bx lr

	thumb_func_start sub_08027340
sub_08027340: @ 0x08027340
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	bne _08027350
	movs r0, #1
	b _08027352
_08027350:
	movs r0, #0
_08027352:
	bx lr

	thumb_func_start sub_08027354
sub_08027354: @ 0x08027354
	push {lr}
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r1, _08027384 @ =0x0202E3E0
	ldr r2, [r1]
	lsls r1, r3, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _08027388
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_08078EE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027388
	movs r0, #1
	b _0802738A
	.align 2, 0
_08027384: .4byte 0x0202E3E0
_08027388:
	movs r0, #0
_0802738A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027390
sub_08027390: @ 0x08027390
	push {lr}
	movs r1, #0x1e
	bl sub_08024298
	bl CountTargets
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_080273A4
sub_080273A4: @ 0x080273A4
	push {lr}
	movs r1, #0x14
	bl sub_08024298
	bl CountTargets
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_080273B8
sub_080273B8: @ 0x080273B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080273F2
	adds r0, r4, #0
	bl sub_08027354
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080273F6
	adds r0, r4, #0
	bl sub_08027390
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080273F6
	adds r0, r4, #0
	bl sub_080273A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080273F6
_080273F2:
	movs r0, #0
	b _080273F8
_080273F6:
	movs r0, #1
_080273F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027400
sub_08027400: @ 0x08027400
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #9
	bgt _08027410
	b _0802756C
_08027410:
	adds r0, r1, #0
	bl GetItemIid
	subs r0, #0x63
	cmp r0, #0x33
	bls _0802741E
	b _08027556
_0802741E:
	lsls r0, r0, #2
	ldr r1, _08027428 @ =_0802742C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08027428: .4byte _0802742C
_0802742C: @ jump table
	.4byte _080274FC @ case 0
	.4byte _08027504 @ case 1
	.4byte _0802750C @ case 2
	.4byte _08027514 @ case 3
	.4byte _0802751C @ case 4
	.4byte _08027556 @ case 5
	.4byte _08027556 @ case 6
	.4byte _08027556 @ case 7
	.4byte _08027556 @ case 8
	.4byte _08027556 @ case 9
	.4byte _08027556 @ case 10
	.4byte _08027556 @ case 11
	.4byte _08027556 @ case 12
	.4byte _08027556 @ case 13
	.4byte _08027556 @ case 14
	.4byte _08027556 @ case 15
	.4byte _08027556 @ case 16
	.4byte _08027556 @ case 17
	.4byte _08027556 @ case 18
	.4byte _08027556 @ case 19
	.4byte _08027556 @ case 20
	.4byte _08027556 @ case 21
	.4byte _08027556 @ case 22
	.4byte _08027556 @ case 23
	.4byte _08027556 @ case 24
	.4byte _08027556 @ case 25
	.4byte _08027556 @ case 26
	.4byte _08027556 @ case 27
	.4byte _08027556 @ case 28
	.4byte _08027556 @ case 29
	.4byte _08027556 @ case 30
	.4byte _08027556 @ case 31
	.4byte _08027556 @ case 32
	.4byte _08027556 @ case 33
	.4byte _08027556 @ case 34
	.4byte _08027556 @ case 35
	.4byte _08027524 @ case 36
	.4byte _08027556 @ case 37
	.4byte _0802752C @ case 38
	.4byte _08027556 @ case 39
	.4byte _08027548 @ case 40
	.4byte _08027556 @ case 41
	.4byte _08027556 @ case 42
	.4byte _08027556 @ case 43
	.4byte _08027556 @ case 44
	.4byte _08027556 @ case 45
	.4byte _08027556 @ case 46
	.4byte _08027556 @ case 47
	.4byte _08027556 @ case 48
	.4byte _08027556 @ case 49
	.4byte _08027556 @ case 50
	.4byte _08027554 @ case 51
_080274FC:
	ldr r4, _08027500 @ =0x08C97EDD
	b _08027556
	.align 2, 0
_08027500: .4byte 0x08C97EDD
_08027504:
	ldr r4, _08027508 @ =0x08C97EE3
	b _08027556
	.align 2, 0
_08027508: .4byte 0x08C97EE3
_0802750C:
	ldr r4, _08027510 @ =0x08C97EE8
	b _08027556
	.align 2, 0
_08027510: .4byte 0x08C97EE8
_08027514:
	ldr r4, _08027518 @ =0x08C97EED
	b _08027556
	.align 2, 0
_08027518: .4byte 0x08C97EED
_0802751C:
	ldr r4, _08027520 @ =0x08C97EF1
	b _08027556
	.align 2, 0
_08027520: .4byte 0x08C97EF1
_08027524:
	ldr r4, _08027528 @ =0x08C97EFD
	b _08027556
	.align 2, 0
_08027528: .4byte 0x08C97EFD
_0802752C:
	ldr r0, _0802753C @ =0x0202BBF8
	ldr r4, _08027540 @ =0x08C97F16
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08027556
	ldr r4, _08027544 @ =0x08C97F21
	b _08027556
	.align 2, 0
_0802753C: .4byte 0x0202BBF8
_08027540: .4byte 0x08C97F16
_08027544: .4byte 0x08C97F21
_08027548:
	ldr r4, _0802754C @ =0x08C97F29
	b _08027556
	.align 2, 0
_0802754C: .4byte 0x08C97F29
_08027550:
	movs r0, #1
	b _0802756E
_08027554:
	ldr r4, _08027574 @ =0x08C97F24
_08027556:
	ldrb r1, [r4]
	cmp r1, #0
	beq _0802756C
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
_08027560:
	cmp r0, r1
	beq _08027550
	adds r4, #1
	ldrb r1, [r4]
	cmp r1, #0
	bne _08027560
_0802756C:
	movs r0, #0
_0802756E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08027574: .4byte 0x08C97F24

	thumb_func_start CanUnitUseStatGainItem
CanUnitUseStatGainItem: @ 0x08027578
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl GetItemBonuses
	adds r4, r0, #0
	ldr r6, _08027648 @ =0x03004440
	adds r0, r6, #0
	bl ClearUnit
	ldr r0, [r5]
	str r0, [r6]
	ldr r0, [r5, #4]
	str r0, [r6, #4]
	ldrb r1, [r5, #0x12]
	ldrb r2, [r4]
	adds r0, r1, r2
	strb r0, [r6, #0x12]
	ldrb r1, [r5, #0x14]
	ldrb r2, [r4, #1]
	adds r0, r1, r2
	strb r0, [r6, #0x14]
	ldrb r1, [r5, #0x15]
	ldrb r2, [r4, #2]
	adds r0, r1, r2
	strb r0, [r6, #0x15]
	ldrb r1, [r5, #0x16]
	ldrb r2, [r4, #3]
	adds r0, r1, r2
	strb r0, [r6, #0x16]
	ldrb r1, [r5, #0x17]
	ldrb r2, [r4, #4]
	adds r0, r1, r2
	strb r0, [r6, #0x17]
	ldrb r1, [r5, #0x18]
	ldrb r2, [r4, #5]
	adds r0, r1, r2
	strb r0, [r6, #0x18]
	ldrb r1, [r5, #0x19]
	ldrb r2, [r4, #6]
	adds r0, r1, r2
	strb r0, [r6, #0x19]
	ldrb r1, [r5, #0x1d]
	ldrb r2, [r4, #7]
	adds r0, r1, r2
	strb r0, [r6, #0x1d]
	ldrb r1, [r5, #0x1a]
	ldrb r4, [r4, #8]
	adds r0, r1, r4
	strb r0, [r6, #0x1a]
	adds r0, r6, #0
	bl UnitCheckStatOverflow
	movs r1, #0x12
	ldrsb r1, [r6, r1]
	movs r0, #0x12
	ldrsb r0, [r5, r0]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	ldrb r2, [r6, #0x14]
	ldrb r1, [r5, #0x14]
	cmp r2, r1
	beq _080275FC
	movs r0, #1
_080275FC:
	ldrb r2, [r6, #0x15]
	ldrb r1, [r5, #0x15]
	cmp r2, r1
	beq _08027606
	movs r0, #1
_08027606:
	ldrb r2, [r6, #0x16]
	ldrb r1, [r5, #0x16]
	cmp r2, r1
	beq _08027610
	movs r0, #1
_08027610:
	ldrb r2, [r6, #0x17]
	ldrb r1, [r5, #0x17]
	cmp r2, r1
	beq _0802761A
	movs r0, #1
_0802761A:
	ldrb r2, [r6, #0x18]
	ldrb r1, [r5, #0x18]
	cmp r2, r1
	beq _08027624
	movs r0, #1
_08027624:
	ldrb r2, [r6, #0x19]
	ldrb r1, [r5, #0x19]
	cmp r2, r1
	beq _0802762E
	movs r0, #1
_0802762E:
	ldrb r2, [r6, #0x1d]
	ldrb r1, [r5, #0x1d]
	cmp r2, r1
	beq _08027638
	movs r0, #1
_08027638:
	ldrb r6, [r6, #0x1a]
	ldrb r5, [r5, #0x1a]
	cmp r6, r5
	beq _08027642
	movs r0, #1
_08027642:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027648: .4byte 0x03004440

	thumb_func_start sub_0802764C
sub_0802764C: @ 0x0802764C
	push {lr}
	bl sub_0801D2D4
	ldr r0, _0802766C @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r1, _08027670 @ =0x0203A85C
	movs r0, #3
	strb r0, [r1, #0x11]
	pop {r0}
	bx r0
	.align 2, 0
_0802766C: .4byte 0x02023C60
_08027670: .4byte 0x0203A85C

	thumb_func_start sub_08027674
sub_08027674: @ 0x08027674
	ldr r1, _0802767C @ =0x0203A85C
	movs r0, #0x17
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_0802767C: .4byte 0x0203A85C

	thumb_func_start sub_08027680
sub_08027680: @ 0x08027680
	push {lr}
	ldr r2, _08027694 @ =0x0203A85C
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0
	bl sub_0802764C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08027694: .4byte 0x0203A85C

	thumb_func_start sub_08027698
sub_08027698: @ 0x08027698
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _080276C8 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _080276CC @ =0x08B95BD8
	ldr r1, _080276D0 @ =sub_08027680
	bl sub_0804AEF0
	adds r4, r0, #0
	ldr r0, _080276D4 @ =0x0000072C
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080276C8: .4byte 0x0202E3E4
_080276CC: .4byte 0x08B95BD8
_080276D0: .4byte sub_08027680
_080276D4: .4byte 0x0000072C

	thumb_func_start sub_080276D8
sub_080276D8: @ 0x080276D8
	push {r4, r5, lr}
	adds r5, r2, #0
	bl _call_via_r1
	ldr r0, _0802770C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08027710 @ =0x08B95BD8
	ldr r1, _08027714 @ =sub_08027680
	bl sub_0804AEF0
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802770C: .4byte 0x0202E3E4
_08027710: .4byte 0x08B95BD8
_08027714: .4byte sub_08027680

	thumb_func_start sub_08027718
sub_08027718: @ 0x08027718
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r0, _080277B8 @ =0x00000725
	bl GetMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_08032560
	ldr r5, _080277BC @ =0x0203A85C
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r4, #0
	bl CameraMoveWatchPosition
	bl sub_0801D2D4
	ldr r0, _080277C0 @ =0x03004690
	ldr r4, [r0]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_0801DBC4
	ldr r1, _080277C4 @ =0x0202BBB8
	movs r0, #0xfd
	ldrb r2, [r1, #4]
	ands r0, r2
	movs r2, #0
	mov r8, r2
	strb r0, [r1, #4]
	movs r0, #1
	bl sub_0801D2A0
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl SetMapCursorPosition
	ldr r0, _080277C8 @ =0x08196228
	movs r1, #0
	bl sub_08011FC4
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl sub_0801225C
	str r4, [r6, #0x54]
	adds r6, #0x4a
	movs r0, #2
	strh r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080277B8: .4byte 0x00000725
_080277BC: .4byte 0x0203A85C
_080277C0: .4byte 0x03004690
_080277C4: .4byte 0x0202BBB8
_080277C8: .4byte 0x08196228

	thumb_func_start sub_080277CC
sub_080277CC: @ 0x080277CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08027844 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r1, _08027848 @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r6, r0, #0x1f
	bl HandlePlayerMapCursor
	ldr r0, _0802784C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08027878
	cmp r6, #0
	beq _08027864
	adds r0, r5, #0
	bl Proc_Break
	ldr r1, _08027850 @ =0x0203A85C
	ldrh r0, [r4, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r4, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _08027854 @ =0x03004690
	ldr r0, [r0]
	bl sub_0802764C
	ldr r0, _08027858 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0802785C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080278F0
	ldr r0, _08027860 @ =0x0000038A
	bl sub_080BE594
	b _080278F0
	.align 2, 0
_08027844: .4byte 0x0202BBB8
_08027848: .4byte 0x0202E3E4
_0802784C: .4byte 0x08B857F8
_08027850: .4byte 0x0203A85C
_08027854: .4byte 0x03004690
_08027858: .4byte 0x02023C60
_0802785C: .4byte 0x0202BBF8
_08027860: .4byte 0x0000038A
_08027864:
	ldr r0, _080278F8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027878
	movs r0, #0xe3
	lsls r0, r0, #2
	bl sub_080BE594
_08027878:
	ldr r0, _080278FC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080278AE
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08027900 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _080278F8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080278AE
	ldr r0, _08027904 @ =0x0000038B
	bl sub_080BE594
_080278AE:
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r1, r5, #0
	adds r1, #0x4a
	movs r4, #0
	ldrsh r2, [r1, r4]
	adds r4, r0, #0
	adds r6, r1, #0
	cmp r3, r2
	beq _080278D0
	ldr r0, [r5, #0x54]
	movs r1, #0
	cmp r3, #0
	bne _080278CC
	movs r1, #1
_080278CC:
	bl sub_0801225C
_080278D0:
	ldr r0, [r5, #0x54]
	ldr r3, _08027908 @ =0x0202BBB8
	movs r5, #0x20
	ldrsh r1, [r3, r5]
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	movs r5, #0x22
	ldrsh r2, [r3, r5]
	movs r5, #0xe
	ldrsh r3, [r3, r5]
	subs r2, r2, r3
	bl sub_08012000
	asrs r0, r4, #0x18
	strh r0, [r6]
_080278F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080278F8: .4byte 0x0202BBF8
_080278FC: .4byte 0x08B857F8
_08027900: .4byte 0x02023C60
_08027904: .4byte 0x0000038B
_08027908: .4byte 0x0202BBB8

	thumb_func_start sub_0802790C
sub_0802790C: @ 0x0802790C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ResetTextFont
	bl sub_0801D2D4
	bl sub_0803279C
	ldr r4, _08027944 @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl CameraMoveWatchPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027944: .4byte 0x03004690

	thumb_func_start sub_08027948
sub_08027948: @ 0x08027948
	push {lr}
	bl ResetTextFont
	bl sub_0801D2D4
	bl sub_0803279C
	ldr r0, _08027974 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	ldr r0, _08027978 @ =0x08B93DDC
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_08027974: .4byte 0x03004690
_08027978: .4byte 0x08B93DDC

	thumb_func_start sub_0802797C
sub_0802797C: @ 0x0802797C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0801D2D4
	ldr r0, [r4, #0x54]
	bl sub_08011FEC
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08027990
sub_08027990: @ 0x08027990
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0804AF00
	ldr r1, _080279B0 @ =0x0203A85C
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xd]
	ldr r0, _080279B4 @ =0x08B94194
	movs r1, #3
	bl SpawnProc
	movs r0, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080279B0: .4byte 0x0203A85C
_080279B4: .4byte 0x08B94194

	thumb_func_start sub_080279B8
sub_080279B8: @ 0x080279B8
	push {r4, lr}
	bl sub_08024908
	ldr r0, _080279FC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08027A00 @ =0x08B95BD8
	ldr r1, _08027A04 @ =sub_08027990
	bl sub_0804AEF0
	adds r4, r0, #0
	ldr r0, _08027A08 @ =0x0000072B
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	ldr r0, _08027A0C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080279F4
	ldr r0, _08027A10 @ =0x0000038A
	bl sub_080BE594
_080279F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080279FC: .4byte 0x0202E3E4
_08027A00: .4byte 0x08B95BD8
_08027A04: .4byte sub_08027990
_08027A08: .4byte 0x0000072B
_08027A0C: .4byte 0x0202BBF8
_08027A10: .4byte 0x0000038A

	thumb_func_start sub_08027A14
sub_08027A14: @ 0x08027A14
	push {lr}
	ldr r2, _08027A2C @ =0x0203A85C
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0
	bl sub_0802764C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08027A2C: .4byte 0x0203A85C

	thumb_func_start sub_08027A30
sub_08027A30: @ 0x08027A30
	push {r4, r5, lr}
	adds r5, r2, #0
	bl _call_via_r1
	ldr r0, _08027A74 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08027A78 @ =0x08B95BB8
	ldr r1, _08027A7C @ =sub_08027A14
	bl sub_0804AEF0
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	ldr r0, _08027A80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027A6E
	ldr r0, _08027A84 @ =0x0000038A
	bl sub_080BE594
_08027A6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027A74: .4byte 0x0202E3E4
_08027A78: .4byte 0x08B95BB8
_08027A7C: .4byte sub_08027A14
_08027A80: .4byte 0x0202BBF8
_08027A84: .4byte 0x0000038A

	thumb_func_start sub_08027A88
sub_08027A88: @ 0x08027A88
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	bl ResetTextFont
	ldr r5, _08027AE0 @ =0x0203A85C
	ldrb r0, [r4, #2]
	strb r0, [r5, #0xd]
	ldr r0, _08027AE4 @ =0x08B958FC
	bl StartMenu
	adds r4, r0, #0
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x10
	movs r3, #0xb
	bl StartEquipInfoWindow
	ldrb r0, [r5, #0xd]
	bl GetUnit
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb8
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl sub_08007A64
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08027AE0: .4byte 0x0203A85C
_08027AE4: .4byte 0x08B958FC

	thumb_func_start sub_08027AE8
sub_08027AE8: @ 0x08027AE8
	push {r4, lr}
	bl sub_080249C8
	ldr r0, _08027B28 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08027B2C @ =0x08B95C58
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027B30 @ =0x0000072E
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	ldr r0, _08027B34 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027B22
	ldr r0, _08027B38 @ =0x0000038A
	bl sub_080BE594
_08027B22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027B28: .4byte 0x0202E3E4
_08027B2C: .4byte 0x08B95C58
_08027B30: .4byte 0x0000072E
_08027B34: .4byte 0x0202BBF8
_08027B38: .4byte 0x0000038A

	thumb_func_start sub_08027B3C
sub_08027B3C: @ 0x08027B3C
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08031CBC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027B60
sub_08027B60: @ 0x08027B60
	push {lr}
	bl sub_08031A74
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08027B6C
sub_08027B6C: @ 0x08027B6C
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_0801DFC0
	pop {r1}
	bx r1

	thumb_func_start sub_08027B7C
sub_08027B7C: @ 0x08027B7C
	bx lr
	.align 2, 0

	thumb_func_start sub_08027B80
sub_08027B80: @ 0x08027B80
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _08027B9C @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08027BA0
	movs r0, #3
	b _08027BB0
	.align 2, 0
_08027B9C: .4byte 0x0203A85C
_08027BA0:
	bl IsItemRepairable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027BAE
	movs r0, #1
	b _08027BB0
_08027BAE:
	movs r0, #2
_08027BB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027BB8
sub_08027BB8: @ 0x08027BB8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08027C0C @ =0x0203A85C
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
	bl IsItemRepairable
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
	ldr r1, _08027C10 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r4, #0
	bl sub_0801650C
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027C0C: .4byte 0x0203A85C
_08027C10: .4byte 0x02022C60

	thumb_func_start sub_08027C14
sub_08027C14: @ 0x08027C14
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08027C9A
	movs r6, #0
	ldr r0, _08027C54 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r4, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0xc1
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08027C5C
	ldr r6, _08027C58 @ =0x0000074C
	b _08027C8E
	.align 2, 0
_08027C54: .4byte 0x0203A85C
_08027C58: .4byte 0x0000074C
_08027C5C:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	bne _08027C74
	ldr r6, _08027C70 @ =0x00000741
	b _08027C8E
	.align 2, 0
_08027C70: .4byte 0x00000741
_08027C74:
	adds r0, r5, #0
	bl GetItemUses
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemMaxUses
	cmp r4, r0
	bne _08027C8A
	movs r6, #0xe8
	lsls r6, r6, #3
_08027C8A:
	cmp r6, #0
	beq _08027C96
_08027C8E:
	adds r0, r7, #0
	adds r1, r6, #0
	bl MenuFrozenHelpBox
_08027C96:
	movs r0, #8
	b _08027CAE
_08027C9A:
	ldr r1, _08027CB4 @ =0x0203A85C
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x15]
	ldr r0, _08027CB8 @ =0x03004690
	ldr r0, [r0]
	bl sub_0802764C
	movs r0, #0x37
_08027CAE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08027CB4: .4byte 0x0203A85C
_08027CB8: .4byte 0x03004690

	thumb_func_start sub_08027CBC
sub_08027CBC: @ 0x08027CBC
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027CEC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08027CF0 @ =0x08B95B78
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027CF4 @ =0x0000072A
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027CEC: .4byte 0x0202E3E4
_08027CF0: .4byte 0x08B95B78
_08027CF4: .4byte 0x0000072A

	thumb_func_start sub_08027CF8
sub_08027CF8: @ 0x08027CF8
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027D28 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08027D2C @ =0x08B95B58
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027D30 @ =0x0000072D
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027D28: .4byte 0x0202E3E4
_08027D2C: .4byte 0x08B95B58
_08027D30: .4byte 0x0000072D

	thumb_func_start sub_08027D34
sub_08027D34: @ 0x08027D34
	push {lr}
	bl sub_08031E5C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027D40
sub_08027D40: @ 0x08027D40
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08031E7C
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027D64
sub_08027D64: @ 0x08027D64
	push {r4, lr}
	bl sub_080246E0
	ldr r0, _08027D94 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08027D98 @ =0x08B95B38
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027D9C @ =0x0000072F
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027D94: .4byte 0x0202E3E4
_08027D98: .4byte 0x08B95B38
_08027D9C: .4byte 0x0000072F

	thumb_func_start sub_08027DA0
sub_08027DA0: @ 0x08027DA0
	push {lr}
	bl sub_08031EF0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027DAC
sub_08027DAC: @ 0x08027DAC
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08031F04
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027DD0
sub_08027DD0: @ 0x08027DD0
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027E00 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapFill
	ldr r0, _08027E04 @ =0x08B95B18
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027E08 @ =0x00000731
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027E00: .4byte 0x0202E3E4
_08027E04: .4byte 0x08B95B18
_08027E08: .4byte 0x00000731

	thumb_func_start sub_08027E0C
sub_08027E0C: @ 0x08027E0C
	push {lr}
	bl sub_08031F5C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027E18
sub_08027E18: @ 0x08027E18
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_0801EC10
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _08027E54 @ =0x03004690
	ldr r5, [r0]
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetOffensiveStaffAccuracy
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_08031F7C
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027E54: .4byte 0x03004690

	thumb_func_start sub_08027E58
sub_08027E58: @ 0x08027E58
	push {lr}
	bl sub_0803279C
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08027E68
sub_08027E68: @ 0x08027E68
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08027E94
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_0802BA70
	cmp r0, #0
	bne _08027E94
	movs r0, #1
	b _08027E96
_08027E94:
	movs r0, #0
_08027E96:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027E9C
sub_08027E9C: @ 0x08027E9C
	push {r4, lr}
	ldr r0, _08027EBC @ =0x08B95BD8
	ldr r1, _08027EC0 @ =sub_08027680
	bl sub_0804AEF0
	adds r4, r0, #0
	ldr r0, _08027EC4 @ =0x0000072C
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032560
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027EBC: .4byte 0x08B95BD8
_08027EC0: .4byte sub_08027680
_08027EC4: .4byte 0x0000072C

