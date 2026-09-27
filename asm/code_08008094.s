	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkFlag
SetTalkFlag: @ 0x08008094
	ldr r1, _080080A4 @ =0x08B909B8
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_080080A4: .4byte 0x08B909B8

	thumb_func_start SetTalkFunc
SetTalkFunc: @ 0x080080A8
	ldr r1, _080080B0 @ =0x08B909B8
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_080080B0: .4byte 0x08B909B8

	thumb_func_start ClearTalkFlag
ClearTalkFlag: @ 0x080080B4
	ldr r1, _080080C4 @ =0x08B909B8
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	bics r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080080C4: .4byte 0x08B909B8

	thumb_func_start CheckTalkFlag
CheckTalkFlag: @ 0x080080C8
	ldr r1, _080080D4 @ =0x08B909B8
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r1, [r1]
	ands r0, r1
	bx lr
	.align 2, 0
_080080D4: .4byte 0x08B909B8

	thumb_func_start SetTalkPrintDelay
SetTalkPrintDelay: @ 0x080080D8
	ldr r2, _080080F0 @ =0x08B909B8
	ldr r1, [r2]
	strb r0, [r1, #0x13]
	ldr r2, [r2]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080080EC
	movs r0, #0
	strb r0, [r2, #0x13]
_080080EC:
	bx lr
	.align 2, 0
_080080F0: .4byte 0x08B909B8

	thumb_func_start SetTalkPrintColor
SetTalkPrintColor: @ 0x080080F4
	push {r4, r5, r6, lr}
	ldr r2, _08008128 @ =0x08B909B8
	ldr r1, [r2]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08008120
	adds r6, r2, #0
	ldr r5, _0800812C @ =0x030000C8
_0800810A:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl Text_SetColor
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _0800810A
_08008120:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008128: .4byte 0x08B909B8
_0800812C: .4byte 0x030000C8

	thumb_func_start TalkSkipListener_OnIdle
TalkSkipListener_OnIdle: @ 0x08008130
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08008190 @ =0x08B90ACC
	bl Proc_Find
	cmp r0, #0
	bne _080081D2
	ldr r0, _08008194 @ =0x08B90B24
	bl Proc_Find
	cmp r0, #0
	bne _080081D2
	movs r0, #4
	bl CheckTalkFlag
	cmp r0, #0
	bne _080081A8
	ldr r0, _08008198 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080081A8
	bl sub_0800F08C
	ldr r0, _0800819C @ =0x08B909B8
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	adds r0, r4, #0
	bl Proc_End
	bl EndTalk
	ldr r0, _080081A0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080081A4 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	b _080081D2
	.align 2, 0
_08008190: .4byte 0x08B90ACC
_08008194: .4byte 0x08B90B24
_08008198: .4byte 0x08B857F8
_0800819C: .4byte 0x08B909B8
_080081A0: .4byte 0x02022C60
_080081A4: .4byte 0x02023460
_080081A8:
	ldr r0, _080081D8 @ =0x08B90A4C
	bl Proc_Find
	cmp r0, #0
	bne _080081D2
	movs r0, #8
	bl CheckTalkFlag
	cmp r0, #0
	bne _080081D2
	ldr r0, _080081DC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080081D2
	ldr r0, _080081E0 @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x12]
_080081D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080081D8: .4byte 0x08B90A4C
_080081DC: .4byte 0x08B857F8
_080081E0: .4byte 0x08B909B8

	thumb_func_start Talk_OnInit
Talk_OnInit: @ 0x080081E4
	push {lr}
	movs r0, #0x20
	bl CheckTalkFlag
	cmp r0, #0
	bne _08008208
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08008208:
	ldr r0, _08008214 @ =0x08B909BC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08008214: .4byte 0x08B909BC

	thumb_func_start sub_08008218
sub_08008218: @ 0x08008218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_08009020
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	beq _0800822E
	b _0800837E
_0800822E:
	ldr r2, _08008278 @ =0x08B909B8
	ldr r1, [r2]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08008252
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r2]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08008252
	b _0800837E
