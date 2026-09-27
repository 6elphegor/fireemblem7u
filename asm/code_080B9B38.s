	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9B38
sub_080B9B38: @ 0x080B9B38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [r5, #0x30]
	str r0, [r5, #0x2c]
	bl UnpackUiWindowFrameGraphics
	ldr r0, _080B9C14 @ =0x02023460
	ldr r1, _080B9C18 @ =0x085E0024
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _080B9C1C @ =0x085DE54C
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B9C20 @ =0x085DE58C
	ldr r1, _080B9C24 @ =0x06011000
	bl Decompress
	movs r4, #0
	movs r0, #0xa
	add r0, sp
	mov sb, r0
	add r1, sp, #0xc
	mov sl, r1
_080B9B7C:
	adds r1, r4, #0
	adds r1, #0x1a
	lsls r1, r1, #5
	ldr r0, _080B9C28 @ =0x085DFA70
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080B9B7C
	ldr r0, _080B9C2C @ =0x085DFAF0
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9C30 @ =0x085DFA90
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9C34 @ =0x085DFAB0
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0xf
	bl EnableBgSync
	ldr r4, _080B9C38 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r6, [r4, #0x14]
	ands r0, r6
	cmp r0, #0
	beq _080B9C3C
	bl GetGameTime
	ldr r1, [r4, #4]
	subs r0, r0, r1
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl sub_080B66B4
	adds r6, r5, #0
	adds r6, #0x3a
	strb r0, [r6]
	bl sub_080B6734
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	bl GetChapterCombatRank
	adds r2, r5, #0
	adds r2, #0x3c
	strb r0, [r2]
	ldrb r0, [r6]
	ldrb r1, [r4]
	ldrb r2, [r2]
	bl sub_080B663C
	adds r1, r5, #0
	adds r1, #0x3d
	strb r0, [r1]
	movs r0, #0x29
	movs r1, #0
	bl StartBgm
	b _080B9CA2
	.align 2, 0
_080B9C14: .4byte 0x02023460
_080B9C18: .4byte 0x085E0024
_080B9C1C: .4byte 0x085DE54C
_080B9C20: .4byte 0x085DE58C
_080B9C24: .4byte 0x06011000
_080B9C28: .4byte 0x085DFA70
_080B9C2C: .4byte 0x085DFAF0
_080B9C30: .4byte 0x085DFA90
_080B9C34: .4byte 0x085DFAB0
_080B9C38: .4byte 0x0202BBF8
_080B9C3C:
	bl GetGameTotalTime_unused
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl GetGameTacticsRank
	movs r7, #0x3a
	adds r7, r7, r5
	mov r8, r7
	strb r0, [r7]
	bl GetGameSurvivalRank
	adds r7, r5, #0
	adds r7, #0x3b
	strb r0, [r7]
	bl GetGameFundsRank
	adds r4, r5, #0
	adds r4, #0x3c
	strb r0, [r4]
	bl GetGameExpRank
	adds r6, r5, #0
	adds r6, #0x3d
	strb r0, [r6]
	bl GetGameCombatRank
	movs r1, #0x3e
	adds r1, r1, r5
	mov ip, r1
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r7]
	ldrb r2, [r4]
	ldrb r3, [r6]
	mov r6, ip
	ldrb r4, [r6]
	str r4, [sp]
	bl GetOverallRank
	adds r1, r5, #0
	adds r1, #0x3f
	strb r0, [r1]
	movs r0, #0x29
	movs r1, #0
	bl StartBgm
_080B9CA2:
	ldr r4, _080B9D48 @ =0x020230A0
	adds r0, r4, #0
	adds r0, #0xa
	add r1, sp, #8
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #2
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x10
	mov r7, sb
	ldrh r2, [r7]
	movs r1, #2
	bl PutNumber2Digit
	adds r0, r4, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x16
	mov r1, sl
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber2Digit
	movs r4, #0
	adds r3, r5, #0
	adds r3, #0x4c
	movs r6, #0
	mov r8, r6
	movs r7, #0
	mov sb, r7
	adds r2, r5, #0
	adds r2, #0x46
	movs r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_080B9CFE:
	lsls r0, r4, #1
	adds r0, r3, r0
	mov r7, sb
	strh r7, [r0]
	adds r0, r2, r4
	strb r6, [r0]
	adds r0, r1, r4
	mov r7, r8
	strb r7, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _080B9CFE
	ldr r0, _080B9D4C @ =sub_080B96FC
	adds r1, r5, #0
	bl StartParallelWorker
	ldr r0, _080B9D50 @ =0x085DFAB0
	adds r1, r0, #0
	adds r1, #0x20
	movs r2, #1
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #2
	movs r3, #0x17
	bl StartMixPalette
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9D48: .4byte 0x020230A0
_080B9D4C: .4byte sub_080B96FC
_080B9D50: .4byte 0x085DFAB0
