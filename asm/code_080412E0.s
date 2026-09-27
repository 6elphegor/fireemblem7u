	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080412E0
sub_080412E0: @ 0x080412E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x5c]
	add r5, sp, #0x50
	ldr r1, _080413BC @ =0x081D5394
	adds r0, r5, #0
	movs r2, #6
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _080413C0 @ =0x081C5BE0
	ldr r1, _080413C4 @ =0x06014800
	bl Decompress
	movs r0, #0
	movs r1, #4
	bl sub_08047BD4
	ldr r0, _080413C8 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl StartLinkArenaButtonSpriteDraw
	ldr r4, _080413CC @ =0x0203DC08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	ldr r0, _080413D0 @ =0x000003CA
	movs r1, #0
	bl PutSioText
	ldr r0, _080413D4 @ =0x000003CB
	movs r1, #1
	bl PutSioText
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x4c]
	movs r1, #2
	mov sb, r1
	mov r2, sp
	adds r2, #0x58
	str r2, [sp, #0x60]
	movs r6, #8
	mov r4, sp
	adds r4, #0x5a
	adds r5, r7, #0
	adds r5, #0x40
_0804136C:
	movs r0, #0
	strb r0, [r4]
	mov r0, sb
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804143E
	mov r0, sb
	add r1, sp, #8
	bl ReadGameSavePlaySt
	add r0, sp, #8
	bl GetChapterTitle
	adds r2, r7, #0
	adds r2, #0x2c
	adds r1, r2, r6
	str r0, [r1]
	add r1, sp, #8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq _080413A8
	movs r0, #4
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
_080413A8:
	add r0, sp, #8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080413E2
	cmp r0, #2
	bgt _080413D8
	cmp r0, #1
	beq _080413DE
	b _080413F2
	.align 2, 0
_080413BC: .4byte 0x081D5394
_080413C0: .4byte 0x081C5BE0
_080413C4: .4byte 0x06014800
_080413C8: .4byte 0x0203DA60
_080413CC: .4byte 0x0203DC08
_080413D0: .4byte 0x000003CA
_080413D4: .4byte 0x000003CB
_080413D8:
	cmp r0, #3
	beq _080413EA
	b _080413F2
_080413DE:
	movs r0, #0x10
	b _080413EC
_080413E2:
	movs r0, #0x20
	ldrb r1, [r4]
	orrs r0, r1
	b _080413F0
_080413EA:
	movs r0, #0x40
_080413EC:
	ldrb r2, [r4]
	orrs r0, r2
_080413F0:
	strb r0, [r4]
_080413F2:
	add r0, sp, #8
	bl sub_080A0A10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804140E
	mov r1, sl
	adds r0, r1, r6
	ldr r0, [r0]
	str r0, [r5]
	movs r2, #0x38
	adds r2, r2, r7
	mov r8, r2
	b _0804141A
_0804140E:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5]
	movs r1, #0x38
	adds r1, r1, r7
	mov r8, r1
_0804141A:
	mov r2, r8
	adds r0, r2, r6
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08041454
	ldr r2, [sp, #0x5c]
	cmp r2, #0
	bne _08041438
	mov r0, sb
	str r0, [r7, #0x50]
	movs r1, #1
	str r1, [sp, #0x5c]
	b _08041454
_08041438:
	mov r2, sb
	str r2, [r7, #0x4c]
	b _08041454
_0804143E:
	adds r1, r7, #0
	adds r1, #0x2c
	adds r0, r1, r6
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r5]
	str r2, [r0]
	mov sl, r1
	movs r0, #0x38
	adds r0, r0, r7
	mov r8, r0
_08041454:
	subs r5, #4
	subs r6, #4
	subs r4, #1
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	cmp r2, #0
	bge _0804136C
	adds r0, r1, #0
	ldr r1, [r7, #0x4c]
	cmp r1, r0
	bne _08041476
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x4c]
	str r0, [r7, #0x48]
	b _08041478
_08041476:
	str r1, [r7, #0x48]
_08041478:
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl SetBgOffset
	movs r0, #0xd0
	lsls r0, r0, #1
	bl PutChapterTitleBG
	movs r0, #0
	mov sb, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	str r1, [sp, #0x64]
	mov r2, sl
	str r2, [sp, #0x68]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #0x6c]
	ldr r6, [sp, #0x60]
	movs r1, #0
	str r1, [sp, #0x70]
	movs r2, #0x88
	lsls r2, r2, #7
	mov sl, r2
_080414AA:
	ldr r0, [sp, #0x70]
	add r0, r8
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080414C0
	movs r0, #2
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
_080414C0:
	movs r0, #1
	ldrb r2, [r6]
	orrs r0, r2
	mov r4, sb
	adds r4, #4
	adds r1, r4, #0
	bl PutChapterTitlePalette
	ldrb r0, [r6]
	mov r5, sb
	adds r5, #7
	adds r1, r5, #0
	bl PutChapterTitlePalette
	ldr r0, _08041574 @ =0x02023464
	ldr r1, [sp, #0x6c]
	adds r0, r1, r0
	adds r1, r4, #0
	bl PutChapterTitleBgTsa
	mov r2, sl
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	ldr r2, [sp, #0x68]
	ldm r2!, {r1}
	str r2, [sp, #0x68]
	bl PutChapterTitleGfx
	ldr r0, _08041578 @ =0x02022C66
	ldr r1, [sp, #0x64]
	adds r0, r1, r0
	adds r1, r5, #0
	bl PutChapterTitleNameTsa
	ldr r2, [sp, #0x64]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	str r2, [sp, #0x64]
	ldr r1, [sp, #0x6c]
	adds r1, r1, r0
	str r1, [sp, #0x6c]
	adds r6, #1
	ldr r2, [sp, #0x70]
	adds r2, #4
	str r2, [sp, #0x70]
	movs r0, #0x80
	lsls r0, r0, #4
	add sl, r0
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #2
	ble _080414AA
	ldr r2, _0804157C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r7, #0
	movs r1, #1
	bl sub_08047D80
	ldr r0, _08041580 @ =0x0203D90C
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #0x50
	movs r1, #6
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041574: .4byte 0x02023464
_08041578: .4byte 0x02022C66
_0804157C: .4byte 0x03002870
_08041580: .4byte 0x0203D90C