_08008252:
	ldr r0, [r2]
	strb r3, [r0, #0x14]
_08008256:
	ldr r7, _08008278 @ =0x08B909B8
	ldr r0, _0800827C @ =0x0202BC39
	mov r8, r0
_0800825C:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	adds r0, r6, #0
	bl TalkInterpret
	cmp r0, #1
	beq _080082B4
	cmp r0, #1
	bgt _08008280
	cmp r0, #0
	beq _0800828A
	b _080082B4
	.align 2, 0
_08008278: .4byte 0x08B909B8
_0800827C: .4byte 0x0202BC39
_08008280:
	cmp r0, #2
	beq _08008292
	cmp r0, #3
	beq _080082A6
	b _080082B4
_0800828A:
	adds r0, r6, #0
	bl Proc_Break
	b _0800837E
_08008292:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08008256
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08008368
	b _0800837E
_080082A6:
	ldr r0, [r7]
	ldrb r1, [r0, #0x13]
	movs r2, #0
	strb r1, [r0, #0x14]
	ldr r0, [r7]
	strb r2, [r0, #0x12]
	b _0800837E
_080082B4:
	movs r0, #0x20
	bl CheckTalkFlag
	cmp r0, #0
	bne _080082C6
	adds r0, r6, #0
	bl sub_0800838C
	b _080082CC
_080082C6:
	adds r0, r6, #0
	bl TalkSpritePrepNextChar
_080082CC:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800837E
	ldr r5, _0800831C @ =0x08B909B8
	ldr r4, [r5]
	ldrb r1, [r4, #0xb]
	ldrb r2, [r4, #9]
	adds r0, r1, r2
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008320 @ =0x030000C8
	adds r0, r0, r1
	ldr r1, [r4]
	bl Text_DrawCharacter
	ldr r1, [r5]
	str r0, [r1]
	movs r0, #0x40
	bl CheckTalkFlag
	cmp r0, #0
	bne _08008368
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	beq _08008328
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _08008368
	ldr r0, _08008324 @ =0x0000039A
	bl m4aSongNumStart
	b _08008368
	.align 2, 0
_0800831C: .4byte 0x08B909B8
_08008320: .4byte 0x030000C8
_08008324: .4byte 0x0000039A
_08008328:
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _0800833C
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _08008368
_0800833C:
	ldr r1, [r5]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08008350
	adds r0, r1, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne _08008368
_08008350:
	adds r0, r1, #0
	adds r0, #0x82
	movs r1, #1
	strb r1, [r0]
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #0x1e
	cmp r0, #0
	blt _08008368
	ldr r0, _08008388 @ =0x0000038E
	bl m4aSongNumStart
_08008368:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08008374
	b _0800825C
_08008374:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bgt _0800837E
	b _0800825C
_0800837E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008388: .4byte 0x0000038E

	thumb_func_start sub_0800838C
sub_0800838C: @ 0x0800838C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_08009EE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080083F8
	ldr r4, _080083F4 @ =0x08B909B8
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	beq _080083F8
	movs r0, #2
	bl CheckTalkFlag
	cmp r0, #0
	bne _080083F8
	ldr r1, [r4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _080083B8
	ldr r0, [r1]
_080083B8:
	movs r1, #0
	bl GetStrTalkLen
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	bl ClearTalkBubble
	ldr r4, _080083F4 @ =0x08B909B8
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	adds r1, r7, #0
	bl StartTalkOpen
	ldr r0, [r4]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl CheckTalkFlag
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08008F6C
	movs r0, #1
	b _08008468
	.align 2, 0
_080083F4: .4byte 0x08B909B8
_080083F8:
	ldr r6, _08008414 @ =0x08B909B8
	ldr r5, [r6]
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	cmp r0, r1
	blo _0800841C
	movs r0, #0
	strb r0, [r5, #0x12]
	ldr r0, _08008418 @ =0x08B90B24
	adds r1, r7, #0
	bl Proc_StartBlocking
	movs r0, #1
	b _08008468
	.align 2, 0
_08008414: .4byte 0x08B909B8
_08008418: .4byte 0x08B90B24
_0800841C:
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	bne _08008458
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008470 @ =0x030000C8
	adds r0, r0, r1
	lsls r4, r4, #1
	ldrb r1, [r5, #0xd]
	adds r4, r1, r4
	lsls r4, r4, #5
	ldrb r5, [r5, #0xc]
	adds r4, r5, r4
	lsls r4, r4, #1
	ldr r1, _08008474 @ =0x02022C60
	adds r4, r4, r1
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl TalkBgSync
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x15]
_08008458:
	ldr r1, [r6]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _08008466
	ldrb r0, [r1, #0x11]
	bl SetTalkFaceMouthMove
_08008466:
	movs r0, #0
_08008468:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008470: .4byte 0x030000C8
_08008474: .4byte 0x02022C60

	thumb_func_start TalkSpritePrepNextChar
TalkSpritePrepNextChar: @ 0x08008478
	push {lr}
	adds r1, r0, #0
	ldr r0, _08008498 @ =0x08B909B8
	ldr r2, [r0]
	ldrb r0, [r2, #9]
	ldrb r3, [r2, #0xa]
	cmp r0, r3
	blo _080084A0
	movs r0, #0
	strb r0, [r2, #0x12]
	ldr r0, _0800849C @ =0x08B90B4C
	bl Proc_StartBlocking
	movs r0, #1
	b _080084AC
	.align 2, 0
_08008498: .4byte 0x08B909B8
_0800849C: .4byte 0x08B90B4C
_080084A0:
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	bne _080084AA
	movs r0, #1
	strb r0, [r2, #0x15]
_080084AA:
	movs r0, #0
_080084AC:
	pop {r1}
	bx r1

	thumb_func_start LockTalk
LockTalk: @ 0x080084B0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080084C0 @ =0x08B90A04
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080084C0: .4byte 0x08B90A04

	thumb_func_start IsTalkLocked
IsTalkLocked: @ 0x080084C4
	push {lr}
	ldr r0, _080084D8 @ =0x08B90A04
	bl Proc_Find
	cmp r0, #0
	beq _080084D2
	movs r0, #1
_080084D2:
	pop {r1}
	bx r1
	.align 2, 0
_080084D8: .4byte 0x08B90A04

	thumb_func_start ResumeTalk
ResumeTalk: @ 0x080084DC
	push {lr}
	ldr r0, _080084E8 @ =0x08B90A04
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080084E8: .4byte 0x08B90A04

	thumb_func_start sub_080084EC
sub_080084EC: @ 0x080084EC
	push {r4, r5, lr}
	ldr r0, _0800852C @ =0x08B909B8
	ldr r2, [r0]
	ldrb r1, [r2, #8]
	cmp r1, #1
	bne _08008534
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _08008524
	adds r5, r0, #0
_08008502:
	ldr r1, [r5]
	ldrb r2, [r1, #0xb]
	adds r0, r2, r4
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008530 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #4
	bl Text_SetColor
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08008502
_08008524:
	ldr r0, _0800852C @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #4
	b _08008566
	.align 2, 0
_0800852C: .4byte 0x08B909B8
_08008530: .4byte 0x030000C8
_08008534:
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _08008560
	adds r5, r0, #0
_0800853E:
	ldr r1, [r5]
	ldrb r2, [r1, #0xb]
	adds r0, r2, r4
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008570 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #1
	bl Text_SetColor
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _0800853E
_08008560:
	ldr r0, _08008574 @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #1
_08008566:
	strb r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008570: .4byte 0x030000C8
_08008574: .4byte 0x08B909B8

	thumb_func_start TalkToggleInvertedPalette
TalkToggleInvertedPalette: @ 0x08008578
	push {lr}
	cmp r0, #0
	beq _0800859C
	ldr r0, _08008594 @ =0x08194774
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08008598 @ =0x08194754
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _080085B0
	.align 2, 0
_08008594: .4byte 0x08194774
_08008598: .4byte 0x08194754
_0800859C:
	ldr r0, _080085B4 @ =0x083FBFD0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080085B8 @ =0x08194674
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_080085B0:
	pop {r0}
	bx r0
	.align 2, 0
_080085B4: .4byte 0x083FBFD0
_080085B8: .4byte 0x08194674

	thumb_func_start TalkInterpret
TalkInterpret: @ 0x080085BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
_080085C6:
	ldr r7, _080085FC @ =0x08B909B8
	adds r5, r7, #0
_080085CA:
	ldr r1, [r5]
	ldr r4, [r1]
	ldrb r0, [r4]
	cmp r0, #0x14
	bgt _08008600
	cmp r0, #0x12
	blt _08008600
	adds r4, #1
	str r4, [r1]
	bl sub_08009EE0
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl GetStrTalkLen
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r5]
	adds r0, #2
	strb r0, [r1, #0xe]
	b _080085CA
	.align 2, 0
_080085FC: .4byte 0x08B909B8
_08008600:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x81
	bls _0800860E
	bl _08008E18
_0800860E:
	lsls r0, r0, #2
	ldr r1, _08008618 @ =_0800861C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008618: .4byte _0800861C
_0800861C: @ jump table
	.4byte _08008884 @ case 0
	.4byte _0800889A @ case 1
	.4byte _080088B8 @ case 2
	.4byte _08008900 @ case 3
	.4byte _0800893C @ case 4
	.4byte _0800893C @ case 5
	.4byte _0800893C @ case 6
	.4byte _0800893C @ case 7
	.4byte _08008A40 @ case 8
	.4byte _08008A40 @ case 9
	.4byte _08008A40 @ case 10
	.4byte _08008A40 @ case 11
	.4byte _08008A40 @ case 12
	.4byte _08008A40 @ case 13
	.4byte _08008A40 @ case 14
	.4byte _08008A40 @ case 15
	.4byte _08008998 @ case 16
	.4byte _080089D8 @ case 17
	.4byte _08008E18 @ case 18
	.4byte _08008E18 @ case 19
	.4byte _08008E18 @ case 20
	.4byte _08008970 @ case 21
	.4byte _08008980 @ case 22
	.4byte _0800898C @ case 23
	.4byte _08008A52 @ case 24
	.4byte _08008A9C @ case 25
	.4byte _08008AE8 @ case 26
	.4byte _08008B34 @ case 27
	.4byte _08008A1C @ case 28
	.4byte _08008E18 @ case 29
	.4byte _08008E18 @ case 30
	.4byte _08008E18 @ case 31
	.4byte _08008E18 @ case 32
	.4byte _08008E18 @ case 33
	.4byte _08008E18 @ case 34
	.4byte _08008E18 @ case 35
	.4byte _08008E18 @ case 36
	.4byte _08008E18 @ case 37
	.4byte _08008E18 @ case 38
	.4byte _08008E18 @ case 39
	.4byte _08008E18 @ case 40
	.4byte _08008E18 @ case 41
	.4byte _08008E18 @ case 42
	.4byte _08008E18 @ case 43
	.4byte _08008E18 @ case 44
	.4byte _08008E18 @ case 45
	.4byte _08008E18 @ case 46
	.4byte _08008E18 @ case 47
	.4byte _08008E18 @ case 48
	.4byte _08008E18 @ case 49
	.4byte _08008E18 @ case 50
	.4byte _08008E18 @ case 51
	.4byte _08008E18 @ case 52
	.4byte _08008E18 @ case 53
	.4byte _08008E18 @ case 54
	.4byte _08008E18 @ case 55
	.4byte _08008E18 @ case 56
	.4byte _08008E18 @ case 57
	.4byte _08008E18 @ case 58
	.4byte _08008E18 @ case 59
	.4byte _08008E18 @ case 60
	.4byte _08008E18 @ case 61
	.4byte _08008E18 @ case 62
	.4byte _08008E18 @ case 63
	.4byte _08008E18 @ case 64
	.4byte _08008E18 @ case 65
	.4byte _08008E18 @ case 66
	.4byte _08008E18 @ case 67
	.4byte _08008E18 @ case 68
	.4byte _08008E18 @ case 69
	.4byte _08008E18 @ case 70
	.4byte _08008E18 @ case 71
	.4byte _08008E18 @ case 72
	.4byte _08008E18 @ case 73
	.4byte _08008E18 @ case 74
	.4byte _08008E18 @ case 75
	.4byte _08008E18 @ case 76
	.4byte _08008E18 @ case 77
	.4byte _08008E18 @ case 78
	.4byte _08008E18 @ case 79
	.4byte _08008E18 @ case 80
	.4byte _08008E18 @ case 81
	.4byte _08008E18 @ case 82
	.4byte _08008E18 @ case 83
	.4byte _08008E18 @ case 84
	.4byte _08008E18 @ case 85
	.4byte _08008E18 @ case 86
	.4byte _08008E18 @ case 87
	.4byte _08008E18 @ case 88
	.4byte _08008E18 @ case 89
	.4byte _08008E18 @ case 90
	.4byte _08008E18 @ case 91
	.4byte _08008E18 @ case 92
	.4byte _08008E18 @ case 93
	.4byte _08008E18 @ case 94
	.4byte _08008E18 @ case 95
	.4byte _08008E18 @ case 96
	.4byte _08008E18 @ case 97
	.4byte _08008E18 @ case 98
	.4byte _08008E18 @ case 99
	.4byte _08008E18 @ case 100
	.4byte _08008E18 @ case 101
	.4byte _08008E18 @ case 102
	.4byte _08008E18 @ case 103
	.4byte _08008E18 @ case 104
	.4byte _08008E18 @ case 105
	.4byte _08008E18 @ case 106
	.4byte _08008E18 @ case 107
	.4byte _08008E18 @ case 108
	.4byte _08008E18 @ case 109
	.4byte _08008E18 @ case 110
	.4byte _08008E18 @ case 111
	.4byte _08008E18 @ case 112
	.4byte _08008E18 @ case 113
	.4byte _08008E18 @ case 114
	.4byte _08008E18 @ case 115
	.4byte _08008E18 @ case 116
	.4byte _08008E18 @ case 117
	.4byte _08008E18 @ case 118
	.4byte _08008E18 @ case 119
	.4byte _08008E18 @ case 120
	.4byte _08008E18 @ case 121
	.4byte _08008E18 @ case 122
	.4byte _08008E18 @ case 123
	.4byte _08008E18 @ case 124
	.4byte _08008E18 @ case 125
	.4byte _08008E18 @ case 126
	.4byte _08008E18 @ case 127
	.4byte _08008B80 @ case 128
	.4byte _08008824 @ case 129
_08008824:
	ldr r1, [r7]
	ldr r0, [r1]
	ldrb r2, [r0, #1]
	cmp r2, #0x40
	beq _08008830
	b _08008E18
_08008830:
	adds r0, #2
	str r0, [r1]
	ldrb r3, [r1, #0xb]
	ldrb r2, [r1, #9]
	adds r0, r3, r2
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0800887C @ =0x030000C8
	adds r0, r0, r1
	movs r1, #6
	bl Text_Skip
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08008858
	b _0800894C
_08008858:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0800894C
	ldr r0, _08008880 @ =0x08B90A2C
	mov r1, r8
	bl Proc_StartBlocking
	adds r4, r0, #0
	movs r0, #4
	bl GetTalkPauseCmdDuration
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
_08008876:
	movs r0, #3
	b _08008E1A
	.align 2, 0
_0800887C: .4byte 0x030000C8
_08008880: .4byte 0x08B90A2C
_08008884:
	ldr r1, [r7]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _08008890
_0800888C:
	movs r0, #0
	b _08008E1A
_08008890:
	adds r0, #2
	str r0, [r1]
	movs r0, #0
	str r0, [r1, #4]
	b _080085C6
_0800889A:
	ldr r1, [r7]
	ldrb r3, [r1, #0x15]
	cmp r3, #1
	beq _080088A8
	ldrb r0, [r1, #9]
	cmp r0, #1
	bne _080088AE
_080088A8:
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
_080088AE:
	ldr r1, [r7]
	movs r0, #0
	strb r0, [r1, #0x15]
	ldr r1, [r7]
	b _08008946
_080088B8:
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	beq _080088D8
	bl sub_08009708
	ldr r0, _080088D4 @ =0x08B909B8
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _080088F4
	.align 2, 0
_080088D4: .4byte 0x08B909B8
_080088D8:
	movs r0, #1
	bl CheckTalkFlag
	cmp r0, #0
	bne _080088F0
	ldr r0, _080088EC @ =0x08B90ACC
	mov r1, r8
	bl Proc_StartBlocking
	b _080088F4
	.align 2, 0
_080088EC: .4byte 0x08B90ACC
_080088F0:
	bl ClearTalkText
_080088F4:
	ldr r0, _080088FC @ =0x08B909B8
	ldr r1, [r0]
	b _08008D2C
	.align 2, 0
_080088FC: .4byte 0x08B909B8
_08008900:
	ldr r1, [r7]
	ldrb r2, [r1, #0xb]
	ldrb r3, [r1, #9]
	adds r0, r2, r3
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008938 @ =0x030000C8
	adds r0, r0, r1
	bl Text_GetCursor
	ldr r3, [r7]
	ldrb r2, [r3, #0xc]
	lsls r1, r2, #3
	adds r1, r1, r0
	adds r1, #4
	ldrb r0, [r3, #0xd]
	lsls r2, r0, #3
	ldrb r3, [r3, #9]
	lsls r0, r3, #4
	adds r2, r2, r0
	adds r2, #8
	mov r0, r8
	bl StartTalkWaitForInput
	b _08008D2A
	.align 2, 0
_08008938: .4byte 0x030000C8
_0800893C:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08008950
_08008946:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0800894C:
	movs r0, #2
	b _08008E1A
_08008950:
	ldr r0, _0800896C @ =0x08B90A2C
	mov r1, r8
	bl Proc_StartBlocking
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	bl GetTalkPauseCmdDuration
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	b _08008D2A
	.align 2, 0
_0800896C: .4byte 0x08B90A2C
_08008970:
	bl ClearTalkBubble
	ldr r0, _0800897C @ =0x08B909B8
	ldr r1, [r0]
	b _08008D2C
	.align 2, 0
_0800897C: .4byte 0x08B909B8
_08008980:
	ldr r1, [r7]
	movs r0, #1
	ldrb r2, [r1, #0x16]
	subs r0, r0, r2
	strb r0, [r1, #0x16]
	b _08008D2A
_0800898C:
	ldr r1, [r7]
	movs r0, #1
	ldrb r3, [r1, #0x17]
	subs r0, r0, r3
	strb r0, [r1, #0x17]
	b _08008D2A
_08008998:
	ldr r4, _080089B0 @ =0x08B909B8
_0800899A:
	ldr r2, [r4]
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #8
	bge _080089A6
	b _08008876
_080089A6:
	cmp r0, #0xf
	ble _080089B4
	cmp r0, #0x10
	beq _080089C4
	b _08008876
	.align 2, 0
_080089B0: .4byte 0x08B909B8
_080089B4:
	subs r0, #8
	bl SetActiveTalkFace
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _0800899A
_080089C4:
	adds r0, r1, #1
	str r0, [r2]
	mov r0, r8
	bl sub_08008E34
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	b _0800899A
_080089D8:
	bl sub_08009EE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080089E6
	bl ClearTalkBubble
_080089E6:
	ldr r4, _08008A18 @ =0x08B909B8
	ldr r0, [r4]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	bl StartFaceFadeOut
	ldr r2, [r4]
	ldrb r3, [r2, #0x11]
	lsls r1, r3, #2
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	mov r0, r8
	movs r1, #0x10
	bl StartTemporaryLock
	b _08008876
	.align 2, 0
_08008A18: .4byte 0x08B909B8
_08008A1C:
	movs r0, #0x10
	bl CheckTalkFlag
	cmp r0, #0
	beq _08008A2E
	movs r0, #0x10
	bl ClearTalkFlag
	b _08008A34
_08008A2E:
	movs r0, #0x10
	bl SetTalkFlag
_08008A34:
	ldr r0, _08008A3C @ =0x08B909B8
	ldr r1, [r0]
	b _08008D2C
	.align 2, 0
_08008A3C: .4byte 0x08B909B8
_08008A40:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #8
	b _08008D26
_08008A52:
	ldr r6, _08008A90 @ =0x08B90AEC
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008A94 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008A98 @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_080093CC
	b _08008D2A
	.align 2, 0
_08008A90: .4byte 0x08B90AEC
_08008A94: .4byte 0x030000C8
_08008A98: .4byte 0x02022C60
_08008A9C:
	ldr r6, _08008ADC @ =0x08B90AEC
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008AE0 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008AE4 @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_080093CC
	b _08008D2A
	.align 2, 0
_08008ADC: .4byte 0x08B90AEC
_08008AE0: .4byte 0x030000C8
_08008AE4: .4byte 0x02022C60
_08008AE8:
	ldr r6, _08008B28 @ =0x08B90AFC
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008B2C @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008B30 @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_080093CC
	b _08008D2A
	.align 2, 0
_08008B28: .4byte 0x08B90AFC
_08008B2C: .4byte 0x030000C8
_08008B30: .4byte 0x02022C60
_08008B34:
	ldr r6, _08008B74 @ =0x08B90AFC
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, _08008B78 @ =0x030000C8
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r2, [r5, #0xd]
	adds r4, r2, r4
	lsls r4, r4, #5
	ldrb r3, [r5, #0xc]
	adds r4, r3, r4
	lsls r4, r4, #1
	ldr r0, _08008B7C @ =0x02022C60
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl sub_080093CC
	b _08008D2A
	.align 2, 0
_08008B74: .4byte 0x08B90AFC
_08008B78: .4byte 0x030000C8
_08008B7C: .4byte 0x02022C60
_08008B80:
	ldr r0, [r7]
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldrb r0, [r2, #1]
	cmp r0, #0x25
	bls _08008B90
	b _0800888C
_08008B90:
	lsls r0, r0, #2
	ldr r1, _08008B9C @ =_08008BA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008B9C: .4byte _08008BA0
_08008BA0: @ jump table
	.4byte _08008C5C @ case 0
	.4byte _08008C5C @ case 1
	.4byte _08008C5C @ case 2
	.4byte _08008C5C @ case 3
	.4byte _08008CAE @ case 4
	.4byte _08008CC0 @ case 5
	.4byte _08008CF8 @ case 6
	.4byte _08008D2A @ case 7
	.4byte _08008D2A @ case 8
	.4byte _0800888C @ case 9
	.4byte _08008D10 @ case 10
	.4byte _08008D10 @ case 11
	.4byte _08008D10 @ case 12
	.4byte _08008D10 @ case 13
	.4byte _08008D10 @ case 14
	.4byte _08008D10 @ case 15
	.4byte _08008D10 @ case 16
	.4byte _08008D10 @ case 17
	.4byte _0800888C @ case 18
	.4byte _0800888C @ case 19
	.4byte _0800888C @ case 20
	.4byte _0800888C @ case 21
	.4byte _08008D34 @ case 22
	.4byte _08008D4A @ case 23
	.4byte _08008D60 @ case 24
	.4byte _08008D76 @ case 25
	.4byte _08008D8C @ case 26
	.4byte _08008DA2 @ case 27
	.4byte _08008DBC @ case 28
	.4byte _08008DD2 @ case 29
	.4byte _08008DE8 @ case 30
	.4byte _08008DFE @ case 31
	.4byte _08008CE0 @ case 32
	.4byte _08008C48 @ case 33
	.4byte _0800888C @ case 34
	.4byte _0800888C @ case 35
	.4byte _08008C38 @ case 36
	.4byte _08008C9C @ case 37
_08008C38:
	ldr r0, [r7]
	ldr r1, [r0, #0x38]
	cmp r1, #0
	beq _08008D2A
	mov r0, r8
	bl _call_via_r1
	b _08008D2A
_08008C48:
	bl sub_080084EC
	ldr r0, _08008C58 @ =0x08B909B8
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _080085C6
	.align 2, 0
_08008C58: .4byte 0x08B909B8
_08008C5C:
	ldr r3, _08008C94 @ =0x08B909B8
	ldr r1, [r3]
	ldr r2, [r1]
	adds r0, r2, #1
	str r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r3]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08008C8E
	adds r6, r3, #0
	ldr r5, _08008C98 @ =0x030000C8
_08008C78:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl Text_SetColor
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08008C78
_08008C8E:
	ldr r0, _08008C94 @ =0x08B909B8
	ldr r1, [r0]
	b _08008D2C
	.align 2, 0
_08008C94: .4byte 0x08B909B8
_08008C98: .4byte 0x030000C8
_08008C9C:
	ldr r2, [r7]
	adds r2, #0x83
	movs r1, #1
	ldrb r3, [r2]
	ands r1, r3
	movs r0, #3
	subs r0, r0, r1
	strb r0, [r2]
	b _08008D2A
_08008CAE:
	mov r0, r8
	bl LockTalk
	ldr r0, _08008CBC @ =0x08B909B8
	ldr r1, [r0]
	b _08008D2C
	.align 2, 0
_08008CBC: .4byte 0x08B909B8
_08008CC0:
	ldr r4, _08008CDC @ =0x08B909B8
	ldr r1, [r4]
	ldr r0, [r1, #0x3c]
	adds r1, #0x40
	bl NumberToStringAscii
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r1]
	b _080085C6
	.align 2, 0
_08008CDC: .4byte 0x08B909B8
_08008CE0:
	ldr r4, _08008CF4 @ =0x08B909B8
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	bl GetTacticianName
	ldr r1, [r4]
	str r0, [r1]
	b _080085C6
	.align 2, 0
_08008CF4: .4byte 0x08B909B8
_08008CF8:
	ldr r0, _08008D0C @ =0x08B909B8
	ldr r1, [r0]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x60
	str r0, [r1]
	b _080085C6
	.align 2, 0
_08008D0C: .4byte 0x08B909B8
_08008D10:
	ldr r1, [r7]
	ldrb r0, [r1, #0x11]
	ldr r1, [r1]
	ldrb r1, [r1]
	subs r1, #0xa
	bl MoveTalkFace
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0xa
_08008D26:
	bl SetActiveTalkFace
_08008D2A:
	ldr r1, [r7]
_08008D2C:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _08008876
_08008D34:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _08008DB6
_08008D4A:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #1
	b _08008DB6
_08008D60:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _08008DB6
_08008D76:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _08008DB6
_08008D8C:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
	b _08008DB6
_08008DA2:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #5
_08008DB6:
	bl SetFaceBlinkControl
	b _08008876
_08008DBC:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b _08008E12
_08008DD2:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b _08008E12
_08008DE8:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b _08008E12
_08008DFE:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r3, [r1, #0x11]
	lsls r0, r3, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
_08008E12:
	bl SetFaceEyeState
	b _08008876
_08008E18:
	movs r0, #1
_08008E1A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetActiveTalkFace
SetActiveTalkFace: @ 0x08008E28
	ldr r1, _08008E30 @ =0x08B909B8
	ldr r1, [r1]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08008E30: .4byte 0x08B909B8

	thumb_func_start sub_08008E34
sub_08008E34: @ 0x08008E34
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _08008E5C @ =0x08B909B8
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	bne _08008E4A
	movs r0, #1
	bl SetActiveTalkFace
_08008E4A:
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08008E60
	bl sub_0800ED68
	b _08008E62
	.align 2, 0
_08008E5C: .4byte 0x08B909B8
_08008E60:
	movs r6, #2
_08008E62:
	ldr r4, _08008E94 @ =0x08B909B8
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	bl GetTalkFaceHPos
	cmp r0, #0xe
	bgt _08008E74
	movs r0, #1
	orrs r6, r0
_08008E74:
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	lsls r4, r1, #8
	ldrb r0, [r0]
	orrs r4, r0
	ldr r0, _08008E98 @ =0x0000FFFF
	cmp r4, r0
	bne _08008EA0
	ldr r0, _08008E9C @ =0x03004690
	ldr r0, [r0]
	bl GetUnitPortraitId
	adds r4, r0, #0
	b _08008EA4
	.align 2, 0
_08008E94: .4byte 0x08B909B8
_08008E98: .4byte 0x0000FFFF
_08008E9C: .4byte 0x03004690
_08008EA0:
	ldr r2, _08008EC0 @ =0xFFFFFF00
	adds r4, r4, r2
_08008EA4:
	ldr r5, _08008EC4 @ =0x08B909B8
	ldr r0, [r5]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08008EC8
	adds r1, r4, #0
	bl sub_08007DB8
	b _08008F10
	.align 2, 0
_08008EC0: .4byte 0xFFFFFF00
_08008EC4: .4byte 0x08B909B8
_08008EC8:
	adds r0, r2, #0
	bl GetTalkFaceHPos
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r0, r4, #0
	movs r2, #0x50
	adds r3, r6, #0
	bl StartFaceAuto
	ldr r3, [r5]
	ldrb r2, [r3, #0x11]
	lsls r1, r2, #2
	adds r2, r3, #0
	adds r2, #0x18
	adds r1, r2, r1
	str r0, [r1]
	ldrb r3, [r3, #0x11]
	lsls r0, r3, #2
	adds r2, r2, r0
	ldr r0, [r2]
	bl StartFaceFadeIn
	ldr r0, [r5]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl CheckTalkFlag
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08008F6C
	adds r0, r7, #0
	movs r1, #8
	bl StartTemporaryLock
_08008F10:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartTalkFace
StartTalkFace: @ 0x08008F18
	push {r4, lr}
	ldr r4, [sp, #8]
	bl StartFaceAuto
	ldr r1, _08008F34 @ =0x08B909B8
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #0x18
	adds r1, r1, r4
	str r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008F34: .4byte 0x08B909B8

	thumb_func_start GetFaceIdByXPos
GetFaceIdByXPos: @ 0x08008F38
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _08008F54 @ =0x030041C0
_08008F40:
	ldr r0, [r2]
	cmp r0, #0
	beq _08008F58
	movs r4, #0x34
	ldrsh r0, [r0, r4]
	cmp r0, r3
	bne _08008F58
	adds r0, r1, #0
	b _08008F64
	.align 2, 0
_08008F54: .4byte 0x030041C0
_08008F58:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08008F40
	movs r0, #1
	rsbs r0, r0, #0
_08008F64:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08008F6C
sub_08008F6C: @ 0x08008F6C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	cmp r1, #0
	beq _08008F7A
	movs r6, #6
	movs r5, #5
	b _08008F7E
_08008F7A:
	movs r6, #5
	movs r5, #6
_08008F7E:
	cmp r3, #0
	blt _08008F8A
	cmp r3, #2
	ble _08008F8A
	cmp r3, #5
	ble _08008F90
_08008F8A:
	movs r1, #0
	movs r4, #2
	b _08008F94
_08008F90:
	movs r1, #3
	movs r4, #5
_08008F94:
	adds r2, r1, #0
	cmp r2, r4
	bgt _08008FC2
	ldr r7, _08008FB4 @ =0x08B909B8
_08008F9C:
	ldr r0, [r7]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08008FBC
	cmp r2, r3
	bne _08008FB8
	adds r0, #0x41
	strb r6, [r0]
	b _08008FBC
	.align 2, 0
_08008FB4: .4byte 0x08B909B8
_08008FB8:
	adds r0, #0x41
	strb r5, [r0]
_08008FBC:
	adds r2, #1
	cmp r2, r4
	ble _08008F9C
_08008FC2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MoveTalkFace
MoveTalkFace: @ 0x08008FC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r7, #0
	ldr r0, _0800901C @ =0x08B909B8
	mov r8, r0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, #0x18
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _08008FF2
	movs r7, #1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl StartTalkFaceMove
_08008FF2:
	adds r2, r7, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartTalkFaceMove
	mov r1, r8
	ldr r0, [r1]
	lsls r2, r5, #2
	adds r0, #0x18
	adds r2, r0, r2
	ldr r3, [r2]
	adds r0, r0, r6
	ldr r1, [r0]
	str r1, [r2]
	str r3, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800901C: .4byte 0x08B909B8

	thumb_func_start sub_08009020
sub_08009020: @ 0x08009020
	push {lr}
	ldr r0, _08009030 @ =0x08B90A0C
	bl Proc_Find
	cmp r0, #0
	bne _08009034
	movs r0, #0
	b _08009036
	.align 2, 0
_08009030: .4byte 0x08B90A0C
_08009034:
	movs r0, #1
_08009036:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartTalkFaceMove
StartTalkFaceMove: @ 0x0800903C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	bl GetTalkFaceHPos
	lsls r0, r0, #3
	bl GetFaceIdByXPos
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _08009084
	ldr r0, _0800908C @ =0x08B90A0C
	ldr r1, _08009090 @ =0x030041C0
	lsls r4, r5, #2
	adds r4, r4, r1
	ldr r1, [r4]
	bl Proc_Start
	adds r3, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r0, [r4]
	ldrh r1, [r0, #0x34]
	adds r0, r3, #0
	adds r0, #0x68
	strh r1, [r0]
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r3, #0
	adds r1, #0x6a
	strh r0, [r1]
_08009084:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800908C: .4byte 0x08B90A0C
_08009090: .4byte 0x030041C0

	thumb_func_start TalkFaceMove_OnInit
TalkFaceMove_OnInit: @ 0x08009094
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x58]
	adds r4, r6, #0
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTalkFaceHPos
	adds r5, r6, #0
	adds r5, #0x68
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0
	bge _080090CE
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTalkFaceHPos
	lsls r0, r0, #3
	movs r2, #0
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	cmp r0, #0x18
	bgt _080090E2
	b _080090E6
_080090CE:
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTalkFaceHPos
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0x18
	ble _080090E6
_080090E2:
	movs r0, #0x20
	b _080090E8
_080090E6:
	movs r0, #0x10
_080090E8:
	str r0, [r6, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start TalkFaceMove_OnIdle
TalkFaceMove_OnIdle: @ 0x080090F0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	cmp r2, #0x10
	ble _08009164
	adds r1, r2, #0
	cmp r2, #0
	bge _08009104
	adds r1, r2, #7
_08009104:
	asrs r1, r1, #3
	ldr r0, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, r1
	bne _08009122
	ldr r1, _08009160 @ =0x030041C0
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08009122:
	ldr r0, [r4, #0x5c]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	cmp r1, r0
	bne _08009142
	ldr r1, _08009160 @ =0x030041C0
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
_08009142:
	ldr r1, [r4, #0x5c]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge _0800914E
	adds r0, #7
_0800914E:
	asrs r1, r0, #3
	ldr r0, [r4, #0x58]
	cmp r0, r1
	bne _08009186
	ldr r1, _08009160 @ =0x030041C0
	movs r2, #0
	ldrsh r0, [r5, r2]
	b _0800917A
	.align 2, 0
_08009160: .4byte 0x030041C0
_08009164:
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r1, r0
	bne _08009186
	ldr r1, _080091A8 @ =0x030041C0
	movs r3, #0
	ldrsh r0, [r5, r3]
_0800917A:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
_08009186:
	ldr r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	cmp r1, r0
	blt _080091AC
	ldr r1, _080091A8 @ =0x030041C0
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
	adds r0, r4, #0
	bl Proc_Break
	b _080091E4
	.align 2, 0
_080091A8: .4byte 0x030041C0
_080091AC:
	adds r0, r4, #0
	adds r0, #0x66
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl GetTalkFaceHPos
	adds r2, r0, #0
	lsls r2, r2, #3
	adds r0, r4, #0
	adds r0, #0x68
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x58]
	adds r3, r0, #0
	adds r0, #1
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	ldr r2, _080091EC @ =0x030041C0
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	strh r0, [r1, #0x34]
_080091E4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080091EC: .4byte 0x030041C0

	thumb_func_start sub_080091F0
sub_080091F0: @ 0x080091F0
	push {lr}
	ldr r0, _08009204 @ =0x08B909BC
	bl Proc_EndEach
	ldr r0, _08009208 @ =0x08B90ACC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08009204: .4byte 0x08B909BC
_08009208: .4byte 0x08B90ACC

	thumb_func_start TalkPause_OnIdle
TalkPause_OnIdle: @ 0x0800920C
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _08009226
	adds r0, r2, #0
	bl Proc_Break
	b _0800922A
_08009226:
	subs r0, r3, #1
	strh r0, [r1]
_0800922A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start TalkWaitForInput_OnIdle
TalkWaitForInput_OnIdle: @ 0x08009230
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetGameTime
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	bne _08009270
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _0800926C @ =0x08B90A8C
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	bl PutSprite
	b _08009290
	.align 2, 0
_0800926C: .4byte 0x08B90A8C
_08009270:
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _080092AC @ =0x08B90A8C
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _080092B0 @ =0x0000B2BF
	str r0, [sp]
	movs r0, #0
	bl PutSprite
_08009290:
	ldr r0, _080092B4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080092A4
	adds r0, r5, #0
	bl Proc_Break
_080092A4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080092AC: .4byte 0x08B90A8C
_080092B0: .4byte 0x0000B2BF
_080092B4: .4byte 0x08B857F8

	thumb_func_start sub_080092B8
sub_080092B8: @ 0x080092B8
	bx lr
	.align 2, 0

	thumb_func_start StartTalkWaitForInput
StartTalkWaitForInput: @ 0x080092BC
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080092E4 @ =0x08B90A4C
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080092E4: .4byte 0x08B90A4C

	thumb_func_start StartTalkWaitForInputUnk
StartTalkWaitForInputUnk: @ 0x080092E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08009318 @ =0x08B90A4C
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009318: .4byte 0x08B90A4C

	thumb_func_start sub_0800931C
sub_0800931C: @ 0x0800931C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08009364 @ =0x08B909B8
	ldr r2, [r4]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _08009368 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl TalkBgSync
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne _0800936C
	adds r1, r5, #0
	adds r1, #0x66
	movs r0, #0x10
	strh r0, [r1]
	b _08009382
	.align 2, 0
_08009364: .4byte 0x08B909B8
_08009368: .4byte 0x02022C60
_0800936C:
	ldrb r0, [r1, #9]
	adds r0, #1
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	blt _0800937A
	lsls r1, r1, #4
	b _0800937C
_0800937A:
	lsls r1, r0, #4
_0800937C:
	adds r0, r5, #0
	adds r0, #0x66
	strh r1, [r0]
_08009382:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start TalkShiftClearAll_OnIdle
TalkShiftClearAll_OnIdle: @ 0x08009388
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	adds r0, r5, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _080093C4
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearPutTalkText
	adds r0, r5, #0
	bl Proc_Break
_080093C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080093CC
sub_080093CC: @ 0x080093CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov sb, r3
	adds r0, r6, #0
	bl Text_GetCursor
	adds r4, r0, #0
	movs r0, #0x10
	adds r0, r0, r4
	mov r8, r0
	ldrh r0, [r7]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	mov r1, r8
	ldr r2, [sp, #0x1c]
	bl Text_InsertDrawString
	adds r4, #0x38
	ldrh r0, [r7, #8]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	bl Text_InsertDrawString
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	movs r0, #1
	bl TalkBgSync
	ldr r0, _08009474 @ =0x08B90B0C
	ldr r1, [sp, #0x20]
	bl Proc_StartBlocking
	adds r1, r0, #0
	mov r3, sb
	strh r3, [r1, #0x2a]
	ldr r0, _08009478 @ =0x02022C60
	subs r5, r5, r0
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r0, r5
	lsls r0, r0, #3
	ldr r2, _0800947C @ =0x03002870
	ldrh r3, [r2, #0x1c]
	subs r0, r0, r3
	add r0, r8
	strh r0, [r1, #0x2c]
	cmp r5, #0
	bge _08009448
	adds r5, #0x1f
_08009448:
	asrs r0, r5, #5
	lsls r0, r0, #3
	ldrh r2, [r2, #0x1e]
	subs r0, r0, r2
	strh r0, [r1, #0x2e]
	str r7, [r1, #0x34]
	mov r1, sb
	lsls r0, r1, #3
	adds r0, r0, r7
	subs r0, #8
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _08009466
	bl _call_via_r0
_08009466:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009474: .4byte 0x08B90B0C
_08009478: .4byte 0x02022C60
_0800947C: .4byte 0x03002870

	thumb_func_start sub_08009480
sub_08009480: @ 0x08009480
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080094AC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080094BC
	ldr r0, _080094B0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080094A4
	ldr r0, _080094B4 @ =0x0000038B
	bl m4aSongNumStart
_080094A4:
	ldr r1, _080094B8 @ =0x030000E0
	movs r0, #0
	b _080094DE
	.align 2, 0
_080094AC: .4byte 0x08B857F8
_080094B0: .4byte 0x0202BBF8
_080094B4: .4byte 0x0000038B
_080094B8: .4byte 0x030000E0
_080094BC:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080094F4
	ldr r0, _080094E8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080094D8
	ldr r0, _080094EC @ =0x0000038A
	bl m4aSongNumStart
_080094D8:
	ldr r1, _080094F0 @ =0x030000E0
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
_080094DE:
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _08009574
	.align 2, 0
_080094E8: .4byte 0x0202BBF8
_080094EC: .4byte 0x0000038A
_080094F0: .4byte 0x030000E0
_080094F4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08009522
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	bne _08009522
	ldr r0, _0800957C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08009514
	ldr r0, _08009580 @ =0x00000387
	bl m4aSongNumStart
_08009514:
	strh r5, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _08009522
	bl _call_via_r0
_08009522:
	ldr r0, _08009584 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08009558
	ldrh r1, [r4, #0x2a]
	cmp r1, #1
	bne _08009558
	ldr r0, _0800957C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08009548
	ldr r0, _08009580 @ =0x00000387
	bl m4aSongNumStart
_08009548:
	movs r0, #2
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _08009558
	bl _call_via_r0
_08009558:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl PutUiHand
_08009574:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800957C: .4byte 0x0202BBF8
_08009580: .4byte 0x00000387
_08009584: .4byte 0x08B857F8

	thumb_func_start sub_08009588
sub_08009588: @ 0x08009588
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080095C0 @ =0x08B909B8
	ldr r2, [r0]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _080095C4 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl TalkBgSync
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080095C0: .4byte 0x08B909B8
_080095C4: .4byte 0x02022C60

	thumb_func_start sub_080095C8
sub_080095C8: @ 0x080095C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	ble _080096A8
	ldr r4, _080096B0 @ =0x08B909B8
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r5, #0
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	bge _08009646
	adds r6, r4, #0
_08009612:
	ldr r4, [r6]
	ldrb r2, [r4, #0xb]
	adds r0, r2, r5
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080096B4 @ =0x030000C8
	adds r0, r0, r1
	lsls r1, r5, #1
	ldrb r2, [r4, #0xd]
	adds r1, r2, r1
	lsls r1, r1, #5
	ldrb r4, [r4, #0xc]
	adds r1, r4, r1
	lsls r1, r1, #1
	ldr r2, _080096B8 @ =0x02022C60
	adds r1, r1, r2
	bl PutText
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	blt _08009612
_08009646:
	ldr r4, _080096B0 @ =0x08B909B8
	ldr r2, [r4]
	ldrb r0, [r2, #0xa]
	subs r0, #1
	lsls r0, r0, #1
	ldrb r1, [r2, #0xd]
	adds r0, r1, r0
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _080096B8 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	ldrb r0, [r0, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	ldr r5, _080096B4 @ =0x030000C8
	adds r0, r0, r5
	bl ClearText
	ldr r4, [r4]
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4, #8]
	bl Text_SetColor
	movs r0, #1
	bl TalkBgSync
	adds r0, r7, #0
	bl Proc_Break
_080096A8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080096B0: .4byte 0x08B909B8
_080096B4: .4byte 0x030000C8
_080096B8: .4byte 0x02022C60

	thumb_func_start sub_080096BC
sub_080096BC: @ 0x080096BC
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, _080096D0 @ =0x44444444
	movs r1, #0x1a
	bl CleanTalkObjects
	pop {r0}
	bx r0
	.align 2, 0
_080096D0: .4byte 0x44444444

	thumb_func_start sub_080096D4
sub_080096D4: @ 0x080096D4
	push {r4, lr}
	ldr r0, _08009700 @ =0x08B909B8
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r4, _08009704 @ =0x030000D0
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009700: .4byte 0x08B909B8
_08009704: .4byte 0x030000D0

	thumb_func_start sub_08009708
sub_08009708: @ 0x08009708
	push {r4, r5, lr}
	ldr r0, _0800973C @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #9]
	movs r5, #0
_08009714:
	lsls r4, r5, #3
	ldr r0, _08009740 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	adds r5, #1
	cmp r5, #1
	ble _08009714
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800973C: .4byte 0x08B909B8
_08009740: .4byte 0x030000C8

	thumb_func_start GetTalkPauseCmdDuration
GetTalkPauseCmdDuration: @ 0x08009744
	ldr r1, _08009750 @ =0x08B90B7C
	subs r0, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08009750: .4byte 0x08B90B7C

	thumb_func_start ClearTalkBubble
ClearTalkBubble: @ 0x08009754
	push {lr}
	ldr r0, _0800978C @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, _08009790 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl TalkBgSync
	bl ClearPutTalkText
	ldr r2, _08009794 @ =0x03002870
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
	pop {r0}
	bx r0
	.align 2, 0
_0800978C: .4byte 0x08B909B8
_08009790: .4byte 0x02023460
_08009794: .4byte 0x03002870

	thumb_func_start ClearPutTalkText
ClearPutTalkText: @ 0x08009798
	push {r4, r5, r6, lr}
	ldr r0, _080097F0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl TalkBgSync
	ldr r2, _080097F4 @ =0x08B909B8
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _080097EA
	adds r6, r2, #0
_080097CA:
	lsls r4, r5, #3
	ldr r0, _080097F8 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl Text_SetColor
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _080097CA
_080097EA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080097F0: .4byte 0x02022C60
_080097F4: .4byte 0x08B909B8
_080097F8: .4byte 0x030000C8

	thumb_func_start ClearTalkText
ClearTalkText: @ 0x080097FC
	push {r4, r5, r6, lr}
	ldr r2, _08009848 @ =0x08B909B8
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _08009840
	adds r6, r2, #0
_08009820:
	lsls r4, r5, #3
	ldr r0, _0800984C @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl Text_SetColor
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _08009820
_08009840:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009848: .4byte 0x08B909B8
_0800984C: .4byte 0x030000C8

	thumb_func_start PutTalkBubble
PutTalkBubble: @ 0x08009850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	mov sl, r1
	adds r4, r2, #0
	str r3, [sp, #4]
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldr r0, _080098A0 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r7, #1
	cmp r5, #0xf
	bgt _0800987A
	movs r7, #0
_0800987A:
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009886
	adds r7, #2
_08009886:
	mov r1, sl
	ldr r2, [sp, #4]
	subs r0, r1, r2
	adds r0, #1
	mov sb, r0
	cmp r7, #1
	beq _080098C2
	cmp r7, #1
	bgt _080098A4
	cmp r7, #0
	beq _080098AE
	b _08009906
	.align 2, 0
_080098A0: .4byte 0x02023460
_080098A4:
	cmp r7, #2
	beq _080098E6
	cmp r7, #3
	beq _080098F8
	b _08009906
_080098AE:
	adds r5, #3
	mov r8, r5
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	subs r6, r5, r0
	cmp r6, #0
	bgt _08009906
	movs r6, #1
	b _08009906
_080098C2:
	subs r5, #5
	mov r8, r5
	adds r0, r4, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, r8
	cmp r0, #0x1d
	ble _080098DA
	movs r0, #0x1d
	subs r6, r0, r4
	b _08009906
_080098DA:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	mov r1, r8
	subs r6, r1, r0
	b _08009906
_080098E6:
	movs r6, #9
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	movs r0, #8
	mov r8, r0
	movs r1, #0x10
	mov sl, r1
	b _08009906
_080098F8:
	movs r6, #1
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	mov r8, r4
	movs r0, #0x10
	mov sl, r0
_08009906:
	ldr r5, _08009988 @ =0x08B909B8
	ldr r1, [r5]
	adds r0, r6, #1
	strb r0, [r1, #0xc]
	ldr r1, [r5]
	mov r0, sb
	adds r0, #1
	strb r0, [r1, #0xd]
	ldr r1, [sp, #4]
	str r1, [sp]
	movs r0, #1
	adds r1, r6, #0
	mov r2, sb
	adds r3, r4, #0
	bl PutTalkBubbleTm
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08009948
	movs r0, #1
	ands r0, r1
	bl TalkToggleInvertedPalette
	ldr r1, [r5]
	adds r1, #0x83
	movs r0, #2
	ldrb r2, [r1]
	eors r0, r2
	strb r0, [r1]
_08009948:
	ldr r1, [r5]
	adds r1, #0x83
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08009962
	movs r0, #1
	mov r1, r8
	mov r2, sl
	adds r3, r7, #0
	bl PutTalkBubbleTail
_08009962:
	adds r0, r6, #0
	mov r1, sb
	adds r2, r4, #0
	ldr r3, [sp, #4]
	bl sub_08009A10
	bl StartOpenTalkBubble
	movs r0, #2
	bl TalkBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009988: .4byte 0x08B909B8

	thumb_func_start StartOpenTalkBubble
StartOpenTalkBubble: @ 0x0800998C
	push {lr}
	ldr r0, _080099A0 @ =0x08B90B8C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080099A0: .4byte 0x08B90B8C

	thumb_func_start sub_080099A4
sub_080099A4: @ 0x080099A4
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _08009A08 @ =0x08193DDC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x64
	ldrh r1, [r5]
	adds r2, r1, #1
	strh r2, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08009A00
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #2
	add r0, sp
	ldr r4, [r0]
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08009A0C @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldrh r5, [r5]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x11
	adds r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0
	bne _08009A00
	adds r0, r6, #0
	bl Proc_Break
_08009A00:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009A08: .4byte 0x08193DDC
_08009A0C: .4byte 0x06000200

	thumb_func_start sub_08009A10
sub_08009A10: @ 0x08009A10
	push {r4, r5, r6, lr}
	ldr r4, _08009A8C @ =0x03002870
	mov ip, r4
	movs r4, #0x20
	mov r5, ip
	ldrb r5, [r5, #1]
	orrs r4, r5
	movs r5, #0x41
	rsbs r5, r5, #0
	ands r4, r5
	movs r5, #0x7f
	ands r4, r5
	mov r6, ip
	strb r4, [r6, #1]
	adds r4, r0, #1
	lsls r4, r4, #3
	mov r5, ip
	adds r5, #0x2d
	strb r4, [r5]
	adds r4, r1, #1
	lsls r4, r4, #3
	adds r5, #4
	strb r4, [r5]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #3
	mov r2, ip
	adds r2, #0x2c
	strb r0, [r2]
	adds r1, r1, r3
	subs r1, #1
	lsls r1, r1, #3
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x34
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r1]
	ands r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009A8C: .4byte 0x03002870

	thumb_func_start PutTalkBubbleTail
PutTalkBubbleTail: @ 0x08009A90
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl GetBgTilemap
	adds r3, r0, #0
	cmp r6, #5
	bls _08009AA4
	b _08009C06
_08009AA4:
	lsls r0, r6, #2
	ldr r1, _08009AB0 @ =_08009AB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009AB0: .4byte _08009AB4
_08009AB4: @ jump table
	.4byte _08009ACC @ case 0
	.4byte _08009B00 @ case 1
	.4byte _08009B38 @ case 2
	.4byte _08009B6C @ case 3
	.4byte _08009BA4 @ case 4
	.4byte _08009BDC @ case 5
_08009ACC:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08009AF4 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _08009AF8 @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009AFC @ =0x00003416
	adds r1, r3, #0
	strh r1, [r0]
	adds r2, #1
	b _08009C02
	.align 2, 0
_08009AF4: .4byte 0x00003014
_08009AF8: .4byte 0x00003414
_08009AFC: .4byte 0x00003416
_08009B00:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08009B28 @ =0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _08009B2C @ =0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009B30 @ =0x00003015
	adds r1, r3, #0
	strh r1, [r0]
	ldr r2, _08009B34 @ =0x00003016
	b _08009C02
	.align 2, 0
_08009B28: .4byte 0x00003014
_08009B2C: .4byte 0x00003414
_08009B30: .4byte 0x00003015
_08009B34: .4byte 0x00003016
_08009B38:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009B60 @ =0x00003418
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009B64 @ =0x00003419
	adds r1, r3, #0
	strh r1, [r0]
	subs r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009B68 @ =0x00003C17
	b _08009C02
	.align 2, 0
_08009B60: .4byte 0x00003418
_08009B64: .4byte 0x00003419
_08009B68: .4byte 0x00003C17
_08009B6C:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009B94 @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009B98 @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08009B9C @ =0x00003018
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009BA0 @ =0x00003019
	b _08009C02
	.align 2, 0
_08009B94: .4byte 0x00003017
_08009B98: .4byte 0x00003817
_08009B9C: .4byte 0x00003018
_08009BA0: .4byte 0x00003019
_08009BA4:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009BCC @ =0x00003C19
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009BD0 @ =0x00003C18
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, _08009BD4 @ =0x00003417
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009BD8 @ =0x00003C17
	b _08009C02
	.align 2, 0
_08009BCC: .4byte 0x00003C19
_08009BD0: .4byte 0x00003C18
_08009BD4: .4byte 0x00003417
_08009BD8: .4byte 0x00003C17
_08009BDC:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, _08009C0C @ =0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _08009C10 @ =0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	adds r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, _08009C14 @ =0x00003818
_08009C02:
	adds r1, r2, #0
	strh r1, [r0, #2]
_08009C06:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009C0C: .4byte 0x00003017
_08009C10: .4byte 0x00003817
_08009C14: .4byte 0x00003818

	thumb_func_start PutTalkBubbleTm
PutTalkBubbleTm: @ 0x08009C18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r1
	str r2, [sp]
	adds r5, r3, #0
	ldr r4, [sp, #0x28]
	bl GetBgTilemap
	adds r7, r0, #0
	subs r5, #1
	subs r4, #1
	mov r0, r8
	adds r3, r0, r5
	cmp r8, r3
	bge _08009C70
	ldr r1, _08009D30 @ =0x00003011
	mov sb, r1
	ldr r2, [sp]
	adds r0, r2, r4
	mov r6, r8
	lsls r1, r6, #1
	lsls r0, r0, #6
	adds r0, r0, r7
	adds r2, r1, r0
	ldr r6, [sp]
	lsls r0, r6, #6
	adds r0, r0, r7
	adds r1, r1, r0
	ldr r6, _08009D34 @ =0x00003811
	adds r0, r6, #0
	mov r6, r8
	subs r3, r3, r6
_08009C60:
	mov r6, sb
	strh r6, [r1]
	strh r0, [r2]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08009C60
_08009C70:
	ldr r3, [sp]
	add r5, r8
	mov ip, r5
	lsls r0, r3, #5
	str r0, [sp, #4]
	adds r4, r4, r3
	mov sb, r4
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r3, sb
	bge _08009CB4
	ldr r2, _08009D38 @ =0x00003012
	adds r6, r2, #0
	ldr r4, _08009D3C @ =0x00003412
	adds r5, r4, #0
	lsls r0, r3, #6
	mov r2, ip
	lsls r1, r2, #1
	adds r1, r1, r7
	adds r2, r0, r1
	mov r4, r8
	lsls r1, r4, #1
	adds r1, r1, r7
	adds r0, r0, r1
	mov r1, sb
	subs r3, r1, r3
_08009CA6:
	strh r6, [r0]
	strh r5, [r2]
	adds r2, #0x40
	adds r0, #0x40
	subs r3, #1
	cmp r3, #0
	bne _08009CA6
_08009CB4:
	mov r3, sl
	cmp r3, ip
	bge _08009CE6
	mov r5, sb
	mov sl, ip
_08009CBE:
	ldr r2, [sp]
	adds r2, #1
	adds r4, r3, #1
	cmp r2, r5
	bge _08009CE0
	ldr r0, _08009D40 @ =0x00003013
	adds r6, r0, #0
	lsls r1, r2, #6
	lsls r0, r3, #1
	adds r0, r0, r7
	adds r0, r1, r0
	subs r2, r5, r2
_08009CD6:
	strh r6, [r0]
	adds r0, #0x40
	subs r2, #1
	cmp r2, #0
	bne _08009CD6
_08009CE0:
	adds r3, r4, #0
	cmp r3, sl
	blt _08009CBE
_08009CE6:
	ldr r0, [sp, #4]
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r2, _08009D44 @ =0x00003010
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [sp, #4]
	add r0, ip
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _08009D48 @ =0x00003410
	adds r1, r3, #0
	strh r1, [r0]
	mov r4, sb
	lsls r1, r4, #5
	mov r6, r8
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _08009D4C @ =0x00003810
	adds r2, r3, #0
	strh r2, [r0]
	add r1, ip
	lsls r1, r1, #1
	adds r1, r1, r7
	ldr r4, _08009D50 @ =0x00003C10
	adds r0, r4, #0
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009D30: .4byte 0x00003011
_08009D34: .4byte 0x00003811
_08009D38: .4byte 0x00003012
_08009D3C: .4byte 0x00003412
_08009D40: .4byte 0x00003013
_08009D44: .4byte 0x00003010
_08009D48: .4byte 0x00003410
_08009D4C: .4byte 0x00003810
_08009D50: .4byte 0x00003C10

	thumb_func_start sub_08009D54
sub_08009D54: @ 0x08009D54
	bx lr
	.align 2, 0

	thumb_func_start sub_08009D58
sub_08009D58: @ 0x08009D58
	push {r4, lr}
	movs r1, #0
	str r1, [r0, #0x58]
	movs r0, #0x80
	lsls r0, r0, #1
	bl CheckTalkFlag
	adds r4, r0, #0
	cmp r4, #0
	bne _08009DB4
	ldr r2, _08009DBC @ =0x030028AC
	ldr r0, _08009DC0 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08009DC4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r1, #0x20
	ldrb r0, [r2, #1]
	orrs r0, r1
	strb r0, [r2, #1]
	adds r3, r2, #0
	subs r3, #8
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
	subs r0, r2, #6
	ldrb r3, [r0]
	orrs r1, r3
	strb r1, [r0]
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	strb r4, [r2, #8]
	movs r0, #0x10
	strb r0, [r2, #9]
	strb r4, [r2, #0xa]
_08009DB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009DBC: .4byte 0x030028AC
_08009DC0: .4byte 0x0000FFE0
_08009DC4: .4byte 0x0000E0FF

	thumb_func_start TalkOpen_PutTalkBubble
TalkOpen_PutTalkBubble: @ 0x08009DC8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r2, r4, #0
	adds r2, #0x68
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r3, r4, #0
	adds r3, #0x6a
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl PutTalkBubble
	adds r0, r4, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08009DFC
sub_08009DFC: @ 0x08009DFC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, [r5, #0x58]
	adds r3, #1
	str r3, [r5, #0x58]
	movs r1, #0x1e
	rsbs r1, r1, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #0x80
	lsls r0, r0, #1
	bl CheckTalkFlag
	adds r6, r0, #0
	cmp r6, #0
	bne _08009E64
	ldr r3, _08009E78 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #1
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
_08009E64:
	ldr r0, [r5, #0x58]
	cmp r0, #0xc
	bne _08009E70
	adds r0, r5, #0
	bl Proc_Break
_08009E70:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009E78: .4byte 0x03002870

	thumb_func_start StartTalkOpen
StartTalkOpen: @ 0x08009E7C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08009ED8 @ =0x08B90B9C
	bl Proc_StartBlocking
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetTalkFaceHPos
	adds r2, r4, #0
	adds r2, #0x64
	strh r0, [r2]
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #8
	strh r0, [r1]
	ldr r3, _08009EDC @ =0x08B909B8
	ldr r0, [r3]
	ldrb r1, [r0, #0xe]
	adds r0, r4, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6a
	movs r0, #6
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08009EBC
	movs r0, #0
	strh r0, [r2]
_08009EBC:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x1d
	ble _08009EC8
	movs r0, #0x1e
	strh r0, [r2]
_08009EC8:
	ldr r0, [r3]
	strb r5, [r0, #0xf]
	ldr r1, [r3]
	ldrb r0, [r1, #0xe]
	strb r0, [r1, #0x10]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009ED8: .4byte 0x08B90B9C
_08009EDC: .4byte 0x08B909B8

	thumb_func_start sub_08009EE0
sub_08009EE0: @ 0x08009EE0
	ldr r0, _08009EFC @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	ldrb r2, [r1, #0x11]
	cmp r0, r2
	bne _08009F00
	ldrb r0, [r1, #0x10]
	ldrb r2, [r1, #0xe]
	cmp r0, r2
	bne _08009F00
	movs r0, #1
	b _08009F02
	.align 2, 0
_08009EFC: .4byte 0x08B909B8
_08009F00:
	movs r0, #0
_08009F02:
	bx lr

	thumb_func_start GetTalkFaceHPos
GetTalkFaceHPos: @ 0x08009F04
	push {r4, lr}
	adds r4, r0, #0
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009F1E
	cmp r4, #2
	bgt _08009F1A
	movs r0, #4
	b _08009F26
_08009F1A:
	movs r0, #0x1a
	b _08009F26
_08009F1E:
	ldr r0, _08009F2C @ =0x08B90BCC
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
_08009F26:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08009F2C: .4byte 0x08B90BCC

	thumb_func_start SetTalkFaceDisp
SetTalkFaceDisp: @ 0x08009F30
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08009F80 @ =0x08193DF8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r5, #0xff
	beq _08009F76
	ldr r4, _08009F84 @ =0x08B909B8
	ldr r0, [r4]
	lsls r5, r5, #2
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	bl GetFaceDisp
	movs r1, #0x39
	rsbs r1, r1, #0
	ands r1, r0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	orrs r1, r6
	ldrb r2, [r2, #0x17]
	lsls r2, r2, #2
	add r2, sp
	ldr r2, [r2]
	orrs r1, r2
	bl SetFaceDisp
_08009F76:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009F80: .4byte 0x08193DF8
_08009F84: .4byte 0x08B909B8

	thumb_func_start SetTalkFaceMouthMove
SetTalkFaceMouthMove: @ 0x08009F88
	push {lr}
	movs r1, #0x10
	bl SetTalkFaceDisp
	pop {r0}
	bx r0

	thumb_func_start SetTalkFaceNoMouthMove
SetTalkFaceNoMouthMove: @ 0x08009F94
	push {lr}
	movs r1, #0
	bl SetTalkFaceDisp
	pop {r0}
	bx r0

	thumb_func_start IsTalkActive
IsTalkActive: @ 0x08009FA0
	push {lr}
	ldr r0, _08009FB4 @ =0x08B909D4
	bl Proc_Find
	cmp r0, #0
	beq _08009FAE
	movs r0, #1
_08009FAE:
	pop {r1}
	bx r1
	.align 2, 0
_08009FB4: .4byte 0x08B909D4

	thumb_func_start FaceExists
FaceExists: @ 0x08009FB8
	push {lr}
	ldr r0, _08009FCC @ =0x08B907C0
	bl Proc_Find
	cmp r0, #0
	beq _08009FC6
	movs r0, #1
_08009FC6:
	pop {r1}
	bx r1
	.align 2, 0
_08009FCC: .4byte 0x08B907C0

	thumb_func_start GetTalkChoiceResult
GetTalkChoiceResult: @ 0x08009FD0
	ldr r0, _08009FD8 @ =0x030000E0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08009FD8: .4byte 0x030000E0

	thumb_func_start SetTalkChoiceResult
SetTalkChoiceResult: @ 0x08009FDC
	ldr r1, _08009FE4 @ =0x030000E0
	str r0, [r1]
	bx lr
	.align 2, 0
_08009FE4: .4byte 0x030000E0

	thumb_func_start SetTalkNumber
SetTalkNumber: @ 0x08009FE8
	ldr r1, _08009FF0 @ =0x08B909B8
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_08009FF0: .4byte 0x08B909B8

	thumb_func_start SetTalkUnkStr
SetTalkUnkStr: @ 0x08009FF4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800A008 @ =0x08B909B8
	ldr r0, [r0]
	adds r0, #0x60
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_0800A008: .4byte 0x08B909B8

	thumb_func_start PrintStringToTexts
PrintStringToTexts: @ 0x0800A00C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r4, r1, #0
	str r2, [sp]
	mov sb, r3
	movs r6, #0
	mov r7, sl
	adds r5, r2, #0
	b _0800A032
_0800A028:
	ldr r0, [r7]
	adds r1, r4, #0
	bl Text_DrawCharacter
	adds r4, r0, #0
_0800A032:
	movs r0, #0
	mov r8, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0800A058
	cmp r0, #1
	bne _0800A052
	ldm r7!, {r0}
	adds r1, r5, #0
	bl PutText
	adds r5, #0x80
	adds r6, #1
	adds r4, #1
	cmp r6, sb
	bge _0800A068
_0800A052:
	mov r2, r8
	cmp r2, #0
	beq _0800A028
_0800A058:
	lsls r0, r6, #2
	add r0, sl
	ldr r0, [r0]
	lsls r1, r6, #7
	ldr r2, [sp]
	adds r1, r2, r1
	bl PutText
_0800A068:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start TalkPutSpriteText_OnIdle
TalkPutSpriteText_OnIdle: @ 0x0800A078
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r0, _0800A0EC @ =0x08B90C06
	mov ip, r0
	movs r3, #0x52
	adds r3, r3, r7
	mov sb, r3
	ldr r4, _0800A0F0 @ =0x000003FF
	mov sl, r4
	ldrh r6, [r3]
	ands r4, r6
	movs r0, #0x64
	adds r0, r0, r7
	mov r8, r0
	movs r5, #0xf
	adds r0, r5, #0
	mov r3, r8
	ldrh r3, [r3]
	ands r0, r3
	lsls r0, r0, #0xc
	orrs r4, r0
	str r4, [sp]
	movs r0, #3
	mov r3, ip
	bl PutSprite
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, _0800A0F4 @ =0x08B90BEC
	mov r6, sl
	mov r4, sb
	ldrh r4, [r4]
	ands r6, r4
	ldr r0, _0800A0F8 @ =0x030000E8
	ldrh r0, [r0, #0x14]
	ands r5, r0
	lsls r5, r5, #0xc
	orrs r6, r5
	str r6, [sp]
	movs r0, #3
	bl PutSprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A0EC: .4byte 0x08B90C06
_0800A0F0: .4byte 0x000003FF
_0800A0F4: .4byte 0x08B90BEC
_0800A0F8: .4byte 0x030000E8

	thumb_func_start sub_0800A0FC
sub_0800A0FC: @ 0x0800A0FC
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_0800A108
sub_0800A108: @ 0x0800A108
	push {lr}
	ldr r0, _0800A118 @ =sub_0800A0FC
	movs r1, #1
	bl CallDelayed
	pop {r0}
	bx r0
	.align 2, 0
_0800A118: .4byte sub_0800A0FC

	thumb_func_start GetStrTalkLen
GetStrTalkLen: @ 0x0800A11C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r0, _0800A150 @ =0x08B909B8
	ldr r0, [r0]
	movs r1, #0xf
	ldrsb r1, [r0, r1]
	mov sb, r1
	ldrb r5, [r0, #0x11]
	movs r6, #0
	movs r7, #0x18
_0800A13E:
	ldrb r0, [r4]
	cmp r0, #0x81
	bls _0800A146
	b _0800A4B2
_0800A146:
	lsls r0, r0, #2
	ldr r1, _0800A154 @ =_0800A158
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A150: .4byte 0x08B909B8
_0800A154: .4byte _0800A158
_0800A158: @ jump table
	.4byte _0800A360 @ case 0
	.4byte _0800A36A @ case 1
	.4byte _0800A36A @ case 2
	.4byte _0800A376 @ case 3
	.4byte _0800A372 @ case 4
	.4byte _0800A372 @ case 5
	.4byte _0800A372 @ case 6
	.4byte _0800A372 @ case 7
	.4byte _0800A37A @ case 8
	.4byte _0800A37A @ case 9
	.4byte _0800A37A @ case 10
	.4byte _0800A37A @ case 11
	.4byte _0800A37A @ case 12
	.4byte _0800A37A @ case 13
	.4byte _0800A37A @ case 14
	.4byte _0800A37A @ case 15
	.4byte _0800A380 @ case 16
	.4byte _0800A39E @ case 17
	.4byte _0800A3A4 @ case 18
	.4byte _0800A3A4 @ case 19
	.4byte _0800A3A4 @ case 20
	.4byte _0800A3A4 @ case 21
	.4byte _0800A372 @ case 22
	.4byte _0800A372 @ case 23
	.4byte _0800A3AC @ case 24
	.4byte _0800A3AC @ case 25
	.4byte _0800A3AC @ case 26
	.4byte _0800A3AC @ case 27
	.4byte _0800A372 @ case 28
	.4byte _0800A4B2 @ case 29
	.4byte _0800A4B2 @ case 30
	.4byte _0800A4B2 @ case 31
	.4byte _0800A4B2 @ case 32
	.4byte _0800A4B2 @ case 33
	.4byte _0800A4B2 @ case 34
	.4byte _0800A4B2 @ case 35
	.4byte _0800A4B2 @ case 36
	.4byte _0800A4B2 @ case 37
	.4byte _0800A4B2 @ case 38
	.4byte _0800A4B2 @ case 39
	.4byte _0800A4B2 @ case 40
	.4byte _0800A4B2 @ case 41
	.4byte _0800A4B2 @ case 42
	.4byte _0800A4B2 @ case 43
	.4byte _0800A4B2 @ case 44
	.4byte _0800A4B2 @ case 45
	.4byte _0800A4B2 @ case 46
	.4byte _0800A4B2 @ case 47
	.4byte _0800A4B2 @ case 48
	.4byte _0800A4B2 @ case 49
	.4byte _0800A4B2 @ case 50
	.4byte _0800A4B2 @ case 51
	.4byte _0800A4B2 @ case 52
	.4byte _0800A4B2 @ case 53
	.4byte _0800A4B2 @ case 54
	.4byte _0800A4B2 @ case 55
	.4byte _0800A4B2 @ case 56
	.4byte _0800A4B2 @ case 57
	.4byte _0800A4B2 @ case 58
	.4byte _0800A4B2 @ case 59
	.4byte _0800A4B2 @ case 60
	.4byte _0800A4B2 @ case 61
	.4byte _0800A4B2 @ case 62
	.4byte _0800A4B2 @ case 63
	.4byte _0800A4B2 @ case 64
	.4byte _0800A4B2 @ case 65
	.4byte _0800A4B2 @ case 66
	.4byte _0800A4B2 @ case 67
	.4byte _0800A4B2 @ case 68
	.4byte _0800A4B2 @ case 69
	.4byte _0800A4B2 @ case 70
	.4byte _0800A4B2 @ case 71
	.4byte _0800A4B2 @ case 72
	.4byte _0800A4B2 @ case 73
	.4byte _0800A4B2 @ case 74
	.4byte _0800A4B2 @ case 75
	.4byte _0800A4B2 @ case 76
	.4byte _0800A4B2 @ case 77
	.4byte _0800A4B2 @ case 78
	.4byte _0800A4B2 @ case 79
	.4byte _0800A4B2 @ case 80
	.4byte _0800A4B2 @ case 81
	.4byte _0800A4B2 @ case 82
	.4byte _0800A4B2 @ case 83
	.4byte _0800A4B2 @ case 84
	.4byte _0800A4B2 @ case 85
	.4byte _0800A4B2 @ case 86
	.4byte _0800A4B2 @ case 87
	.4byte _0800A4B2 @ case 88
	.4byte _0800A4B2 @ case 89
	.4byte _0800A4B2 @ case 90
	.4byte _0800A4B2 @ case 91
	.4byte _0800A4B2 @ case 92
	.4byte _0800A4B2 @ case 93
	.4byte _0800A4B2 @ case 94
	.4byte _0800A4B2 @ case 95
	.4byte _0800A4B2 @ case 96
	.4byte _0800A4B2 @ case 97
	.4byte _0800A4B2 @ case 98
	.4byte _0800A4B2 @ case 99
	.4byte _0800A4B2 @ case 100
	.4byte _0800A4B2 @ case 101
	.4byte _0800A4B2 @ case 102
	.4byte _0800A4B2 @ case 103
	.4byte _0800A4B2 @ case 104
	.4byte _0800A4B2 @ case 105
	.4byte _0800A4B2 @ case 106
	.4byte _0800A4B2 @ case 107
	.4byte _0800A4B2 @ case 108
	.4byte _0800A4B2 @ case 109
	.4byte _0800A4B2 @ case 110
	.4byte _0800A4B2 @ case 111
	.4byte _0800A4B2 @ case 112
	.4byte _0800A4B2 @ case 113
	.4byte _0800A4B2 @ case 114
	.4byte _0800A4B2 @ case 115
	.4byte _0800A4B2 @ case 116
	.4byte _0800A4B2 @ case 117
	.4byte _0800A4B2 @ case 118
	.4byte _0800A4B2 @ case 119
	.4byte _0800A4B2 @ case 120
	.4byte _0800A4B2 @ case 121
	.4byte _0800A4B2 @ case 122
	.4byte _0800A4B2 @ case 123
	.4byte _0800A4B2 @ case 124
	.4byte _0800A4B2 @ case 125
	.4byte _0800A4B2 @ case 126
	.4byte _0800A4B2 @ case 127
	.4byte _0800A3B0 @ case 128
	.4byte _0800A4A6 @ case 129
_0800A360:
	cmp r6, r7
	bgt _0800A366
	b _0800A4D8
_0800A366:
	adds r7, r6, #0
	b _0800A4D8
_0800A36A:
	cmp r6, r7
	ble _0800A370
	adds r7, r6, #0
_0800A370:
	movs r6, #0
_0800A372:
	adds r4, #1
	b _0800A13E
_0800A376:
	adds r6, #0xc
	b _0800A372
_0800A37A:
	ldrb r5, [r4]
	subs r5, #8
	b _0800A372
_0800A380:
	ldrb r0, [r4]
	cmp r0, #8
	bge _0800A388
	b _0800A13E
_0800A388:
	cmp r0, #0xf
	ble _0800A392
	cmp r0, #0x10
	beq _0800A39A
	b _0800A13E
_0800A392:
	adds r5, r0, #0
	subs r5, #8
	adds r4, #1
	b _0800A380
_0800A39A:
	adds r4, #3
	b _0800A380
_0800A39E:
	cmp r5, sb
	beq _0800A360
	b _0800A372
_0800A3A4:
	mov r2, r8
	cmp r2, #0
	beq _0800A360
	b _0800A372
_0800A3AC:
	adds r6, #0x50
	b _0800A372
_0800A3B0:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0x25
	bls _0800A3BA
	b _0800A13E
_0800A3BA:
	lsls r0, r0, #2
	ldr r1, _0800A3C4 @ =_0800A3C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A3C4: .4byte _0800A3C8
_0800A3C8: @ jump table
	.4byte _0800A372 @ case 0
	.4byte _0800A372 @ case 1
	.4byte _0800A372 @ case 2
	.4byte _0800A372 @ case 3
	.4byte _0800A372 @ case 4
	.4byte _0800A460 @ case 5
	.4byte _0800A486 @ case 6
	.4byte _0800A372 @ case 7
	.4byte _0800A372 @ case 8
	.4byte _0800A372 @ case 9
	.4byte _0800A4A0 @ case 10
	.4byte _0800A4A0 @ case 11
	.4byte _0800A4A0 @ case 12
	.4byte _0800A4A0 @ case 13
	.4byte _0800A4A0 @ case 14
	.4byte _0800A4A0 @ case 15
	.4byte _0800A4A0 @ case 16
	.4byte _0800A4A0 @ case 17
	.4byte _0800A13E @ case 18
	.4byte _0800A13E @ case 19
	.4byte _0800A13E @ case 20
	.4byte _0800A13E @ case 21
	.4byte _0800A372 @ case 22
	.4byte _0800A372 @ case 23
	.4byte _0800A372 @ case 24
	.4byte _0800A372 @ case 25
	.4byte _0800A372 @ case 26
	.4byte _0800A372 @ case 27
	.4byte _0800A372 @ case 28
	.4byte _0800A372 @ case 29
	.4byte _0800A372 @ case 30
	.4byte _0800A372 @ case 31
	.4byte _0800A47C @ case 32
	.4byte _0800A372 @ case 33
	.4byte _0800A13E @ case 34
	.4byte _0800A13E @ case 35
	.4byte _0800A372 @ case 36
	.4byte _0800A372 @ case 37
_0800A460:
	ldr r0, _0800A478 @ =0x08B909B8
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	mov r1, sp
	bl NumberToStringAscii
	mov r0, r8
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sp
	b _0800A492
	.align 2, 0
_0800A478: .4byte 0x08B909B8
_0800A47C:
	bl GetTacticianName
	bl GetStringTextLen
	b _0800A496
_0800A486:
	ldr r0, _0800A49C @ =0x08B909B8
	ldr r0, [r0]
	adds r0, #0x60
	mov r2, r8
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
_0800A492:
	bl GetStrTalkLen
_0800A496:
	adds r6, r6, r0
	b _0800A372
	.align 2, 0
_0800A49C: .4byte 0x08B909B8
_0800A4A0:
	ldrb r5, [r4]
	subs r5, #0xa
	b _0800A372
_0800A4A6:
	ldrb r0, [r4, #1]
	cmp r0, #0x40
	bne _0800A4B2
	adds r4, #2
	adds r6, #6
	b _0800A13E
_0800A4B2:
	cmp r5, sb
	beq _0800A4C8
	cmp r5, #0xff
	beq _0800A4C8
	mov r1, r8
	cmp r1, #0
	beq _0800A4C2
	b _0800A360
_0800A4C2:
	movs r2, #1
	mov r8, r2
	mov sb, r5
_0800A4C8:
	add r1, sp, #0x20
	adds r0, r4, #0
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	adds r6, r6, r0
	b _0800A13E
_0800A4D8:
	adds r0, r7, #0
	add sp, #0x24
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800A4E8
sub_0800A4E8: @ 0x0800A4E8
	movs r0, #0
	bx lr

	thumb_func_start sub_0800A4EC
sub_0800A4EC: @ 0x0800A4EC
	bx lr
	.align 2, 0

	thumb_func_start TalkBgSync
TalkBgSync: @ 0x0800A4F0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	bl CheckTalkFlag
	cmp r0, #0
	bne _0800A504
	adds r0, r4, #0
	bl EnableBgSync
_0800A504:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
