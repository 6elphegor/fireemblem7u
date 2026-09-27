	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F2F8
sub_0803F2F8: @ 0x0803F2F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r1, _0803F370 @ =0x081D527E
	add r0, sp, #8
	movs r2, #0xa
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _0803F374 @ =0x081C5BE0
	ldr r1, _0803F378 @ =0x06014800
	bl Decompress
	ldr r0, _0803F37C @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0803F380 @ =0x081C8144
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	bl sub_08047BD4
	ldr r0, _0803F384 @ =0x02023E60
	ldr r1, _0803F388 @ =0x081C84CC
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _0803F38C @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0803F390
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #9
	b _0803F39A
	.align 2, 0
_0803F370: .4byte 0x081D527E
_0803F374: .4byte 0x081C5BE0
_0803F378: .4byte 0x06014800
_0803F37C: .4byte 0x081C7F04
_0803F380: .4byte 0x081C8144
_0803F384: .4byte 0x02023E60
_0803F388: .4byte 0x081C84CC
_0803F38C: .4byte 0x0203DA60
_0803F390:
	ldr r0, _0803F4F0 @ =0x0203D90C
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #7
_0803F39A:
	strb r0, [r1]
	movs r4, #0
	adds r5, r1, #0
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0x38
	adds r2, r2, r6
	mov r8, r2
	ldr r3, _0803F4F4 @ =0x0203DC18
	mov ip, r3
	adds r7, r6, #0
	adds r7, #0x30
	movs r2, #0x39
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x31
	adds r3, r3, r6
	mov sl, r3
	adds r2, r6, #0
	adds r2, #0x32
	str r2, [sp, #0x20]
	cmp r4, r0
	bge _0803F3DA
	adds r2, #0xb
	movs r3, #0
_0803F3CC:
	adds r0, r2, r4
	strb r3, [r0]
	adds r4, #1
	ldrb r0, [r5]
	adds r0, #1
	cmp r4, r0
	blt _0803F3CC
_0803F3DA:
	movs r4, #0
	ldrb r3, [r1]
	cmp r4, r3
	bge _0803F3F4
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x48
_0803F3E8:
	strh r2, [r0]
	adds r0, #2
	adds r4, #1
	ldrb r3, [r1]
	cmp r4, r3
	blt _0803F3E8
_0803F3F4:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, ip
	movs r1, #8
	bl InitText
	movs r0, #2
	strb r0, [r7]
	movs r4, #0
	movs r0, #6
	strh r0, [r6, #0x34]
	bl GetTacticianTextConf
	ldrh r1, [r0, #0x30]
	subs r1, #4
	ldrh r2, [r0, #0x32]
	adds r2, #1
	adds r0, r6, #0
	bl StartNameEntrySpriteDraw
	str r0, [r6, #0x2c]
	mov r2, sb
	strb r4, [r2]
	ldr r5, _0803F4F8 @ =0x0203DA10
	movs r4, #9
_0803F428:
	adds r0, r5, #0
	movs r1, #0x1a
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803F428
	ldr r4, _0803F4FC @ =0x0203D998
	adds r0, r4, #0
	movs r1, #0xc
	bl InitText
	ldr r0, [r6, #0x2c]
	movs r1, #3
	bl sub_08047D80
	subs r4, #0x8c
	ldrb r0, [r4]
	str r0, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #0xa
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	ldr r1, _0803F500 @ =0x0203DC20
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	mov r3, sl
	strb r0, [r3]
	adds r0, r6, #0
	bl sub_0803F1A8
	ldr r1, [sp, #0x20]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F4DA
	movs r4, #0
	bl GetTacticianName
	adds r2, r0, #0
	ldrb r1, [r2]
	add r3, sp, #0x14
	mov ip, r3
	cmp r1, #0
	beq _0803F4BC
	adds r7, r6, #0
	adds r7, #0x3d
	mov sb, ip
	mov r5, r8
	adds r3, r6, #0
	adds r3, #0x33
_0803F498:
	adds r0, r7, r4
	strb r1, [r0]
	mov r0, sb
	adds r1, r0, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r4, #1
	ldrb r0, [r5]
	adds r0, #1
	ldrb r1, [r3]
	cmp r0, r1
	bge _0803F4B6
	mov r1, r8
	strb r0, [r1]
_0803F4B6:
	ldrb r1, [r2]
	cmp r1, #0
	bne _0803F498
_0803F4BC:
	adds r0, r6, #0
	mov r1, ip
	bl sub_0803F0F4
	adds r0, r6, #0
	bl TacticianDrawCharacters
	ldr r1, [r6, #0x2c]
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #3
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r0, r3
	str r0, [r1, #0x40]
_0803F4DA:
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F4F0: .4byte 0x0203D90C
_0803F4F4: .4byte 0x0203DC18
_0803F4F8: .4byte 0x0203DA10
_0803F4FC: .4byte 0x0203D998
_0803F500: .4byte 0x0203DC20
