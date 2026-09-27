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

	thumb_func_start sub_080080D8
sub_080080D8: @ 0x080080D8
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

	thumb_func_start sub_080080F4
sub_080080F4: @ 0x080080F4
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
	bl sub_08009F94
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

	thumb_func_start sub_080081E4
sub_080081E4: @ 0x080081E4
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
	bl SpawnProc
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
	bl sub_08009F94
	adds r0, r6, #0
	bl sub_080085BC
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
	bl sub_08008478
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
	bl sub_080BE594
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
	bl sub_080BE594
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
	bl sub_0800A11C
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
	bl sub_08009E7C
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
	bl SpawnProcLocking
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
	bl sub_08005590
	movs r0, #1
	bl sub_0800A4F0
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x15]
_08008458:
	ldr r1, [r6]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _08008466
	ldrb r0, [r1, #0x11]
	bl sub_08009F88
_08008466:
	movs r0, #0
_08008468:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008470: .4byte 0x030000C8
_08008474: .4byte 0x02022C60

	thumb_func_start sub_08008478
sub_08008478: @ 0x08008478
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
	bl SpawnProcLocking
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

	thumb_func_start sub_080084B0
sub_080084B0: @ 0x080084B0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080084C0 @ =0x08B90A04
	bl SpawnProcLocking
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

	thumb_func_start sub_08008578
sub_08008578: @ 0x08008578
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

	thumb_func_start sub_080085BC
sub_080085BC: @ 0x080085BC
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
	bl sub_0800A11C
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
	bl SpawnProcLocking
	adds r4, r0, #0
	movs r0, #4
	bl sub_08009744
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
	bl SpawnProcLocking
	b _080088F4
	.align 2, 0
_080088EC: .4byte 0x08B90ACC
_080088F0:
	bl sub_080097FC
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
	bl sub_08005570
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
	bl sub_080092BC
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
	bl SpawnProcLocking
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	bl sub_08009744
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
	bl sub_08008E28
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
	bl sub_08009F94
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
	bl sub_080084B0
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
	bl sub_08014590
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
	bl sub_0802E6E4
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
	bl sub_08008FC8
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0xa
_08008D26:
	bl sub_08008E28
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
	bl sub_08007A44
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
	bl sub_08007ADC
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

	thumb_func_start sub_08008E28
sub_08008E28: @ 0x08008E28
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
	bl sub_08008E28
_08008E4A:
	bl sub_0804B1EC
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
	bl sub_08009F04
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
	bl GetUnitFid
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
	bl sub_08009F04
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
	bl sub_0800751C
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

	thumb_func_start sub_08008F18
sub_08008F18: @ 0x08008F18
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

	thumb_func_start sub_08008F38
sub_08008F38: @ 0x08008F38
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

	thumb_func_start sub_08008FC8
sub_08008FC8: @ 0x08008FC8
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
	bl sub_0800903C
_08008FF2:
	adds r2, r7, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800903C
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

	thumb_func_start sub_0800903C
sub_0800903C: @ 0x0800903C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	bl sub_08009F04
	lsls r0, r0, #3
	bl sub_08008F38
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
	bl SpawnProc
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
	bl sub_08009F04
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
	bl sub_08009F04
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
	bl sub_08009F04
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
	bl sub_08009F04
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
	bl sub_08012FE8
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
	bl sub_080069F4
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
	bl sub_080069F4
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

	thumb_func_start sub_080092BC
sub_080092BC: @ 0x080092BC
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080092E4 @ =0x08B90A4C
	adds r1, r3, #0
	bl SpawnProcLocking
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

	thumb_func_start sub_080092E8
sub_080092E8: @ 0x080092E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08009318 @ =0x08B90A4C
	adds r1, r4, #0
	bl SpawnProcLocking
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
	bl TmFillRect_t
	movs r0, #1
	bl sub_0800A4F0
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

	thumb_func_start sub_08009388
sub_08009388: @ 0x08009388
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
	bl sub_08009798
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
	bl sub_08005570
	adds r4, r0, #0
	movs r0, #0x10
	adds r0, r0, r4
	mov r8, r0
	ldrh r0, [r7]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	mov r1, r8
	ldr r2, [sp, #0x1c]
	bl Text_InsertDrawString
	adds r4, #0x38
	ldrh r0, [r7, #8]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	bl Text_InsertDrawString
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08005590
	movs r0, #1
	bl sub_0800A4F0
	ldr r0, _08009474 @ =0x08B90B0C
	ldr r1, [sp, #0x20]
	bl SpawnProcLocking
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
	bl sub_080BE594
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
	bl sub_080BE594
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
	bl sub_080BE594
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
	bl sub_080BE594
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
	bl sub_08049F58
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
	bl TmFillRect_t
	movs r0, #1
	bl sub_0800A4F0
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
	bl sub_08005590
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
	bl TmFillRect_t
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
	bl sub_0800A4F0
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
	bl sub_0800A534
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

	thumb_func_start sub_08009744
sub_08009744: @ 0x08009744
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
	bl sub_0800A4F0
	bl sub_08009798
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

	thumb_func_start sub_08009798
sub_08009798: @ 0x08009798
	push {r4, r5, r6, lr}
	ldr r0, _080097F0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl sub_0800A4F0
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

	thumb_func_start sub_080097FC
sub_080097FC: @ 0x080097FC
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

	thumb_func_start sub_08009850
sub_08009850: @ 0x08009850
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
	bl sub_0804B1EC
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
	bl sub_08009C18
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08009948
	movs r0, #1
	ands r0, r1
	bl sub_08008578
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
	bl sub_08009A90
_08009962:
	adds r0, r6, #0
	mov r1, sb
	adds r2, r4, #0
	ldr r3, [sp, #4]
	bl sub_08009A10
	bl sub_0800998C
	movs r0, #2
	bl sub_0800A4F0
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

	thumb_func_start sub_0800998C
sub_0800998C: @ 0x0800998C
	push {lr}
	ldr r0, _080099A0 @ =0x08B90B8C
	movs r1, #3
	bl SpawnProc
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

	thumb_func_start sub_08009A90
sub_08009A90: @ 0x08009A90
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl sub_08002BE8
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

	thumb_func_start sub_08009C18
sub_08009C18: @ 0x08009C18
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
	bl sub_08002BE8
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

	thumb_func_start sub_08009DC8
sub_08009DC8: @ 0x08009DC8
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
	bl sub_08009850
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
	bl sub_08012FE8
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

	thumb_func_start sub_08009E7C
sub_08009E7C: @ 0x08009E7C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08009ED8 @ =0x08B90B9C
	bl SpawnProcLocking
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08009F04
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

	thumb_func_start sub_08009F04
sub_08009F04: @ 0x08009F04
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804B1EC
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

	thumb_func_start sub_08009F30
sub_08009F30: @ 0x08009F30
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
	bl sub_08006D9C
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
	bl sub_08006D68
_08009F76:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009F80: .4byte 0x08193DF8
_08009F84: .4byte 0x08B909B8

	thumb_func_start sub_08009F88
sub_08009F88: @ 0x08009F88
	push {lr}
	movs r1, #0x10
	bl sub_08009F30
	pop {r0}
	bx r0

	thumb_func_start sub_08009F94
sub_08009F94: @ 0x08009F94
	push {lr}
	movs r1, #0
	bl sub_08009F30
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

	thumb_func_start GetTalkResult
GetTalkResult: @ 0x08009FD0
	ldr r0, _08009FD8 @ =0x030000E0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08009FD8: .4byte 0x030000E0

	thumb_func_start sub_08009FDC
sub_08009FDC: @ 0x08009FDC
	ldr r1, _08009FE4 @ =0x030000E0
	str r0, [r1]
	bx lr
	.align 2, 0
_08009FE4: .4byte 0x030000E0

	thumb_func_start sub_08009FE8
sub_08009FE8: @ 0x08009FE8
	ldr r1, _08009FF0 @ =0x08B909B8
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_08009FF0: .4byte 0x08B909B8

	thumb_func_start sub_08009FF4
sub_08009FF4: @ 0x08009FF4
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

	thumb_func_start sub_0800A00C
sub_0800A00C: @ 0x0800A00C
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
	bl sub_08005590
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
	bl sub_08005590
_0800A068:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0800A078
sub_0800A078: @ 0x0800A078
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
	bl sub_080069F4
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
	bl sub_080069F4
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
	bl sub_08014B34
	pop {r0}
	bx r0
	.align 2, 0
_0800A118: .4byte sub_0800A0FC

	thumb_func_start sub_0800A11C
sub_0800A11C: @ 0x0800A11C
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
	bl sub_08014590
	mov r0, r8
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sp
	b _0800A492
	.align 2, 0
_0800A478: .4byte 0x08B909B8
_0800A47C:
	bl sub_0802E6E4
	bl sub_080055FC
	b _0800A496
_0800A486:
	ldr r0, _0800A49C @ =0x08B909B8
	ldr r0, [r0]
	adds r0, #0x60
	mov r2, r8
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
_0800A492:
	bl sub_0800A11C
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
	bl sub_08005658
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

	thumb_func_start sub_0800A4F0
sub_0800A4F0: @ 0x0800A4F0
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

	thumb_func_start sub_0800A50C
sub_0800A50C: @ 0x0800A50C
	push {lr}
	ldr r0, _0800A520 @ =0x08B90C80
	bl Proc_Find
	cmp r0, #0
	beq _0800A51A
	movs r0, #1
_0800A51A:
	pop {r1}
	bx r1
	.align 2, 0
_0800A520: .4byte 0x08B90C80

	thumb_func_start sub_0800A524
sub_0800A524: @ 0x0800A524
	push {lr}
	ldr r0, _0800A530 @ =0x08B90C80
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0800A530: .4byte 0x08B90C80

	thumb_func_start sub_0800A534
sub_0800A534: @ 0x0800A534
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _0800A56C @ =0x08B90C80
	movs r1, #0
	bl SpawnProc
	ldr r1, _0800A570 @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, _0800A574 @ =0x06010000
	adds r1, r1, r2
	str r1, [r0, #0x4c]
	str r5, [r0, #0x54]
	str r6, [r0, #0x58]
	ldr r0, _0800A578 @ =0x08B90C68
	mov r1, r8
	bl SpawnProcLocking
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A56C: .4byte 0x08B90C80
_0800A570: .4byte 0x000003FF
_0800A574: .4byte 0x06010000
_0800A578: .4byte 0x08B90C68

	thumb_func_start sub_0800A57C
sub_0800A57C: @ 0x0800A57C
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0800A584
sub_0800A584: @ 0x0800A584
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, [r3, #0x4c]
	movs r1, #0
	b _0800A5E0
_0800A58E:
	movs r2, #0
	lsls r0, r1, #2
	adds r5, r1, #0
	adds r5, #8
	adds r4, r0, r6
_0800A598:
	lsls r0, r2, #2
	adds r1, r0, r4
	ldr r0, [r1, #4]
	str r0, [r1]
	ldr r0, [r1, #8]
	str r0, [r1, #4]
	ldr r0, [r1, #0xc]
	str r0, [r1, #8]
	ldr r0, [r1, #0x10]
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldr r0, _0800A5C8 @ =0x000002FF
	cmp r2, r0
	bgt _0800A5CC
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r1, r7
	ldr r0, [r0]
	b _0800A5CE
	.align 2, 0
_0800A5C8: .4byte 0x000002FF
_0800A5CC:
	ldr r0, [r3, #0x58]
_0800A5CE:
	str r0, [r1, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	ble _0800A598
	adds r1, r5, #0
_0800A5E0:
	ldr r0, [r3, #0x54]
	lsls r0, r0, #3
	cmp r1, r0
	blt _0800A58E
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0800A600
	adds r0, r3, #0
	bl Proc_Break
_0800A600:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A608
sub_0800A608: @ 0x0800A608
	ldr r1, _0800A614 @ =0x08B90C98
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0800A614: .4byte 0x08B90C98

	thumb_func_start LoadUnitWrapper
LoadUnitWrapper: @ 0x0800A618
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	bl UnitInfoRequiresNoMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800A6F8
	movs r0, #6
	ldrb r1, [r5, #3]
	ands r0, r1
	cmp r0, #0
	beq _0800A662
	movs r6, #0
	ldrb r0, [r5]
	movs r1, #0
	bl sub_08017D70
	adds r4, r0, #0
	cmp r4, #0
	beq _0800A66E
	ldrb r2, [r5, #3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0800A658
	cmp r0, #1
	ble _0800A65A
	cmp r0, #2
	bne _0800A65A
	movs r6, #0x80
	b _0800A65A
_0800A658:
	movs r6, #0x40
_0800A65A:
	adds r0, r4, #0
	adds r1, r6, #0
	bl UnitChangeFaction
_0800A662:
	ldrb r0, [r5]
	bl GetUnitByPid
	adds r4, r0, #0
	cmp r4, #0
	bne _0800A682
_0800A66E:
	adds r0, r5, #0
	bl CreateUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800A6B4
_0800A682:
	adds r0, r4, #0
	bl sub_08079954
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800A69E
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080178F4
	ldr r0, [r4, #0xc]
	ldr r1, _0800A700 @ =0xFFFEFFFF
	ands r0, r1
	str r0, [r4, #0xc]
_0800A69E:
	adds r0, r4, #0
	bl sub_08079A14
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800A6B4
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800A6F8
_0800A6B4:
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x11]
	ldr r1, _0800A704 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0800A6E8
	ldrb r0, [r1, #0x1b]
	cmp r0, #3
	bne _0800A6E8
	movs r0, #6
	ldrb r2, [r5, #3]
	ands r0, r2
	cmp r0, #4
	bne _0800A6E8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetChapterInfo
	ldrb r1, [r0, #0x14]
	adds r0, r4, #0
	bl sub_08017B4C
_0800A6E8:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_0800A71C
	bl RefreshEntityMaps
_0800A6F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A700: .4byte 0xFFFEFFFF
_0800A704: .4byte 0x0202BBF8

	thumb_func_start FakeLoadUnit
FakeLoadUnit: @ 0x0800A708
	push {lr}
	movs r2, #0
	movs r3, #0
	bl sub_0800A71C
	bl RefreshEntityMaps
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A71C
sub_0800A71C: @ 0x0800A71C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r6, #0
	beq _0800A796
	cmp r3, #0
	beq _0800A786
	cmp r7, #0
	beq _0800A774
	ldr r5, [r6, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0800A774
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r6, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	ldr r0, _0800A770 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r2, [r4, #4]
	ands r1, r2
	ldrh r2, [r4, #6]
	ands r0, r2
	cmp r1, r0
	beq _0800A796
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #7]
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	bl TryMoveUnitDisplayed
	b _0800A796
	.align 2, 0
_0800A770: .4byte 0x0000FFFF
_0800A774:
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	adds r0, r6, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	b _0800A796
_0800A786:
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	adds r0, r6, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
_0800A796:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800A7A0
sub_0800A7A0: @ 0x0800A7A0
	ldr r0, _0800A7B4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0800A7B8
	movs r0, #0
	b _0800A7BA
	.align 2, 0
_0800A7B4: .4byte 0x08B857F8
_0800A7B8:
	movs r0, #1
_0800A7BA:
	bx lr

	thumb_func_start sub_0800A7BC
sub_0800A7BC: @ 0x0800A7BC
	ldr r1, _0800A7C8 @ =0x03000100
	movs r0, #0
	str r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_0800A7C8: .4byte 0x03000100

	thumb_func_start sub_0800A7CC
sub_0800A7CC: @ 0x0800A7CC
	ldr r0, _0800A7DC @ =0x08B90C9C
	ldr r2, _0800A7E0 @ =0x03000100
	ldr r1, [r2]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, #1
	str r1, [r2]
	bx lr
	.align 2, 0
_0800A7DC: .4byte 0x08B90C9C
_0800A7E0: .4byte 0x03000100

	thumb_func_start sub_0800A7E4
sub_0800A7E4: @ 0x0800A7E4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r4, #0
	ldr r5, [r6, #0x2c]
	b _0800A906
_0800A7F0:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #0xb
	bls _0800A7FA
	b _0800A904
_0800A7FA:
	lsls r0, r0, #2
	ldr r1, _0800A804 @ =_0800A808
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A804: .4byte _0800A808
_0800A808: @ jump table
	.4byte _0800A900 @ case 0
	.4byte _0800A8C4 @ case 1
	.4byte _0800A8D8 @ case 2
	.4byte _0800A8EC @ case 3
	.4byte _0800A8AC @ case 4
	.4byte _0800A898 @ case 5
	.4byte _0800A8A4 @ case 6
	.4byte _0800A904 @ case 7
	.4byte _0800A854 @ case 8
	.4byte _0800A874 @ case 9
	.4byte _0800A842 @ case 10
	.4byte _0800A838 @ case 11
_0800A838:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	adds r0, #0x48
	strh r1, [r0]
	b _0800A904
_0800A842:
	ldr r0, _0800A850 @ =0x0300010C
	ldr r0, [r0]
	mov r1, sp
	bl sub_08014590
	lsls r0, r0, #3
	b _0800A902
	.align 2, 0
_0800A850: .4byte 0x0300010C
_0800A854:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _0800A870 @ =0x03000108
	ldrh r0, [r0]
	bl GetItemIcon
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #0
	b _0800A88A
	.align 2, 0
_0800A870: .4byte 0x03000108
_0800A874:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _0800A894 @ =0x03000108
	ldrh r0, [r0]
	adds r0, #0x70
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #1
_0800A88A:
	bl sub_08004D44
	adds r4, #0x10
	b _0800A904
	.align 2, 0
_0800A894: .4byte 0x03000108
_0800A898:
	ldr r0, [r5, #4]
	bl GetMsg
	bl sub_080055FC
	b _0800A902
_0800A8A4:
	ldr r0, [r5, #4]
	bl sub_080055FC
	b _0800A902
_0800A8AC:
	ldr r0, _0800A8C0 @ =0x03000104
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	bl sub_080055FC
	b _0800A902
	.align 2, 0
_0800A8C0: .4byte 0x03000104
_0800A8C4:
	ldr r0, _0800A8D4 @ =0x03000108
	ldrh r0, [r0]
	bl GetItemName
	bl sub_080055FC
	b _0800A902
	.align 2, 0
_0800A8D4: .4byte 0x03000108
_0800A8D8:
	ldr r0, _0800A8E8 @ =0x03000108
	ldrh r0, [r0]
	movs r1, #1
	bl GetItemNameWithArticle
	bl sub_080055FC
	b _0800A902
	.align 2, 0
_0800A8E8: .4byte 0x03000108
_0800A8EC:
	ldr r0, _0800A8FC @ =0x03000108
	ldrh r0, [r0]
	movs r1, #0
	bl GetItemNameWithArticle
	bl sub_080055FC
	b _0800A902
	.align 2, 0
_0800A8FC: .4byte 0x03000108
_0800A900:
	ldr r0, [r5, #4]
_0800A902:
	adds r4, r4, r0
_0800A904:
	adds r5, #8
_0800A906:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800A90E
	b _0800A7F0
_0800A90E:
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0800A918
sub_0800A918: @ 0x0800A918
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	b _0800AA02
_0800A924:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #0xa
	bhi _0800AA00
	lsls r0, r0, #2
	ldr r1, _0800A938 @ =_0800A93C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A938: .4byte _0800A93C
_0800A93C: @ jump table
	.4byte _0800A9F8 @ case 0
	.4byte _0800A9BC @ case 1
	.4byte _0800A9CC @ case 2
	.4byte _0800A9DC @ case 3
	.4byte _0800A9A8 @ case 4
	.4byte _0800A994 @ case 5
	.4byte _0800A99E @ case 6
	.4byte _0800A98A @ case 7
	.4byte _0800A980 @ case 8
	.4byte _0800A980 @ case 9
	.4byte _0800A968 @ case 10
_0800A968:
	ldr r0, _0800A97C @ =0x0300010C
	ldr r0, [r0]
	mov r1, sp
	bl sub_08014590
	add r0, sp, #0x10
	mov r1, sp
	bl Text_DrawString
	b _0800AA00
	.align 2, 0
_0800A97C: .4byte 0x0300010C
_0800A980:
	add r0, sp, #0x10
	movs r1, #0x10
	bl Text_Skip
	b _0800AA00
_0800A98A:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_SetColor
	b _0800AA00
_0800A994:
	add r4, sp, #0x10
	ldr r0, [r5, #4]
	bl GetMsg
	b _0800A9E8
_0800A99E:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_DrawString
	b _0800AA00
_0800A9A8:
	add r4, sp, #0x10
	ldr r0, _0800A9B8 @ =0x03000104
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	b _0800A9E8
	.align 2, 0
_0800A9B8: .4byte 0x03000104
_0800A9BC:
	add r4, sp, #0x10
	ldr r0, _0800A9C8 @ =0x03000108
	ldrh r0, [r0]
	bl GetItemName
	b _0800A9E8
	.align 2, 0
_0800A9C8: .4byte 0x03000108
_0800A9CC:
	add r4, sp, #0x10
	ldr r0, _0800A9D8 @ =0x03000108
	ldrh r0, [r0]
	movs r1, #1
	b _0800A9E4
	.align 2, 0
_0800A9D8: .4byte 0x03000108
_0800A9DC:
	add r4, sp, #0x10
	ldr r0, _0800A9F4 @ =0x03000108
	ldrh r0, [r0]
	movs r1, #0
_0800A9E4:
	bl GetItemNameWithArticle
_0800A9E8:
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	b _0800AA00
	.align 2, 0
_0800A9F4: .4byte 0x03000108
_0800A9F8:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_Skip
_0800AA00:
	adds r5, #8
_0800AA02:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800A924
	movs r0, #3
	bl EnableBgSync
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800AA18
sub_0800AA18: @ 0x0800AA18
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x35
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800AA48 @ =0x0000FFFF
	strh r0, [r3, #0x3e]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0800AA48: .4byte 0x0000FFFF

	thumb_func_start sub_0800AA4C
sub_0800AA4C: @ 0x0800AA4C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _0800AAB4 @ =0x06002000
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	movs r3, #0
	bl InitTextFont
	bl ClearIcons
	bl LoadUiFrameGraphics
	ldr r3, _0800AAB8 @ =0x03002870
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
	adds r0, r4, #0
	bl sub_0800A7E4
	adds r4, #0x46
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AAB4: .4byte 0x06002000
_0800AAB8: .4byte 0x03002870

	thumb_func_start sub_0800AABC
sub_0800AABC: @ 0x0800AABC
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800AAD4
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
_0800AAD4:
	pop {r0}
	bx r0

	thumb_func_start sub_0800AAD8
sub_0800AAD8: @ 0x0800AAD8
	push {lr}
	adds r1, r0, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800AAF6
	ldr r0, _0800AAFC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800AAF6
	ldrh r0, [r1]
	bl sub_080BE594
_0800AAF6:
	pop {r0}
	bx r0
	.align 2, 0
_0800AAFC: .4byte 0x0202BBF8

	thumb_func_start sub_0800AB00
sub_0800AB00: @ 0x0800AB00
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800AB18
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
_0800AB18:
	pop {r0}
	bx r0

	thumb_func_start sub_0800AB1C
sub_0800AB1C: @ 0x0800AB1C
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	ldr r2, _0800AB34 @ =0x08B905B8
	adds r0, #0x4a
	ldrh r3, [r0]
	adds r0, r4, #0
	bl PutOamHiRam
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AB34: .4byte 0x08B905B8

	thumb_func_start sub_0800AB38
sub_0800AB38: @ 0x0800AB38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	bl sub_0800A7E4
	adds r2, r5, #0
	adds r2, #0x46
	strh r0, [r2]
	lsls r1, r0, #0x10
	lsrs r6, r1, #0x13
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	beq _0800AB5E
	adds r6, #1
_0800AB5E:
	lsls r0, r6, #3
	ldrh r2, [r2]
	subs r0, r0, r2
	asrs r0, r0, #1
	mov sb, r0
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800AB82
	movs r0, #0x1e
	subs r0, r0, r6
	asrs r0, r0, #1
	subs r7, r0, #1
	b _0800AB86
_0800AB82:
	movs r7, #0
	ldrsb r7, [r2, r7]
_0800AB86:
	adds r2, r5, #0
	adds r2, #0x35
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	movs r3, #8
	mov r8, r3
	cmp r1, r0
	beq _0800AB9E
	adds r2, r1, #0
	mov r8, r2
_0800AB9E:
	adds r4, r6, #2
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #4
	bl sub_08049CE4
	movs r0, #0x37
	adds r0, r0, r5
	mov sl, r0
	strb r7, [r0]
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp, #0xc]
	mov r2, r8
	strb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, #2
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x44
	ldrb r0, [r4]
	add r0, sb
	strb r0, [r4]
	add r0, sp, #4
	adds r1, r6, #0
	bl InitText
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	add r0, sp, #4
	bl Text_SetColor
	add r0, sp, #4
	mov r1, sb
	bl Text_SetCursor
	ldr r0, [r5, #0x2c]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_0800A918
	ldr r6, _0800AC80 @ =0x0000FFFF
	ldrh r3, [r5, #0x3e]
	cmp r3, r6
	beq _0800AC16
	ldrh r0, [r5, #0x3e]
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	bl sub_08004E98
_0800AC16:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _0800AC84 @ =0x02022C60
	adds r1, r1, r0
	add r0, sp, #4
	bl sub_08005590
	bl ResetText
	ldrh r0, [r5, #0x3e]
	cmp r0, r6
	beq _0800AC6E
	ldr r0, _0800AC88 @ =0x08B90D00
	adds r1, r5, #0
	bl SpawnProc
	mov r2, sl
	ldrb r1, [r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r4, [r4]
	adds r1, r4, r1
	str r1, [r0, #0x2c]
	ldr r3, [sp, #0xc]
	ldrb r1, [r3]
	adds r1, #1
	lsls r1, r1, #3
	str r1, [r0, #0x30]
	adds r3, r5, #0
	adds r3, #0x40
	adds r2, r5, #0
	adds r2, #0x42
	movs r1, #0xf
	ldrb r2, [r2]
	ands r1, r2
	lsls r1, r1, #0xc
	ldrh r3, [r3]
	orrs r1, r3
	adds r0, #0x4a
	strh r1, [r0]
_0800AC6E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AC80: .4byte 0x0000FFFF
_0800AC84: .4byte 0x02022C60
_0800AC88: .4byte 0x08B90D00

	thumb_func_start sub_0800AC8C
sub_0800AC8C: @ 0x0800AC8C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	bge _0800ACAC
	ldr r0, _0800ACA8 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0800ACBE
	adds r0, r1, #0
	bl Proc_Break
	b _0800ACBE
	.align 2, 0
_0800ACA8: .4byte 0x08B857F8
_0800ACAC:
	cmp r0, #0
	beq _0800ACBE
	subs r0, #1
	str r0, [r1, #0x30]
	cmp r0, #0
	bne _0800ACBE
	adds r0, r1, #0
	bl Proc_Break
_0800ACBE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800ACC4
sub_0800ACC4: @ 0x0800ACC4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r2, #0
	adds r5, #0x38
	ldrb r1, [r5]
	lsls r0, r1, #5
	adds r7, r2, #0
	adds r7, #0x37
	ldrb r1, [r7]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _0800AD14 @ =0x02022C60
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x39
	ldrb r1, [r6]
	adds r4, r2, #0
	adds r4, #0x3a
	ldrb r2, [r4]
	movs r3, #0
	bl TmFillRect_t
	ldrb r5, [r5]
	lsls r0, r5, #5
	ldrb r7, [r7]
	adds r0, r7, r0
	lsls r0, r0, #1
	ldr r1, _0800AD18 @ =0x02023460
	adds r0, r0, r1
	ldrb r1, [r6]
	ldrb r2, [r4]
	movs r3, #0
	bl TmFillRect_t
	movs r0, #3
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AD14: .4byte 0x02022C60
_0800AD18: .4byte 0x02023460

	thumb_func_start sub_0800AD1C
sub_0800AD1C: @ 0x0800AD1C
	ldr r1, _0800AD24 @ =0x03000104
	str r0, [r1]
	bx lr
	.align 2, 0
_0800AD24: .4byte 0x03000104

	thumb_func_start sub_0800AD28
sub_0800AD28: @ 0x0800AD28
	ldr r1, _0800AD30 @ =0x03000108
	strh r0, [r1]
	bx lr
	.align 2, 0
_0800AD30: .4byte 0x03000108

	thumb_func_start sub_0800AD34
sub_0800AD34: @ 0x0800AD34
	ldr r1, _0800AD3C @ =0x0300010C
	str r0, [r1]
	bx lr
	.align 2, 0
_0800AD3C: .4byte 0x0300010C

	thumb_func_start sub_0800AD40
sub_0800AD40: @ 0x0800AD40
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #0x90
	lsls r5, r5, #2
	movs r4, #4
	str r4, [sp]
	str r3, [sp, #4]
	adds r3, r5, #0
	bl sub_0800AD5C
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800AD5C
sub_0800AD5C: @ 0x0800AD5C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq _0800AD78
	ldr r0, _0800AD74 @ =0x08B90CA0
	bl SpawnProcLocking
	b _0800AD80
	.align 2, 0
_0800AD74: .4byte 0x08B90CA0
_0800AD78:
	ldr r0, _0800ADA4 @ =0x08B90CA0
	movs r1, #3
	bl SpawnProc
_0800AD80:
	adds r1, r0, #0
	str r4, [r1, #0x30]
	str r5, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x36
	strb r6, [r0]
	adds r0, #0xa
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	adds r0, #0x10
	adds r2, r1, #0
	adds r2, #0x42
	strb r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800ADA4: .4byte 0x08B90CA0

	thumb_func_start sub_0800ADA8
sub_0800ADA8: @ 0x0800ADA8
	push {lr}
	ldr r0, _0800ADB4 @ =0x08B90CA0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0800ADB4: .4byte 0x08B90CA0

	thumb_func_start sub_0800ADB8
sub_0800ADB8: @ 0x0800ADB8
	push {lr}
	ldr r0, _0800ADC8 @ =0x08B90D88
	ldr r1, _0800ADCC @ =sub_0800ADD0
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_0800ADC8: .4byte 0x08B90D88
_0800ADCC: .4byte sub_0800ADD0

	thumb_func_start sub_0800ADD0
sub_0800ADD0: @ 0x0800ADD0
	push {lr}
	bl EvtCmd_NoSkip
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Event_FadeOutOfBackgroundTalk
Event_FadeOutOfBackgroundTalk: @ 0x0800ADDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800ADEC @ =0x08B90D08
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0800ADEC: .4byte 0x08B90D08

	thumb_func_start Event_FadeOutOfSkip
Event_FadeOutOfSkip: @ 0x0800ADF0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800AE00 @ =0x08B90D68
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0800AE00: .4byte 0x08B90D68

	thumb_func_start sub_0800AE04
sub_0800AE04: @ 0x0800AE04
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800AE14 @ =0x08B90D40
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0800AE14: .4byte 0x08B90D40

	thumb_func_start sub_0800AE18
sub_0800AE18: @ 0x0800AE18
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x14]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800AE30
	adds r0, r2, #0
	bl StartMidLockingFadeToBlack
_0800AE30:
	pop {r0}
	bx r0

	thumb_func_start sub_0800AE34
sub_0800AE34: @ 0x0800AE34
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x14]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800AE4C
	adds r0, r2, #0
	bl StartMidLockingFadeFromBlack
_0800AE4C:
	pop {r0}
	bx r0

	thumb_func_start sub_0800AE50
sub_0800AE50: @ 0x0800AE50
	push {lr}
	bl sub_0802E368
	bl UnlockBmDisplay
	bl ReleaseMus
	ldr r0, _0800AE84 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0800AE88 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl ClearTalk
	pop {r0}
	bx r0
	.align 2, 0
_0800AE84: .4byte 0x02022C60
_0800AE88: .4byte 0x02023460

	thumb_func_start sub_0800AE8C
sub_0800AE8C: @ 0x0800AE8C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	ldr r0, _0800AEDC @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0800AEE0 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl ClearTalk
	bl sub_0802E368
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800AEE4
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800AEEA
	movs r0, #0x20
	adds r1, r4, #0
	bl StartLockingFadeFromBlack
	b _0800AEEA
	.align 2, 0
_0800AEDC: .4byte 0x02022C60
_0800AEE0: .4byte 0x02023460
_0800AEE4:
	adds r0, r4, #0
	bl StartMidLockingFadeFromBlack
_0800AEEA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EventForceSlowTextSpeed
EventForceSlowTextSpeed: @ 0x0800AEF0
	adds r3, r0, #0
	adds r3, #0x68
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800AF18
	ldr r2, _0800AF1C @ =0x0202BBF8
	adds r2, #0x40
	ldrb r1, [r2]
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x1e
	strb r0, [r3]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
_0800AF18:
	bx lr
	.align 2, 0
_0800AF1C: .4byte 0x0202BBF8

	thumb_func_start sub_0800AF20
sub_0800AF20: @ 0x0800AF20
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r3, #0x68
	ldrb r4, [r3]
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800AF50
	ldr r2, _0800AF58 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r5, [r2]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xff
	orrs r0, r4
	strb r0, [r3]
_0800AF50:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800AF58: .4byte 0x0202BBF8

	thumb_func_start sub_0800AF5C
sub_0800AF5C: @ 0x0800AF5C
	push {lr}
	movs r1, #3
	bl StartEvent
	pop {r1}
	bx r1

	thumb_func_start sub_0800AF68
sub_0800AF68: @ 0x0800AF68
	push {lr}
	bl StartEvent
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartEvent
StartEvent: @ 0x0800AF74
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r6, _0800AF9C @ =0x08B90D88
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0800AFA8
	ldr r2, _0800AFA0 @ =0x03004170
	ldr r1, _0800AFA4 @ =0x03004160
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r2
	str r7, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0800B0E8
	.align 2, 0
_0800AF9C: .4byte 0x08B90D88
_0800AFA0: .4byte 0x03004170
_0800AFA4: .4byte 0x03004160
_0800AFA8:
	ldr r0, _0800AFC0 @ =0x03004160
	strb r4, [r0]
	ldr r0, _0800AFC4 @ =0x03004170
	str r4, [r0]
	cmp r5, #7
	bgt _0800AFC8
	adds r0, r6, #0
	adds r1, r5, #0
	bl SpawnProc
	b _0800AFD0
	.align 2, 0
_0800AFC0: .4byte 0x03004160
_0800AFC4: .4byte 0x03004170
_0800AFC8:
	adds r0, r6, #0
	adds r1, r5, #0
	bl SpawnProcLocking
_0800AFD0:
	adds r4, r0, #0
	str r7, [r4, #0x2c]
	str r7, [r4, #0x30]
	movs r1, #0
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
	str r1, [r4, #0x40]
	str r1, [r4, #0x3c]
	str r1, [r4, #0x48]
	adds r3, r4, #0
	adds r3, #0x5e
	movs r2, #0
	movs r0, #1
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x50
	strh r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x4c
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x68
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _0800B034 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0xc0
	bne _0800B038
	adds r0, r2, #0
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800B038
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	b _0800B03E
	.align 2, 0
_0800B034: .4byte 0x03002870
_0800B038:
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #0
_0800B03E:
	strb r0, [r1]
	ldr r0, _0800B060 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r4, #0x30]
	ldr r0, [r0]
	subs r0, #0x86
	cmp r0, #7
	bhi _0800B0E8
	lsls r0, r0, #2
	ldr r1, _0800B064 @ =_0800B068
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B060: .4byte 0x0202E3F4
_0800B064: .4byte _0800B068
_0800B068: @ jump table
	.4byte _0800B096 @ case 0
	.4byte _0800B0A4 @ case 1
	.4byte _0800B0B2 @ case 2
	.4byte _0800B0E8 @ case 3
	.4byte _0800B088 @ case 4
	.4byte _0800B0C0 @ case 5
	.4byte _0800B0CE @ case 6
	.4byte _0800B0DC @ case 7
_0800B088:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_SilentSkip
	b _0800B0E8
_0800B096:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkip
	b _0800B0E8
_0800B0A4:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipTalk
	b _0800B0E8
_0800B0B2:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipTalkSlow
	b _0800B0E8
_0800B0C0:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipUnlessNewGamePlus
	b _0800B0E8
_0800B0CE:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipTalkSlowUnlessNewGamePlus
	b _0800B0E8
_0800B0DC:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl EvtCmd_NoSkipSlowUnlessNewGamePlus
_0800B0E8:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800B0F0
sub_0800B0F0: @ 0x0800B0F0
	push {r4, lr}
	adds r4, r0, #0
	bl LockGame
	movs r0, #0
	str r0, [r4, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800B104
sub_0800B104: @ 0x0800B104
	push {lr}
	bl ReleaseGame
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800B110
sub_0800B110: @ 0x0800B110
	push {lr}
	adds r0, #0x5e
	movs r1, #0x10
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800B12C
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	bl LoadUiFrameGraphics
_0800B12C:
	pop {r0}
	bx r0

	thumb_func_start sub_0800B130
sub_0800B130: @ 0x0800B130
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B174 @ =0x0000FFFB
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	ldr r3, _0800B178 @ =0x03004160
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800B16E
	subs r0, #1
	strb r0, [r3]
	movs r0, #0
	str r0, [r2, #0x40]
	ldr r1, _0800B17C @ =0x03004170
	ldrb r4, [r3]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x2c]
	ldrb r3, [r3]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x30]
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_0800B16E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B174: .4byte 0x0000FFFB
_0800B178: .4byte 0x03004160
_0800B17C: .4byte 0x03004170

	thumb_func_start sub_0800B180
sub_0800B180: @ 0x0800B180
	push {lr}
	adds r0, #0x5e
	movs r1, #8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0800B192
	bl sub_0802E3B0
_0800B192:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800B198
sub_0800B198: @ 0x0800B198
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080143E0
	ldr r0, _0800B1C0 @ =0x08B90B9C
	bl Proc_EndEach
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B1B8
	bl sub_0806E144
_0800B1B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B1C0: .4byte 0x08B90B9C

	thumb_func_start Event_IsSkipAllowed
Event_IsSkipAllowed: @ 0x0800B1C4
	push {lr}
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B1E8
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0800B1E8
	bl sub_0804B1EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B1E8
	movs r0, #1
	b _0800B1EA
_0800B1E8:
	movs r0, #0
_0800B1EA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Event_DarkenThenFunc
Event_DarkenThenFunc: @ 0x0800B1F0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0800B208 @ =0x08B90E28
	bl SpawnProcLocking
	str r5, [r0, #0x50]
	str r4, [r0, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B208: .4byte 0x08B90E28

	thumb_func_start EventDarkenThenFunc_OnInit
EventDarkenThenFunc_OnInit: @ 0x0800B20C
	push {r4, lr}
	adds r4, r0, #0
	bl EventDarkenThenFunc_StartDarken
	adds r4, #0x64
	movs r0, #0x40
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EventDarkenThenFunc_OnLoop
EventDarkenThenFunc_OnLoop: @ 0x0800B220
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x50]
	bl EventDarkenThenFunc_StepDarken
	ldr r0, _0800B248 @ =0x03002870
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800B240
	ldr r0, [r4, #0x4c]
	bl sub_080BFC60
	adds r0, r4, #0
	bl Proc_Break
_0800B240:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B248: .4byte 0x03002870

	thumb_func_start EventDarkenThenFunc_StartDarken
EventDarkenThenFunc_StartDarken: @ 0x0800B24C
	push {r4, r5, r6, lr}
	ldr r1, _0800B2BC @ =0x03002870
	mov ip, r1
	mov r2, ip
	adds r2, #0x34
	movs r3, #0x20
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #2
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	subs r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0xc0
	ldrb r2, [r4]
	orrs r1, r2
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x44
	movs r5, #0
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	ldr r1, _0800B2C0 @ =0x0000FFE0
	mov r6, ip
	ldrh r6, [r6, #0x3c]
	ands r1, r6
	movs r2, #0x1f
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	ldrb r6, [r4]
	orrs r3, r6
	strb r3, [r4]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x10
	strh r1, [r2]
	adds r0, #0x66
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B2BC: .4byte 0x03002870
_0800B2C0: .4byte 0x0000FFE0

	thumb_func_start EventDarkenThenFunc_StepDarken
EventDarkenThenFunc_StepDarken: @ 0x0800B2C4
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800B2DC @ =0x03002870
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne _0800B2E0
	adds r0, r2, #0
	bl Proc_End
	b _0800B304
	.align 2, 0
_0800B2DC: .4byte 0x03002870
_0800B2E0:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0800B2FE
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_0800B2FE:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_0800B304:
	pop {r0}
	bx r0

	thumb_func_start Event_BeginSkip
Event_BeginSkip: @ 0x0800B308
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _0800B31E
	bl _call_via_r0
_0800B31E:
	adds r5, r4, #0
	adds r5, #0x5e
	movs r0, #4
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	bl sub_0800A4E8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B372
	bl sub_080B5644
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800B348
	adds r0, r4, #0
	bl sub_0800B198
	subs r5, #0x11
	b _0800B36E
_0800B348:
	movs r0, #0x20
	ldrh r5, [r5]
	ands r0, r5
	adds r5, r4, #0
	adds r5, #0x4d
	cmp r0, #0
	bne _0800B36E
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0800B366
	adds r0, r4, #0
	bl sub_0800B198
	b _0800B36E
_0800B366:
	ldr r0, _0800B38C @ =sub_0800B198
	adds r1, r4, #0
	bl Event_DarkenThenFunc
_0800B36E:
	movs r0, #1
	strb r0, [r5]
_0800B372:
	movs r0, #5
	bl Proc_LockEachMarked
	ldr r1, [r4, #0x40]
	cmp r1, #0
	beq _0800B384
	adds r0, r4, #0
	bl _call_via_r1
_0800B384:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B38C: .4byte sub_0800B198

	thumb_func_start Event_MainLoop
Event_MainLoop: @ 0x0800B390
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0800B3D8 @ =0x08B969E4
	bl Proc_Find
	cmp r0, #0
	bne _0800B494
	bl IsSubtitleHelpActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B494
	bl IsMapFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B494
	adds r0, r4, #0
	bl Event_IsSkipAllowed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800B3E0
	ldr r0, _0800B3DC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0800B3E0
	adds r0, r4, #0
	bl Event_BeginSkip
	b _0800B494
	.align 2, 0
_0800B3D8: .4byte 0x08B969E4
_0800B3DC: .4byte 0x08B857F8
_0800B3E0:
	adds r3, r4, #0
	adds r3, #0x50
	ldrh r2, [r3]
	cmp r2, #0
	beq _0800B43C
	subs r5, r2, #1
	strh r5, [r3]
	adds r0, r4, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800B494
	ldr r0, _0800B434 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	bne _0800B412
	ldr r0, _0800B438 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0800B494
_0800B412:
	lsls r0, r5, #0x10
	cmp r0, #0
	beq _0800B494
	subs r0, r2, #2
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800B494
	subs r0, r2, #3
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800B494
	subs r0, r2, #4
	strh r0, [r3]
	b _0800B494
	.align 2, 0
_0800B434: .4byte 0x0202BBF8
_0800B438: .4byte 0x08B857F8
_0800B43C:
	ldr r1, [r4, #0x40]
	cmp r1, #0
	beq _0800B44A
	adds r0, r4, #0
	bl _call_via_r1
	b _0800B494
_0800B44A:
	adds r6, r4, #0
	adds r6, #0x56
	ldr r7, _0800B468 @ =0x08B90E48
	adds r0, r7, #4
	mov r8, r0
_0800B454:
	ldr r0, [r4, #0x30]
	ldrh r5, [r0]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0800B46C
	subs r0, #1
	strh r0, [r6]
	movs r2, #0
	b _0800B47A
	.align 2, 0
_0800B468: .4byte 0x08B90E48
_0800B46C:
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r2, r0, #0
_0800B47A:
	cmp r2, #1
	beq _0800B454
	cmp r2, #3
	beq _0800B494
	lsls r0, r5, #3
	add r0, r8
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	cmp r2, #2
	bne _0800B454
_0800B494:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Event_WaitForFaceEnd
Event_WaitForFaceEnd: @ 0x0800B4A0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800B4BC
	bl FaceExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B4C2
_0800B4BC:
	adds r0, r4, #0
	bl Proc_Break
_0800B4C2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EvtCmd_Sleep
EvtCmd_Sleep: @ 0x0800B4C8
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrh r2, [r0, #2]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B4E0
	movs r0, #0
	b _0800B4F4
_0800B4E0:
	cmp r2, #0
	ble _0800B4E6
	subs r2, #1
_0800B4E6:
	adds r0, r3, #0
	adds r0, #0x50
	movs r1, #0
	strh r2, [r0]
	subs r0, #2
	strb r1, [r0]
	movs r0, #2
_0800B4F4:
	bx lr
	.align 2, 0

	thumb_func_start EvtCmd_SleepFast
EvtCmd_SleepFast: @ 0x0800B4F8
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrh r2, [r0, #2]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B510
	movs r0, #0
	b _0800B526
_0800B510:
	cmp r2, #0
	ble _0800B516
	subs r2, #1
_0800B516:
	adds r0, r3, #0
	adds r0, #0x50
	strh r2, [r0]
	adds r1, r3, #0
	adds r1, #0x4e
	movs r0, #1
	strb r0, [r1]
	movs r0, #2
_0800B526:
	bx lr

	thumb_func_start EvtCmd_SleepText
EvtCmd_SleepText: @ 0x0800B528
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r2, #0
	adds r0, #0x5e
	ldrh r3, [r0]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	bne _0800B544
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0800B548
_0800B544:
	movs r0, #0
	b _0800B556
_0800B548:
	cmp r1, #0
	ble _0800B54E
	subs r1, #1
_0800B54E:
	adds r0, r2, #0
	adds r0, #0x50
	strh r1, [r0]
	movs r0, #2
_0800B556:
	bx lr

	thumb_func_start EvtCmd_Background
EvtCmd_Background: @ 0x0800B558
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r5, [r0, #2]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B572
	movs r0, #0
	b _0800B5AE
_0800B572:
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B58A
	bl LockBmDisplay
	bl LockMus
_0800B58A:
	adds r0, r5, #0
	bl DisplayBackground
	strb r5, [r4]
	ldr r2, _0800B5B4 @ =0x03002870
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
	movs r0, #2
_0800B5AE:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800B5B4: .4byte 0x03002870

	thumb_func_start EvtCmd_BackgroundLynModeDeath
EvtCmd_BackgroundLynModeDeath: @ 0x0800B5B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0800B5E0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x95
	ldrb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B5E4
	movs r0, #0
	b _0800B632
	.align 2, 0
_0800B5E0: .4byte 0x0202BBF8
_0800B5E4:
	bl GetLynModeDeathFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B5F8
	movs r0, #0x2c
	bl OverrideBgm
	bl SetLynModeDeathFlag
_0800B5F8:
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B60E
	bl LockBmDisplay
	bl LockMus
_0800B60E:
	adds r0, r5, #0
	bl DisplayBackground
	strb r5, [r4]
	ldr r2, _0800B638 @ =0x03002870
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
	movs r0, #2
_0800B632:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800B638: .4byte 0x03002870

	thumb_func_start EvtCmd_BackgroundRandom
EvtCmd_BackgroundRandom: @ 0x0800B63C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800B668
	bl RandNextB
	movs r1, #0x5b
	bl __umodsi3
	adds r4, r0, #0
	bl DisplayBackground
	adds r0, r5, #0
	adds r0, #0x4c
	strb r4, [r0]
	movs r0, #2
	b _0800B66A
_0800B668:
	movs r0, #0
_0800B66A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_BackgroundMore
EvtCmd_BackgroundMore: @ 0x0800B670
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r5, [r0, #2]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B68A
	movs r0, #0
	b _0800B6AC
_0800B68A:
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B6A2
	bl LockBmDisplay
	bl LockMus
_0800B6A2:
	adds r0, r5, #0
	bl DisplayBackgroundNoClear
	strb r5, [r4]
	movs r0, #2
_0800B6AC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_ClearTalk
EvtCmd_ClearTalk: @ 0x0800B6B4
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800B6D4
	adds r0, r2, #0
	bl Event_FadeOutOfBackgroundTalk
	movs r0, #0xff
	strb r0, [r4]
	b _0800B6F4
_0800B6D4:
	adds r0, r2, #0
	bl EventClearTalkDisplayed
	ldr r2, _0800B6FC @ =0x03002870
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
_0800B6F4:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800B6FC: .4byte 0x03002870

	thumb_func_start EvtCmd_ClearSkip
EvtCmd_ClearSkip: @ 0x0800B700
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _0800B718
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B71C
_0800B718:
	movs r0, #0
	b _0800B734
_0800B71C:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0800B732
	adds r0, r4, #0
	bl Event_FadeOutOfSkip
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0xff
	strb r0, [r1]
_0800B732:
	movs r0, #2
_0800B734:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_ClearSkipFadeToPrep
EvtCmd_ClearSkipFadeToPrep: @ 0x0800B73C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4c
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, r6
	beq _0800B758
	bl UnlockBmDisplay
	bl ReleaseMus
_0800B758:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800B784
	ldr r0, _0800B780 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800B7C4
	adds r0, r4, #0
	bl Event_FadeOutOfSkip
	b _0800B7C4
	.align 2, 0
_0800B780: .4byte 0x0202BBF8
_0800B784:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, r6
	bne _0800B7AC
	ldr r0, _0800B7A8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0800B7C4
	adds r0, r4, #0
	bl StartMidLockingFadeToBlack
	b _0800B7C4
	.align 2, 0
_0800B7A8: .4byte 0x0202BBF8
_0800B7AC:
	ldr r0, _0800B7CC @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800B7C4
	adds r0, r4, #0
	bl Event_FadeOutOfSkip
_0800B7C4:
	movs r0, #2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800B7CC: .4byte 0x0202BBF8

	thumb_func_start EvtCmd_FadeFromOpening
EvtCmd_FadeFromOpening: @ 0x0800B7D0
	push {r4, lr}
	adds r4, r0, #0
	bl LockBmDisplay
	bl LockMus
	adds r0, r4, #0
	bl Event_FadeOutOfBackgroundTalk
	adds r4, #0x4c
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start DisplayBackground
DisplayBackground: @ 0x0800B7F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ClearTalk
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
	ldr r5, _0800B874 @ =0x08B91588
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r6, [r0]
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r6, #0
	bl Decompress
	ldr r0, _0800B878 @ =0x02024460
	adds r1, r5, #4
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_t
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	ldr r1, _0800B87C @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B874: .4byte 0x08B91588
_0800B878: .4byte 0x02024460
_0800B87C: .4byte 0x02022860

	thumb_func_start DisplayBackgroundNoClear
DisplayBackgroundNoClear: @ 0x0800B880
	push {r4, r5, r6, lr}
	adds r6, r0, #0
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
	ldr r5, _0800B900 @ =0x08B91588
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r6, [r0]
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r6, #0
	bl Decompress
	ldr r0, _0800B904 @ =0x02024460
	adds r1, r5, #4
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_t
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	ldr r1, _0800B908 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B900: .4byte 0x08B91588
_0800B904: .4byte 0x02024460
_0800B908: .4byte 0x02022860

	thumb_func_start EventStartTalk
EventStartTalk: @ 0x0800B90C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _0800B922
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
_0800B922:
	adds r4, r5, #0
	adds r4, #0x5e
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0800B93A
	adds r0, r5, #0
	bl EventForceSlowTextSpeed
_0800B93A:
	movs r0, #1
	movs r1, #1
	adds r2, r6, #0
	bl StartTalkMsg
	movs r0, #0x80
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0800B954
	movs r0, #4
	bl SetTalkFlag
_0800B954:
	adds r0, r7, #0
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _0800B964
	movs r0, #8
	bl SetTalkFlag
_0800B964:
	ldr r0, _0800B970 @ =EventTalkWait
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B970: .4byte EventTalkWait

	thumb_func_start EvtCmd_Talk
EvtCmd_Talk: @ 0x0800B974
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B99C @ =0x0000FFFD
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B9A0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
	b _0800B9A2
	.align 2, 0
_0800B99C: .4byte 0x0000FFFD
_0800B9A0:
	movs r0, #0
_0800B9A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_TalkOpaque
EvtCmd_TalkOpaque: @ 0x0800B9A8
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B9D8 @ =0x0000FFFD
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B9DC
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetTalkFlag
	movs r0, #2
	b _0800B9DE
	.align 2, 0
_0800B9D8: .4byte 0x0000FFFD
_0800B9DC:
	movs r0, #0
_0800B9DE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_TalkByMode
EvtCmd_TalkByMode: @ 0x0800B9E4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BA00 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BA04
	movs r0, #0
	b _0800BA36
	.align 2, 0
_0800BA00: .4byte 0x0000FFFD
_0800BA04:
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	ldr r0, _0800BA24 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800BA28
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BA34
	.align 2, 0
_0800BA24: .4byte 0x0202BBF8
_0800BA28:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BA34:
	movs r0, #2
_0800BA36:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkSetFuncBroken
EvtCmd_TalkSetFuncBroken: @ 0x0800BA3C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BA5A
	ldr r0, [r2, #0x30]
	adds r0, #4
	bl SetTalkFunc
	movs r0, #2
	b _0800BA5C
_0800BA5A:
	movs r0, #0
_0800BA5C:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkMore
EvtCmd_TalkMore: @ 0x0800BA60
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BA88
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800BA88
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
	movs r0, #2
	b _0800BA8A
_0800BA88:
	movs r0, #0
_0800BA8A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_TalkMoreByMode
EvtCmd_TalkMoreByMode: @ 0x0800BA90
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BAA8
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BAAC
_0800BAA8:
	movs r0, #0
	b _0800BAD6
_0800BAAC:
	ldr r0, _0800BAC4 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800BAC8
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BAD4
	.align 2, 0
_0800BAC4: .4byte 0x0202BBF8
_0800BAC8:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #8]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
_0800BAD4:
	movs r0, #2
_0800BAD6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_TalkAuto
EvtCmd_TalkAuto: @ 0x0800BADC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BAFC
	ldr r1, [r2, #0x48]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
	b _0800BAFE
_0800BAFC:
	movs r0, #0
_0800BAFE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_TalkContinue
EvtCmd_TalkContinue: @ 0x0800BB04
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BB28
	bl ResumeTalk
	ldr r0, _0800BB24 @ =EventTalkWait
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800BB2E
	.align 2, 0
_0800BB24: .4byte EventTalkWait
_0800BB28:
	bl EndTalk
	movs r0, #0
_0800BB2E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkGeneric
EvtCmd_TalkGeneric: @ 0x0800BB34
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800BB6C @ =0x0000FFFD
	ldrh r4, [r1]
	ands r0, r4
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BB74
	ldr r0, _0800BB70 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, [r0]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
	b _0800BB76
	.align 2, 0
_0800BB6C: .4byte 0x0000FFFD
_0800BB70: .4byte 0x03004690
_0800BB74:
	movs r0, #0
_0800BB76:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkMoreGeneric
EvtCmd_TalkMoreGeneric: @ 0x0800BB7C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r3, [r0, #4]
	adds r0, r2, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BBBC
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800BBBC
	ldr r0, _0800BBB8 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, [r0]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
	movs r0, #2
	b _0800BBBE
	.align 2, 0
_0800BBB8: .4byte 0x03004690
_0800BBBC:
	movs r0, #0
_0800BBBE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_TalkByTactRank
EvtCmd_TalkByTactRank: @ 0x0800BBC4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r5, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BBE4 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BBE8
	movs r0, #0
	b _0800BC4E
	.align 2, 0
_0800BBE4: .4byte 0x0000FFFD
_0800BBE8:
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	cmp r0, #4
	bhi _0800BC2C
	lsls r0, r0, #2
	ldr r1, _0800BBFC @ =_0800BC00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800BBFC: .4byte _0800BC00
_0800BC00: @ jump table
	.4byte _0800BC14 @ case 0
	.4byte _0800BC1A @ case 1
	.4byte _0800BC20 @ case 2
	.4byte _0800BC26 @ case 3
	.4byte _0800BC2C @ case 4
_0800BC14:
	bl sub_080B62F4
	b _0800BC30
_0800BC1A:
	bl sub_080B63EC
	b _0800BC30
_0800BC20:
	bl sub_080B6424
	b _0800BC30
_0800BC26:
	bl sub_080B651C
	b _0800BC30
_0800BC2C:
	bl sub_080B6550
_0800BC30:
	movs r1, #0
	cmp r0, #2
	bgt _0800BC3E
	movs r1, #1
	cmp r0, #1
	bgt _0800BC3E
	movs r1, #2
_0800BC3E:
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
_0800BC4E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkByTactGender
EvtCmd_TalkByTactGender: @ 0x0800BC54
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BC70 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BC74
	movs r0, #0
	b _0800BC9A
	.align 2, 0
_0800BC70: .4byte 0x0000FFFD
_0800BC74:
	bl IsTactFemale
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BC8C
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BC98
_0800BC8C:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BC98:
	movs r0, #2
_0800BC9A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkMoreByTactGender
EvtCmd_TalkMoreByTactGender: @ 0x0800BCA0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BCB8
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BCBC
_0800BCB8:
	movs r0, #0
	b _0800BCE2
_0800BCBC:
	bl IsTactFemale
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BCD4
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BCE0
_0800BCD4:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
_0800BCE0:
	movs r0, #2
_0800BCE2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkByFlag
EvtCmd_TalkByFlag: @ 0x0800BCE8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BD04 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BD08
	movs r0, #0
	b _0800BD32
	.align 2, 0
_0800BD04: .4byte 0x0000FFFD
_0800BD08:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BD24
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BD30
_0800BD24:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BD30:
	movs r0, #2
_0800BD32:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkMoreByFlag
EvtCmd_TalkMoreByFlag: @ 0x0800BD38
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BD50
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BD54
_0800BD50:
	movs r0, #0
	b _0800BD7E
_0800BD54:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BD70
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BD7C
_0800BD70:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
_0800BD7C:
	movs r0, #2
_0800BD7E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkByFunc
EvtCmd_TalkByFunc: @ 0x0800BD84
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BDA0 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BDA4
	movs r0, #0
	b _0800BDCE
	.align 2, 0
_0800BDA0: .4byte 0x0000FFFD
_0800BDA4:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BDC0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BDCC
_0800BDC0:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BDCC:
	movs r0, #2
_0800BDCE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_TalkMoreByFunc
EvtCmd_TalkMoreByFunc: @ 0x0800BDD4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BDEC
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BDF0
_0800BDEC:
	movs r0, #0
	b _0800BE1A
_0800BDF0:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BE0C
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BE18
_0800BE0C:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
_0800BE18:
	movs r0, #2
_0800BE1A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_ClearTalkBubble
EvtCmd_ClearTalkBubble: @ 0x0800BE20
	push {lr}
	bl ClearTalkBubble
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EventTalkWait
EventTalkWait: @ 0x0800BE2C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0800BE52
	bl EndTalk
	adds r0, r4, #0
	bl sub_0800AF20
	movs r0, #0
	str r0, [r4, #0x40]
	b _0800BE6E
_0800BE52:
	bl IsTalkActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BE66
	bl IsTalkLocked
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BE6E
_0800BE66:
	adds r0, r4, #0
	bl sub_0800AF20
	str r5, [r4, #0x40]
_0800BE6E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EvtCmd_CameraCenterPosition
EvtCmd_CameraCenterPosition: @ 0x0800BE74
	push {r4, r5, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	movs r0, #0xff
	ldrh r4, [r1, #2]
	ands r4, r0
	ldrb r5, [r1, #3]
	ands r5, r0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BEA2
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BED0
_0800BEA2:
	add r3, sp, #4
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl GetCameraAdjustedCenter
	ldr r1, _0800BECC @ =0x0202BBB8
	ldr r0, [sp]
	lsls r0, r0, #4
	strh r0, [r1, #0xc]
	ldr r0, [sp, #4]
	lsls r0, r0, #4
	strh r0, [r1, #0xe]
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	bl RenderMap
	movs r0, #0
	b _0800BEE4
	.align 2, 0
_0800BECC: .4byte 0x0202BBB8
_0800BED0:
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl CameraMoveWatchPositionCenter
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	movs r0, #2
_0800BEE4:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_CameraPosition
EvtCmd_CameraPosition: @ 0x0800BEEC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	movs r0, #0xff
	ldrh r4, [r1, #2]
	ands r4, r0
	ldrb r5, [r1, #3]
	ands r5, r0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BF18
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BF40
_0800BF18:
	adds r6, r4, #0
	lsls r0, r6, #4
	bl GetCameraAdjustedX
	ldr r4, _0800BF3C @ =0x0202BBB8
	strh r0, [r4, #0xc]
	lsls r0, r5, #4
	bl GetCameraAdjustedY
	strh r0, [r4, #0xe]
	adds r0, r6, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	bl RenderMap
	movs r0, #0
	b _0800BF54
	.align 2, 0
_0800BF3C: .4byte 0x0202BBB8
_0800BF40:
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl CameraMoveWatchPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetMapCursorPosition
	movs r0, #2
_0800BF54:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_CameraPid
EvtCmd_CameraPid: @ 0x0800BF5C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl GetUnitByPid
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BF86
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800BFB8
_0800BF86:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	bl GetCameraAdjustedX
	ldr r4, _0800BFB4 @ =0x0202BBB8
	strh r0, [r4, #0xc]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	bl GetCameraAdjustedY
	strh r0, [r4, #0xe]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl SetMapCursorPosition
	bl RenderMap
	b _0800BFD2
	.align 2, 0
_0800BFB4: .4byte 0x0202BBB8
_0800BFB8:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CameraMoveWatchPosition
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl SetMapCursorPosition
_0800BFD2:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_CameraLeader
EvtCmd_CameraLeader: @ 0x0800BFDC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetLeaderPid
	bl GetUnitByPid
	adds r4, r0, #0
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl CameraMoveWatchPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start CanDisplayUnitMovement
CanDisplayUnitMovement: @ 0x0800C00C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800C03C
	ldr r0, _0800C04C @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _0800C050
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CameraMoveWatchPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C050
_0800C03C:
	bl CanStartMu
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C050
	movs r0, #1
	b _0800C052
	.align 2, 0
_0800C04C: .4byte 0x08B92E38
_0800C050:
	movs r0, #0
_0800C052:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MovePosition
EvtCmd_MovePosition: @ 0x0800C058
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C084
	ldr r0, _0800C080 @ =0x0000FFFF
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _0800C08A
	.align 2, 0
_0800C080: .4byte 0x0000FFFF
_0800C084:
	movs r4, #1
	rsbs r4, r4, #0
	mov r8, r4
_0800C08A:
	ldr r1, [r5, #0x30]
	ldrh r2, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, #0
	ands r0, r3
	movs r4, #1
	rsbs r4, r4, #0
	mov sl, r4
	cmp r0, #0
	bne _0800C0A2
	mov sl, r2
_0800C0A2:
	ldr r2, [r1, #8]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _0800C0B8
	ldr r7, _0800C0B4 @ =0x0000FFFF
	ands r7, r2
	b _0800C0BC
	.align 2, 0
_0800C0B4: .4byte 0x0000FFFF
_0800C0B8:
	movs r7, #1
	rsbs r7, r7, #0
_0800C0BC:
	ldrh r1, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, #0
	bne _0800C0D0
	mov sb, r1
_0800C0D0:
	ldr r0, _0800C0EC @ =0x0202E3DC
	ldr r1, [r0]
	mov r4, sl
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C0F0
	movs r0, #0
	b _0800C14A
	.align 2, 0
_0800C0EC: .4byte 0x0202E3DC
_0800C0F0:
	ldrb r0, [r1]
	bl GetUnit
	adds r6, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C112
	adds r0, r5, #0
	adds r0, #0x4d
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	beq _0800C126
_0800C112:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sb
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C14A
_0800C126:
	adds r0, r5, #0
	mov r1, r8
	mov r2, sl
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C148
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, sb
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C14A
_0800C148:
	movs r0, #3
_0800C14A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_MovePositionSpeed
EvtCmd_MovePositionSpeed: @ 0x0800C15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C184
	ldr r7, _0800C180 @ =0x0000FFFF
	ands r7, r1
	b _0800C188
	.align 2, 0
_0800C180: .4byte 0x0000FFFF
_0800C184:
	movs r7, #1
	rsbs r7, r7, #0
_0800C188:
	ldr r1, [r4, #0x30]
	ldrh r2, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, #0
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	mov sb, r5
	cmp r0, #0
	bne _0800C1A0
	mov sb, r2
_0800C1A0:
	ldr r2, [r1, #8]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _0800C1B4
	ldr r6, _0800C1B0 @ =0x0000FFFF
	ands r6, r2
	b _0800C1B8
	.align 2, 0
_0800C1B0: .4byte 0x0000FFFF
_0800C1B4:
	movs r6, #1
	rsbs r6, r6, #0
_0800C1B8:
	ldrh r2, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r3, #1
	rsbs r3, r3, #0
	mov r8, r3
	cmp r0, #0
	bne _0800C1CC
	mov r8, r2
_0800C1CC:
	ldrh r1, [r1, #0xc]
	mov sl, r1
	ldr r0, _0800C1E8 @ =0x0202E3DC
	ldr r1, [r0]
	mov r5, sb
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800C1EC
	movs r0, #0
	b _0800C24A
	.align 2, 0
_0800C1E8: .4byte 0x0202E3DC
_0800C1EC:
	ldrb r0, [r1]
	bl GetUnit
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C210
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C224
_0800C210:
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C24A
_0800C224:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, sb
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C248
	mov r0, sl
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C24A
_0800C248:
	movs r0, #3
_0800C24A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_MovePid
EvtCmd_MovePid: @ 0x0800C25C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r6, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C288
	ldr r7, _0800C284 @ =0x0000FFFF
	ands r7, r1
	b _0800C28C
	.align 2, 0
_0800C284: .4byte 0x0000FFFF
_0800C288:
	movs r7, #1
	rsbs r7, r7, #0
_0800C28C:
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	cmp r0, #0
	bne _0800C2A2
	mov r8, r1
_0800C2A2:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C2BC
	adds r0, r4, #0
	adds r0, #0x4d
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0800C2D0
_0800C2BC:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C2F8
_0800C2D0:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C2F6
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C2F8
_0800C2F6:
	movs r0, #3
_0800C2F8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MovePidSpeed
EvtCmd_MovePidSpeed: @ 0x0800C304
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C330
	ldr r6, _0800C32C @ =0x0000FFFF
	ands r6, r1
	b _0800C334
	.align 2, 0
_0800C32C: .4byte 0x0000FFFF
_0800C330:
	movs r6, #1
	rsbs r6, r6, #0
_0800C334:
	ldr r2, [r4, #0x30]
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, #0
	bne _0800C348
	adds r7, r1, #0
_0800C348:
	ldrh r2, [r2, #0xc]
	mov r8, r2
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C368
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C37C
_0800C368:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C3A6
_0800C37C:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C3A4
	mov r0, r8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C3A6
_0800C3A4:
	movs r0, #3
_0800C3A6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_MovePidOneStepSpeed
EvtCmd_MovePidOneStepSpeed: @ 0x0800C3B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r6, r0, #0
	ldr r0, [r7, #0x30]
	ldr r1, [r0, #8]
	ldrh r0, [r0, #0xc]
	mov r8, r0
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	cmp r1, #1
	beq _0800C3F4
	cmp r1, #1
	bgt _0800C3E6
	cmp r1, #0
	beq _0800C3F0
	b _0800C3FE
_0800C3E6:
	cmp r1, #2
	beq _0800C3F8
	cmp r1, #3
	beq _0800C3FC
	b _0800C3FE
_0800C3F0:
	subs r5, #1
	b _0800C3FE
_0800C3F4:
	adds r5, #1
	b _0800C3FE
_0800C3F8:
	subs r4, #1
	b _0800C3FE
_0800C3FC:
	adds r4, #1
_0800C3FE:
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C41A
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C42E
_0800C41A:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C458
_0800C42E:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r7, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C456
	mov r0, r8
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C458
_0800C456:
	movs r0, #3
_0800C458:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MovePidScript
EvtCmd_MovePidScript: @ 0x0800C464
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r6, [r0, #8]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C494
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C4BE
_0800C494:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	add r1, sp, #4
	mov r0, sp
	adds r2, r6, #0
	bl ApplyMoveScriptToCoordinates
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C4E4
_0800C4BE:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C4E2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl DisplayMovement
	movs r0, #0
	b _0800C4E4
_0800C4E2:
	movs r0, #3
_0800C4E4:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MovePositionScript
EvtCmd_MovePositionScript: @ 0x0800C4EC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C50C
	ldr r0, _0800C508 @ =0x0000FFFF
	ands r1, r0
	str r1, [sp]
	b _0800C512
	.align 2, 0
_0800C508: .4byte 0x0000FFFF
_0800C50C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
_0800C512:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800C524
	str r3, [sp, #4]
	b _0800C52A
_0800C524:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
_0800C52A:
	ldr r6, [r1, #8]
	ldr r0, _0800C580 @ =0x0202E3DC
	ldr r1, [r0]
	ldr r0, [sp, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C560
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C584
_0800C560:
	add r1, sp, #4
	mov r0, sp
	adds r2, r6, #0
	bl ApplyMoveScriptToCoordinates
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C5A6
	.align 2, 0
_0800C580: .4byte 0x0202E3DC
_0800C584:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C5A4
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl DisplayMovement
	movs r0, #0
	b _0800C5A6
_0800C5A4:
	movs r0, #3
_0800C5A6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_MovePidNextTo
EvtCmd_MovePidNextTo: @ 0x0800C5B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	bl GetUnitByPid
	adds r4, r0, #0
	movs r7, #0x10
	ldrsb r7, [r4, r7]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C5F4
	adds r0, r5, #0
	adds r0, #0x4d
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _0800C608
_0800C5F4:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C630
_0800C608:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C62E
	str r6, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	mov r3, r8
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C630
_0800C62E:
	movs r0, #3
_0800C630:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MoveLeader
EvtCmd_MoveLeader: @ 0x0800C63C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	bl GetLeaderPid
	bl GetUnitByPid
	adds r6, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C668
	ldr r7, _0800C664 @ =0x0000FFFF
	ands r7, r1
	b _0800C66C
	.align 2, 0
_0800C664: .4byte 0x0000FFFF
_0800C668:
	movs r7, #1
	rsbs r7, r7, #0
_0800C66C:
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	mov r8, r2
	cmp r0, #0
	bne _0800C682
	mov r8, r1
_0800C682:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C69C
	adds r0, r4, #0
	adds r0, #0x4d
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0800C6B0
_0800C69C:
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	b _0800C6D8
_0800C6B0:
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C6D6
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl TryMoveUnitDisplayed
	movs r0, #0
	b _0800C6D8
_0800C6D6:
	movs r0, #3
_0800C6D8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MovePidByFaction_PositionSpeed_Script
EvtCmd_MovePidByFaction_PositionSpeed_Script: @ 0x0800C6E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl IsPidBlue
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4, #0x30]
	ldr r6, _0800C720 @ =0x0000FFFF
	ldrh r0, [r0, #4]
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C724
	ands r1, r6
	str r1, [sp, #4]
	b _0800C72A
	.align 2, 0
_0800C720: .4byte 0x0000FFFF
_0800C724:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
_0800C72A:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800C73C
	str r3, [sp, #8]
	b _0800C742
_0800C73C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
_0800C742:
	ldrh r0, [r1, #6]
	mov sb, r0
	ldr r7, [r1, #0xc]
	mov r1, r8
	lsls r0, r1, #0x18
	adds r6, r0, #0
	cmp r6, #0
	beq _0800C76A
	ldr r1, [sp, #4]
	cmp r1, #0x63
	beq _0800C7EC
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _0800C76A
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #8]
	cmp r0, r1
	beq _0800C7EC
_0800C76A:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C786
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C7B2
_0800C786:
	cmp r6, #0
	bne _0800C7A0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #8]
	add r1, sp, #8
	add r0, sp, #4
	adds r2, r7, #0
	bl ApplyMoveScriptToCoordinates
_0800C7A0:
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r0, r5, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	b _0800C7EC
_0800C7B2:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C7CA
	movs r0, #3
	b _0800C7EE
_0800C7CA:
	cmp r6, #0
	beq _0800C7E0
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	mov r0, sb
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl TryMoveUnitDisplayed
	b _0800C7EC
_0800C7E0:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl DisplayMovement
_0800C7EC:
	movs r0, #0
_0800C7EE:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MovePidByFaction_Script_Script
EvtCmd_MovePidByFaction_Script_Script: @ 0x0800C7FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl IsPidBlue
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	mov r8, r1
	ldr r7, [r0, #0xc]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800C840
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800C878
_0800C840:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	cmp r6, #0
	bne _0800C85C
	add r1, sp, #4
	mov r0, sp
	adds r2, r7, #0
	bl ApplyMoveScriptToCoordinates
	b _0800C866
_0800C85C:
	add r1, sp, #4
	mov r0, sp
	mov r2, r8
	bl ApplyMoveScriptToCoordinates
_0800C866:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	b _0800C8AE
_0800C878:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800C890
	movs r0, #3
	b _0800C8B0
_0800C890:
	cmp r6, #0
	beq _0800C8A2
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	movs r3, #0
	bl DisplayMovement
	b _0800C8AE
_0800C8A2:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl DisplayMovement
_0800C8AE:
	movs r0, #0
_0800C8B0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MovePositionInstant
EvtCmd_MovePositionInstant: @ 0x0800C8BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C8DC
	ldr r0, _0800C8D8 @ =0x0202E3DC
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	b _0800C8E2
	.align 2, 0
_0800C8D8: .4byte 0x0202E3DC
_0800C8DC:
	ldr r0, _0800C8FC @ =0x0202E3DC
	ldr r0, [r0]
	subs r0, #4
_0800C8E2:
	ldr r1, [r0]
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C904
	ldr r0, _0800C900 @ =0x0000FFFF
	ands r2, r0
	adds r0, r1, r2
	b _0800C906
	.align 2, 0
_0800C8FC: .4byte 0x0202E3DC
_0800C900: .4byte 0x0000FFFF
_0800C904:
	subs r0, r1, #1
_0800C906:
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _0800C950
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C92C
	ldr r3, _0800C928 @ =0x0000FFFF
	ands r3, r2
	b _0800C930
	.align 2, 0
_0800C928: .4byte 0x0000FFFF
_0800C92C:
	movs r3, #1
	rsbs r3, r3, #0
_0800C930:
	ldrh r1, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, #0
	bne _0800C942
	adds r2, r1, #0
_0800C942:
	adds r0, r5, #0
	adds r1, r3, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
_0800C950:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MovePidInstant
EvtCmd_MovePidInstant: @ 0x0800C958
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C980
	ldr r1, _0800C97C @ =0x0000FFFF
	ands r1, r2
	b _0800C984
	.align 2, 0
_0800C97C: .4byte 0x0000FFFF
_0800C980:
	movs r1, #1
	rsbs r1, r1, #0
_0800C984:
	ldr r0, [r4, #0x30]
	ldrh r3, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, #0
	bne _0800C998
	adds r2, r3, #0
_0800C998:
	adds r0, r5, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_SavePositionPid
EvtCmd_SavePositionPid: @ 0x0800C9AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800C9E0
	bl GetLeaderPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CA0C
	bl GetLeaderPid
	bl GetUnitByPid
	adds r3, r0, #0
	ldr r0, _0800C9DC @ =0x0202BBF8
	ldrb r2, [r0, #0x1b]
	b _0800C9FC
	.align 2, 0
_0800C9DC: .4byte 0x0202BBF8
_0800C9E0:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CA0C
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r3, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #8]
_0800C9FC:
	ldr r0, _0800CA14 @ =0x0202A5AC
	adds r0, r2, r0
	ldrb r1, [r3, #0x10]
	strb r1, [r0]
	ldr r0, _0800CA18 @ =0x0202A5B0
	adds r0, r2, r0
	ldrb r1, [r3, #0x11]
	strb r1, [r0]
_0800CA0C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CA14: .4byte 0x0202A5AC
_0800CA18: .4byte 0x0202A5B0

	thumb_func_start EvtCmd_MovePidToSavedPosition
EvtCmd_MovePidToSavedPosition: @ 0x0800CA1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800CA54
	bl GetLeaderPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CAA8
	bl GetLeaderPid
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r0, _0800CA50 @ =0x0202BBF8
	ldrb r3, [r0, #0x1b]
	b _0800CA70
	.align 2, 0
_0800CA50: .4byte 0x0202BBF8
_0800CA54:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CAA8
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r3, [r0, #8]
_0800CA70:
	ldr r0, _0800CAAC @ =0x0202A5AC
	adds r0, r3, r0
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _0800CAB0 @ =0x0202A5B0
	adds r0, r3, r0
	ldrb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CA98
	adds r0, r4, #0
	adds r0, #0x4d
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _0800CAB4
_0800CA98:
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
_0800CAA8:
	movs r0, #0
	b _0800CADA
	.align 2, 0
_0800CAAC: .4byte 0x0202A5AC
_0800CAB0: .4byte 0x0202A5B0
_0800CAB4:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CAD8
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl TryMoveUnitDisplayed
	b _0800CAA8
_0800CAD8:
	movs r0, #3
_0800CADA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start TryMoveUnit
TryMoveUnit: @ 0x0800CAE8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	cmp r5, #0xff
	bne _0800CAFC
	movs r5, #1
	rsbs r5, r5, #0
_0800CAFC:
	cmp r2, #0xff
	bne _0800CB04
	movs r2, #1
	rsbs r2, r2, #0
_0800CB04:
	lsls r6, r5, #0x10
	lsls r3, r2, #0x10
	lsrs r0, r6, #0x10
	orrs r0, r3
	str r0, [sp]
	ldr r0, _0800CB70 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CB40
	cmp r7, #0
	beq _0800CB40
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, r5
	bne _0800CB34
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	cmp r0, r2
	beq _0800CB40
_0800CB34:
	asrs r1, r6, #0x10
	asrs r2, r3, #0x10
	adds r0, r4, #0
	mov r3, sp
	bl AiGetUnitClosestValidPosition
_0800CB40:
	mov r0, sp
	ldrh r0, [r0]
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrh r0, [r0, #2]
	strb r0, [r4, #0x11]
	adds r0, r4, #0
	bl UnitSyncMovement
	ldr r1, [r4, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CB68
	movs r0, #0xa
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0xc]
	bl RefreshEntityMaps
_0800CB68:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CB70: .4byte 0x0202E3E0

	thumb_func_start TryMoveUnitDisplayed
TryMoveUnitDisplayed: @ 0x0800CB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	mov sb, r0
	cmp r5, #0xff
	bne _0800CB9C
	movs r5, #1
	rsbs r5, r5, #0
_0800CB9C:
	cmp r4, #0xff
	bne _0800CBA4
	movs r4, #1
	rsbs r4, r4, #0
_0800CBA4:
	bl sub_0802C29C
	lsls r7, r5, #0x10
	lsls r2, r4, #0x10
	lsrs r0, r7, #0x10
	orrs r0, r2
	str r0, [sp]
	ldr r0, _0800CBD0 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r3, r0, r5
	ldrb r0, [r3]
	adds r4, r1, #0
	cmp r0, #0
	bne _0800CBD4
	movs r1, #1
	mov sb, r1
	mov r2, sb
	strb r2, [r3]
	b _0800CBE0
	.align 2, 0
_0800CBD0: .4byte 0x0202E3E0
_0800CBD4:
	asrs r1, r7, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	mov r3, sp
	bl AiGetUnitClosestValidPosition
_0800CBE0:
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r2, [r6, #4]
	ldr r2, [r2, #0x38]
	bl MapFloodRange_Unitless
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, sp
	movs r2, #2
	ldrsh r1, [r1, r2]
	ldr r7, _0800CC54 @ =0x02033E00
	adds r2, r7, #0
	bl sub_08019E5C
	mov r0, sb
	cmp r0, #0
	beq _0800CC18
	ldr r0, _0800CC58 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
_0800CC18:
	mov r1, sl
	adds r1, #0x5e
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800CC30
	movs r0, #0x40
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800CC30:
	bl sub_0802C2DC
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl DisplayMovement
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CC54: .4byte 0x02033E00
_0800CC58: .4byte 0x0202E3E0

	thumb_func_start DisplayMovement
DisplayMovement: @ 0x0800CC5C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	adds r0, r5, #0
	bl StartMu
	adds r6, r0, #0
	adds r4, #0x5e
	movs r7, #1
	adds r0, r7, #0
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _0800CC8E
	adds r0, r6, #0
	bl DisableMuCamera
_0800CC8E:
	ldr r0, _0800CD0C @ =0x08B91A08
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x54]
	adds r0, r5, #0
	bl HideUnitSprite
	ldr r0, [r5, #0xc]
	orrs r0, r7
	str r0, [r5, #0xc]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	str r2, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r7, _0800CD10 @ =0x0202E3F4
	ldr r1, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	add r1, sp, #4
	mov r0, sp
	mov r2, r8
	bl ApplyMoveScriptToCoordinates
	ldr r0, [sp]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #4]
	str r0, [r4, #0x30]
	adds r0, r6, #0
	mov r1, r8
	bl SetMuMoveScript
	mov r0, sb
	cmp r0, #0
	beq _0800CCEA
	adds r0, r6, #0
	mov r1, sb
	bl sub_0806D4CC
_0800CCEA:
	ldr r0, [sp, #4]
	ldr r1, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r1, [r5, #0xb]
	strb r1, [r0]
	movs r0, #1
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CD0C: .4byte 0x08B91A08
_0800CD10: .4byte 0x0202E3F4

	thumb_func_start sub_0800CD14
sub_0800CD14: @ 0x0800CD14
	bx lr
	.align 2, 0

	thumb_func_start EventWaitForMu_Loop
EventWaitForMu_Loop: @ 0x0800CD18
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x54]
	adds r0, r4, #0
	bl IsMuActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800CD5E
	adds r0, r4, #0
	bl EndMu
	ldr r4, [r4, #0x2c]
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
	adds r0, r4, #0
	bl UnitSyncMovement
	adds r0, r4, #0
	bl ShowUnitSprite
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	adds r0, r5, #0
	bl Proc_Break
_0800CD5E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EvtCmd_LoadUnits
EvtCmd_LoadUnits: @ 0x0800CD64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CD90 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CD98
	ldr r0, _0800CD94 @ =EventUnitLoadWait
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CDA0
	.align 2, 0
_0800CD90: .4byte 0x0202E3F4
_0800CD94: .4byte EventUnitLoadWait
_0800CD98:
	adds r0, r4, #0
	bl EventUnitLoadWait
	movs r0, #0
_0800CDA0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_LoadUnitsAlive
EvtCmd_LoadUnitsAlive: @ 0x0800CDA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CDD4 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CDDC
	ldr r0, _0800CDD8 @ =EventUnitLoadAliveWait
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CDE4
	.align 2, 0
_0800CDD4: .4byte 0x0202E3F4
_0800CDD8: .4byte EventUnitLoadAliveWait
_0800CDDC:
	adds r0, r4, #0
	bl EventUnitLoadAliveWait
	movs r0, #0
_0800CDE4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_LoadUnitsFiltered
EvtCmd_LoadUnitsFiltered: @ 0x0800CDEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r1, _0800CE38 @ =0xFFFF0000
	ands r0, r1
	ldr r1, _0800CE3C @ =0x0202BBF8
	cmp r0, #0
	beq _0800CE08
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0800CE4E
_0800CE08:
	ldr r0, [r4, #0x30]
	ldrb r1, [r1, #0x1b]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bne _0800CE4E
	ldr r0, _0800CE40 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CE48
	ldr r0, _0800CE44 @ =EventUnitLoadWait
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CE50
	.align 2, 0
_0800CE38: .4byte 0xFFFF0000
_0800CE3C: .4byte 0x0202BBF8
_0800CE40: .4byte 0x0202E3F4
_0800CE44: .4byte EventUnitLoadWait
_0800CE48:
	adds r0, r4, #0
	bl EventUnitLoadWait
_0800CE4E:
	movs r0, #0
_0800CE50:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_LoadUnitsParty
EvtCmd_LoadUnitsParty: @ 0x0800CE58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CE7C @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r0, r4, #0
	bl EventLoadUnitsAsParty
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CE7C: .4byte 0x0202E3F4

	thumb_func_start EvtCmd_LoadUnitsPartyIfScenario
EvtCmd_LoadUnitsPartyIfScenario: @ 0x0800CE80
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0800CE94 @ =0x0202BBF8
	ldr r0, [r4, #0x30]
	ldrb r1, [r1, #0x1b]
	ldrb r0, [r0, #4]
	cmp r1, r0
	beq _0800CE98
	movs r0, #0
	b _0800CEB0
	.align 2, 0
_0800CE94: .4byte 0x0202BBF8
_0800CE98:
	ldr r0, _0800CEB8 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	str r0, [r4, #0x44]
	adds r0, r4, #0
	bl EventLoadUnitsAsParty
	movs r0, #2
_0800CEB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CEB8: .4byte 0x0202E3F4

	thumb_func_start EvtCmd_LoadUnitsByMode
EvtCmd_LoadUnitsByMode: @ 0x0800CEBC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0800CEF4 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0800CED8
	adds r4, #2
_0800CED8:
	ldr r0, _0800CEF8 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	cmp r4, #1
	beq _0800CEFC
	cmp r4, #1
	ble _0800CF0E
	cmp r4, #2
	beq _0800CF02
	cmp r4, #3
	beq _0800CF08
	b _0800CF0E
	.align 2, 0
_0800CEF4: .4byte 0x0202BBF8
_0800CEF8: .4byte 0x0202E3F4
_0800CEFC:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	b _0800CF12
_0800CF02:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0xc]
	b _0800CF12
_0800CF08:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x10]
	b _0800CF12
_0800CF0E:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
_0800CF12:
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	beq _0800CF3A
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CF34
	ldr r0, _0800CF30 @ =EventUnitLoadWait
	str r0, [r5, #0x40]
	movs r0, #2
	b _0800CF3C
	.align 2, 0
_0800CF30: .4byte EventUnitLoadWait
_0800CF34:
	adds r0, r5, #0
	bl EventUnitLoadWait
_0800CF3A:
	movs r0, #0
_0800CF3C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_LoadUnitsPartyByMode
EvtCmd_LoadUnitsPartyByMode: @ 0x0800CF44
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0800CF7C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _0800CF60
	adds r4, #2
_0800CF60:
	ldr r0, _0800CF80 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	cmp r4, #1
	beq _0800CF84
	cmp r4, #1
	ble _0800CF96
	cmp r4, #2
	beq _0800CF8A
	cmp r4, #3
	beq _0800CF90
	b _0800CF96
	.align 2, 0
_0800CF7C: .4byte 0x0202BBF8
_0800CF80: .4byte 0x0202E3F4
_0800CF84:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #8]
	b _0800CF9A
_0800CF8A:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0xc]
	b _0800CF9A
_0800CF90:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x10]
	b _0800CF9A
_0800CF96:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
_0800CF9A:
	str r0, [r5, #0x44]
	adds r0, r5, #0
	bl EventLoadUnitsAsParty
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetNextAvailableBlueUnitId
GetNextAvailableBlueUnitId: @ 0x0800CFAC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x3f
	bgt _0800CFDA
_0800CFB4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800CFD4
	ldr r0, [r1]
	cmp r0, #0
	beq _0800CFD4
	ldr r0, [r1, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800CFD4
	adds r0, r4, #0
	b _0800CFDC
_0800CFD4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800CFB4
_0800CFDA:
	movs r0, #0
_0800CFDC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UnitInfoRequiresNoMovement
UnitInfoRequiresNoMovement: @ 0x0800CFE4
	adds r2, r0, #0
	ldr r0, _0800D010 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r2, #4]
	ands r1, r3
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r1, r0
	bne _0800D018
	ldr r0, _0800D014 @ =0x0202E3DC
	ldr r1, [r0]
	ldrb r3, [r2, #5]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r2, [r2, #4]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800D018
	movs r0, #1
	b _0800D01A
	.align 2, 0
_0800D010: .4byte 0x0000FFFF
_0800D014: .4byte 0x0202E3DC
_0800D018:
	movs r0, #0
_0800D01A:
	bx lr

	thumb_func_start EventUnitLoadWait
EventUnitLoadWait: @ 0x0800D01C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x44]
	b _0800D080
_0800D024:
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D04C
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800D058
	b _0800D04C
_0800D042:
	adds r0, r4, #0
	movs r1, #0
	bl LoadUnitWrapper
	adds r4, #0x10
_0800D04C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800D042
	movs r0, #0
	str r0, [r5, #0x40]
	b _0800D08E
_0800D058:
	adds r0, r4, #0
	bl UnitInfoRequiresNoMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D07C
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D08A
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadUnitWrapper
_0800D07C:
	adds r4, #0x10
	str r4, [r5, #0x44]
_0800D080:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800D024
	ldr r0, _0800D094 @ =EventMovementWait
	str r0, [r5, #0x40]
_0800D08A:
	bl ForceSyncUnitSpriteSheet
_0800D08E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D094: .4byte EventMovementWait

	thumb_func_start EventUnitLoadAliveWait
EventUnitLoadAliveWait: @ 0x0800D098
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x44]
	b _0800D11C
_0800D0A0:
	adds r1, r5, #0
	adds r1, #0x5e
	movs r6, #4
	adds r0, r6, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D0DA
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800D0E6
	b _0800D0DA
_0800D0C0:
	ldrb r0, [r4]
	bl GetUnitByPid
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D0D8
	adds r0, r4, #0
	movs r1, #0
	bl LoadUnitWrapper
_0800D0D8:
	adds r4, #0x10
_0800D0DA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800D0C0
	movs r0, #0
	str r0, [r5, #0x40]
	b _0800D12A
_0800D0E6:
	ldrb r0, [r4]
	bl GetUnitByPid
	ldr r0, [r0, #0xc]
	ands r0, r6
	cmp r0, #0
	bne _0800D118
	adds r0, r4, #0
	bl UnitInfoRequiresNoMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D118
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D126
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadUnitWrapper
_0800D118:
	adds r4, #0x10
	str r4, [r5, #0x44]
_0800D11C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800D0A0
	ldr r0, _0800D130 @ =EventMovementWait
	str r0, [r5, #0x40]
_0800D126:
	bl ForceSyncUnitSpriteSheet
_0800D12A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D130: .4byte EventMovementWait

	thumb_func_start EventLoadUnitsAsParty
EventLoadUnitsAsParty: @ 0x0800D134
	push {r4, r5, r6, lr}
	ldr r6, [r0, #0x44]
	movs r5, #0
	movs r4, #1
_0800D13C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800D15A
	ldr r0, [r1]
	cmp r0, #0
	beq _0800D15A
	ldr r0, [r1, #0xc]
	ldr r1, _0800D1B4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D15A
	adds r5, #1
_0800D15A:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D13C
	cmp r5, #0
	ble _0800D176
	ldr r0, _0800D1B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800D252
_0800D176:
	ldr r0, _0800D1B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0800D1BC
	movs r4, #1
_0800D18A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D1AC
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D1AC
	ldr r1, [r2, #0xc]
	ldr r0, _0800D1B4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D1AC
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0800D1AC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D18A
	b _0800D1EA
	.align 2, 0
_0800D1B4: .4byte 0x00010004
_0800D1B8: .4byte 0x0202BBF8
_0800D1BC:
	movs r4, #1
_0800D1BE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D1E4
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D1E4
	ldr r1, [r2, #0xc]
	ldr r0, _0800D1F0 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D1E4
	movs r0, #1
	orrs r1, r0
	subs r0, #0xa
	ands r1, r0
	str r1, [r2, #0xc]
_0800D1E4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D1BE
_0800D1EA:
	movs r4, #0
	b _0800D206
	.align 2, 0
_0800D1F0: .4byte 0x00010004
_0800D1F4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	adds r4, #1
	adds r0, r6, #0
	bl FakeLoadUnit
	adds r6, #0x10
_0800D206:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0800D218
	adds r0, r4, #0
	bl GetNextAvailableBlueUnitId
	adds r4, r0, #0
	cmp r4, #0
	bne _0800D1F4
_0800D218:
	movs r4, #1
_0800D21A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D244
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D244
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D244
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D244
	movs r0, #8
	orrs r1, r0
	str r1, [r2, #0xc]
_0800D244:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D21A
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_0800D252:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start EvtCmd_LoadUnit
EvtCmd_LoadUnit: @ 0x0800D258
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, [r0, #0x30]
	ldrb r1, [r0, #4]
	mov sb, r1
	ldrb r3, [r0, #6]
	mov sl, r3
	ldrb r6, [r0, #8]
	ldrb r0, [r0, #0xa]
	mov r8, r0
	ldr r0, _0800D2EC @ =0x030041D0
	ldr r5, _0800D2F0 @ =0x08B91A18
	ldrb r1, [r5, #2]
	strb r1, [r0, #2]
	ldrb r4, [r5, #3]
	lsls r2, r4, #0x1f
	lsrs r2, r2, #0x1f
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r0, #3]
	ands r1, r3
	orrs r1, r2
	movs r2, #6
	ands r2, r4
	movs r3, #7
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r2
	lsrs r4, r4, #3
	lsls r4, r4, #3
	movs r2, #7
	ands r1, r2
	orrs r1, r4
	strb r1, [r0, #3]
	ldrb r1, [r5, #8]
	strb r1, [r0, #8]
	ldrb r1, [r5, #9]
	strb r1, [r0, #9]
	ldrb r1, [r5, #0xa]
	strb r1, [r0, #0xa]
	ldrb r1, [r5, #0xb]
	strb r1, [r0, #0xb]
	ldrb r1, [r5, #0xc]
	strb r1, [r0, #0xc]
	ldrb r1, [r5, #0xd]
	strb r1, [r0, #0xd]
	ldrb r1, [r5, #0xe]
	strb r1, [r0, #0xe]
	ldrb r1, [r5, #0xf]
	strb r1, [r0, #0xf]
	mov r1, sb
	strb r1, [r0]
	mov r3, sl
	strb r3, [r0, #1]
	strb r6, [r0, #4]
	mov r1, r8
	strb r1, [r0, #5]
	strb r6, [r0, #6]
	strb r1, [r0, #7]
	movs r1, #0
	bl LoadUnitWrapper
	movs r0, #2
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D2EC: .4byte 0x030041D0
_0800D2F0: .4byte 0x08B91A18

	thumb_func_start EventMovementWait
EventMovementWait: @ 0x0800D2F4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0800D310
	ldr r0, _0800D318 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	str r4, [r5, #0x40]
_0800D310:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D318: .4byte 0x0202E3F4

	thumb_func_start EvtCmd_WaitForMovement
EvtCmd_WaitForMovement: @ 0x0800D31C
	push {r4, lr}
	adds r4, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D32E
	movs r0, #3
	b _0800D352
_0800D32E:
	ldr r0, _0800D34C @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D350
	movs r0, #2
	b _0800D352
	.align 2, 0
_0800D34C: .4byte 0x0202E3F4
_0800D350:
	movs r0, #0
_0800D352:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_UnitCameraOn
EvtCmd_UnitCameraOn: @ 0x0800D358
	adds r0, #0x5e
	movs r1, #1
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start EvtCmd_UnitCameraOff
EvtCmd_UnitCameraOff: @ 0x0800D368
	adds r0, #0x5e
	ldr r1, _0800D378 @ =0x0000FFFE
	ldrh r2, [r0]
	ands r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0800D378: .4byte 0x0000FFFE

	thumb_func_start EvtCmd_Func
EvtCmd_Func: @ 0x0800D37C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D398
	movs r0, #2
	b _0800D39A
_0800D398:
	movs r0, #1
_0800D39A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_FuncIfnSkip
EvtCmd_FuncIfnSkip: @ 0x0800D3A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r5, r2, #4
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D3C6
	ldr r1, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D3CA
_0800D3C6:
	movs r0, #0
	b _0800D3CC
_0800D3CA:
	movs r0, #1
_0800D3CC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_FuncIfnSkipTalk
EvtCmd_FuncIfnSkipTalk: @ 0x0800D3D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r5, r2, #4
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D400
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D400
	ldr r1, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D404
_0800D400:
	movs r0, #0
	b _0800D406
_0800D404:
	movs r0, #1
_0800D406:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_FuncUntil
EvtCmd_FuncUntil: @ 0x0800D40C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	beq _0800D42C
	movs r0, #1
	b _0800D436
_0800D42C:
	cmp r1, #0
	bne _0800D434
	movs r0, #3
	b _0800D436
_0800D434:
	movs r0, #0
_0800D436:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_FuncWhile
EvtCmd_FuncWhile: @ 0x0800D43C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	beq _0800D45C
	movs r0, #1
	b _0800D466
_0800D45C:
	cmp r1, #0
	bne _0800D464
	movs r0, #0
	b _0800D466
_0800D464:
	movs r0, #3
_0800D466:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_Stop
EvtCmd_Stop: @ 0x0800D46C
	movs r0, #3
	bx lr

	thumb_func_start EvtCmd_Label
EvtCmd_Label: @ 0x0800D470
	movs r0, #0
	bx lr

	thumb_func_start EventGotoLabel
EventGotoLabel: @ 0x0800D474
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	ldr r2, [r3, #0x2c]
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D4C6
	ldr r4, _0800D4A8 @ =0x0000FFFF
	ldr r5, _0800D4AC @ =0x08B9106C
	ldr r0, _0800D4B0 @ =0xFFFFFDE0
	adds r7, r5, r0
_0800D48A:
	ldr r1, [r2]
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0x44
	bne _0800D4B4
	ldr r0, [r2, #4]
	cmp r0, r6
	bne _0800D4B4
	ldr r0, [r5]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r3, #0x30]
	movs r0, #1
	b _0800D4C8
	.align 2, 0
_0800D4A8: .4byte 0x0000FFFF
_0800D4AC: .4byte 0x08B9106C
_0800D4B0: .4byte 0xFFFFFDE0
_0800D4B4:
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r7
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	bne _0800D48A
_0800D4C6:
	movs r0, #2
_0800D4C8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_Goto
EvtCmd_Goto: @ 0x0800D4D0
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	bl EventGotoLabel
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_GotoIfnAlive
EvtCmd_GotoIfnAlive: @ 0x0800D4E0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r6, [r0, #8]
	movs r4, #1
_0800D4EA:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D50E
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D50E
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D50E
	ldrb r0, [r2, #4]
	cmp r0, r6
	bne _0800D50E
	movs r0, #0
	b _0800D51E
_0800D50E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D4EA
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl EventGotoLabel
_0800D51E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GotoIfnInTeam
EvtCmd_GotoIfnInTeam: @ 0x0800D524
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r6, [r0, #8]
	movs r4, #1
_0800D52E:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D552
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D552
	ldr r0, [r0, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800D552
	ldrb r0, [r2, #4]
	cmp r0, r6
	bne _0800D552
	movs r0, #0
	b _0800D562
_0800D552:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D52E
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl EventGotoLabel
_0800D562:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GotoIfyFunc
EvtCmd_GotoIfyFunc: @ 0x0800D568
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D57E
	movs r0, #0
	b _0800D588
_0800D57E:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
_0800D588:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_GotoIfnFunc
EvtCmd_GotoIfnFunc: @ 0x0800D590
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D5A6
	movs r0, #0
	b _0800D5B0
_0800D5A6:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
_0800D5B0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_GotoIfySkip
EvtCmd_GotoIfySkip: @ 0x0800D5B8
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #6
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D5CE
	movs r0, #0
	b _0800D5D8
_0800D5CE:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl EventGotoLabel
_0800D5D8:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GotoIfySkipText
EvtCmd_GotoIfySkipText: @ 0x0800D5DC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D5F2
	movs r0, #0
	b _0800D5FC
_0800D5F2:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl EventGotoLabel
_0800D5FC:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GotoIfyFlag
EvtCmd_GotoIfyFlag: @ 0x0800D600
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r0, [r0, #8]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D634
	movs r0, #0
	b _0800D65E
_0800D61A:
	ldr r0, _0800D630 @ =0x08B90E48
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r5, #0x30]
	movs r0, #1
	b _0800D65E
	.align 2, 0
_0800D630: .4byte 0x08B90E48
_0800D634:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800D65C
	ldr r3, _0800D664 @ =0x0000FFFF
	ldr r2, _0800D668 @ =0x08B90E4C
_0800D63E:
	ldr r1, [r4]
	ands r1, r3
	cmp r1, #0x44
	bne _0800D64C
	ldr r0, [r4, #4]
	cmp r0, r6
	beq _0800D61A
_0800D64C:
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	bne _0800D63E
_0800D65C:
	movs r0, #2
_0800D65E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D664: .4byte 0x0000FFFF
_0800D668: .4byte 0x08B90E4C

	thumb_func_start EvtCmd_GotoIfnFlag
EvtCmd_GotoIfnFlag: @ 0x0800D66C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r0, [r0, #8]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D6A0
	movs r0, #0
	b _0800D6CA
_0800D686:
	ldr r0, _0800D69C @ =0x08B90E48
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r5, #0x30]
	movs r0, #1
	b _0800D6CA
	.align 2, 0
_0800D69C: .4byte 0x08B90E48
_0800D6A0:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800D6C8
	ldr r3, _0800D6D0 @ =0x0000FFFF
	ldr r2, _0800D6D4 @ =0x08B90E4C
_0800D6AA:
	ldr r1, [r4]
	ands r1, r3
	cmp r1, #0x44
	bne _0800D6B8
	ldr r0, [r4, #4]
	cmp r0, r6
	beq _0800D686
_0800D6B8:
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	bne _0800D6AA
_0800D6C8:
	movs r0, #2
_0800D6CA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D6D0: .4byte 0x0000FFFF
_0800D6D4: .4byte 0x08B90E4C

	thumb_func_start EvtCmd_GotoIfyActive
EvtCmd_GotoIfyActive: @ 0x0800D6D8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x2c]
	ldr r1, [r3, #0x30]
	ldr r6, [r1, #4]
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0800D700
	ldr r0, _0800D6FC @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #8]
	cmp r0, r1
	beq _0800D730
	movs r0, #0
	b _0800D75A
	.align 2, 0
_0800D6FC: .4byte 0x03004690
_0800D700:
	ldr r0, _0800D714 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #8]
	cmp r0, r1
	bne _0800D730
	movs r0, #0
	b _0800D75A
	.align 2, 0
_0800D714: .4byte 0x03004690
_0800D718:
	ldr r0, _0800D72C @ =0x08B90E48
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r3, #0x30]
	movs r0, #1
	b _0800D75A
	.align 2, 0
_0800D72C: .4byte 0x08B90E48
_0800D730:
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D758
	ldr r5, _0800D760 @ =0x0000FFFF
	ldr r4, _0800D764 @ =0x08B90E4C
_0800D73A:
	ldr r1, [r2]
	ands r1, r5
	cmp r1, #0x44
	bne _0800D748
	ldr r0, [r2, #4]
	cmp r0, r6
	beq _0800D718
_0800D748:
	lsls r0, r1, #3
	adds r0, r0, r4
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	bne _0800D73A
_0800D758:
	movs r0, #2
_0800D75A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D760: .4byte 0x0000FFFF
_0800D764: .4byte 0x08B90E4C

	thumb_func_start EvtCmd_GotoIfyEliwoodMode
EvtCmd_GotoIfyEliwoodMode: @ 0x0800D768
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D778 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _0800D77C
	movs r0, #0
	b _0800D786
	.align 2, 0
_0800D778: .4byte 0x0202BBF8
_0800D77C:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl EventGotoLabel
_0800D786:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_GotoIfyHectorMode
EvtCmd_GotoIfyHectorMode: @ 0x0800D78C
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D79C @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800D7A0
	movs r0, #0
	b _0800D7AA
	.align 2, 0
_0800D79C: .4byte 0x0202BBF8
_0800D7A0:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl EventGotoLabel
_0800D7AA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_GotoIfyDifficulty
EvtCmd_GotoIfyDifficulty: @ 0x0800D7B0
	push {lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x30]
	ldrh r0, [r2, #2]
	cmp r0, #0
	beq _0800D7D0
	ldr r1, _0800D7CC @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _0800D7EC
	b _0800D7DC
	.align 2, 0
_0800D7CC: .4byte 0x0202BBF8
_0800D7D0:
	ldr r1, _0800D7E8 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0800D7EC
_0800D7DC:
	ldr r1, [r2, #4]
	adds r0, r3, #0
	bl EventGotoLabel
	b _0800D7EE
	.align 2, 0
_0800D7E8: .4byte 0x0202BBF8
_0800D7EC:
	movs r0, #0
_0800D7EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_GotoIfnTalkYes
EvtCmd_GotoIfnTalkYes: @ 0x0800D7F4
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkResult
	cmp r0, #1
	bne _0800D804
	movs r0, #0
	b _0800D80E
_0800D804:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
_0800D80E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GotoIfnTalkYes2
EvtCmd_GotoIfnTalkYes2: @ 0x0800D814
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkResult
	cmp r0, #1
	bne _0800D824
	movs r0, #0
	b _0800D82E
_0800D824:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
_0800D82E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GotoIfnTutorial
EvtCmd_GotoIfnTutorial: @ 0x0800D834
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0800D85C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0800D84E
	bl IsTutorialDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D860
_0800D84E:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
	b _0800D862
	.align 2, 0
_0800D85C: .4byte 0x0202BBF8
_0800D860:
	movs r0, #0
_0800D862:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GotoIfnDeadAndFlagOnce
EvtCmd_GotoIfnDeadAndFlagOnce: @ 0x0800D868
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	ldrh r7, [r0, #8]
	ldr r5, [r0, #0xc]
	movs r4, #1
_0800D874:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D8AA
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D8AA
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800D8AA
	ldrb r0, [r2, #4]
	cmp r0, r7
	bne _0800D8AA
	adds r0, r5, #0
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D8B0
	adds r0, r5, #0
	bl SetFlag
	movs r0, #0
	b _0800D8BA
_0800D8AA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D874
_0800D8B0:
	ldr r0, [r6, #0x30]
	ldr r1, [r0, #4]
	adds r0, r6, #0
	bl EventGotoLabel
_0800D8BA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GotoIfyTurnCountReached
EvtCmd_GotoIfyTurnCountReached: @ 0x0800D8C0
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D8D4 @ =0x0202BBF8
	ldr r1, [r2, #0x30]
	ldrh r0, [r0, #0x10]
	ldrh r3, [r1, #2]
	cmp r0, r3
	bhs _0800D8D8
	movs r0, #0
	b _0800D8E0
	.align 2, 0
_0800D8D4: .4byte 0x0202BBF8
_0800D8D8:
	ldr r1, [r1, #4]
	adds r0, r2, #0
	bl EventGotoLabel
_0800D8E0:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GotoIfxDeployed
EvtCmd_GotoIfxDeployed: @ 0x0800D8E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0800D900
	ldrb r0, [r1, #8]
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D90C
_0800D8FC:
	movs r0, #0
	b _0800D916
_0800D900:
	ldrb r0, [r1, #8]
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D8FC
_0800D90C:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
_0800D916:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_Jump
EvtCmd_Jump: @ 0x0800D91C
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	movs r0, #1
	bx lr

	thumb_func_start EvtCmd_SkipNIfyFunc
EvtCmd_SkipNIfyFunc: @ 0x0800D928
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D944
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
_0800D944:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_SkipNIfnFunc
EvtCmd_SkipNIfnFunc: @ 0x0800D94C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D968
	ldr r0, [r4, #0x30]
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
_0800D968:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GiveItem
EvtCmd_GiveItem: @ 0x0800D970
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #4]
	ldr r0, _0800D984 @ =0x03004690
	ldr r0, [r0]
	bl EventGiveItem
	pop {r1}
	bx r1
	.align 2, 0
_0800D984: .4byte 0x03004690

	thumb_func_start EvtCmd_GiveItemToPid
EvtCmd_GiveItemToPid: @ 0x0800D988
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r2, [r0, #4]
	ldrh r5, [r0, #8]
	cmp r2, #0
	bne _0800D99C
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r2, [r0]
_0800D99C:
	adds r0, r2, #0
	bl GetUnitByPid
	adds r1, r5, #0
	adds r2, r4, #0
	bl EventGiveItem
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GiveItemToLeader
EvtCmd_GiveItemToLeader: @ 0x0800D9B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r5, [r0, #4]
	bl GetLeaderPid
	bl GetUnitByPid
	adds r1, r5, #0
	adds r2, r4, #0
	bl EventGiveItem
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EventGiveItem
EventGiveItem: @ 0x0800D9D0
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800D9E2
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r1, [r0]
_0800D9E2:
	adds r0, r3, #0
	bl StartGiveItem
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_MapChange
EvtCmd_MapChange: @ 0x0800D9F0
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800DA0C @ =0x0000FFFF
	cmp r4, r0
	bne _0800DA10
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800DA20
	.align 2, 0
_0800DA0C: .4byte 0x0000FFFF
_0800DA10:
	ldr r0, _0800DA5C @ =0x00007FFF
	ands r4, r0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800DA20:
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800DA60
	bl RenderMapForFade
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DA42
	subs r0, r4, #1
	bl RemoveMapChangeTrap
_0800DA42:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	b _0800DA7E
	.align 2, 0
_0800DA5C: .4byte 0x00007FFF
_0800DA60:
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DA70
	subs r0, r4, #1
	bl RemoveMapChangeTrap
_0800DA70:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
_0800DA7E:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_MapChangeWithAutoWaterShadows
EvtCmd_MapChangeWithAutoWaterShadows: @ 0x0800DA88
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800DAA4 @ =0x0000FFFF
	cmp r4, r0
	bne _0800DAA8
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800DAB8
	.align 2, 0
_0800DAA4: .4byte 0x0000FFFF
_0800DAA8:
	ldr r0, _0800DAF0 @ =0x00007FFF
	ands r4, r0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800DAB8:
	adds r0, r2, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800DB2C
	bl RenderMapForFade
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DAF8
	subs r0, r4, #1
	bl RemoveMapChangeTrap
	ldr r0, _0800DAF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800DB0A
	movs r0, #0xbd
	bl sub_080BE594
	b _0800DB0A
	.align 2, 0
_0800DAF0: .4byte 0x00007FFF
_0800DAF4: .4byte 0x0202BBF8
_0800DAF8:
	ldr r0, _0800DB28 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800DB0A
	movs r0, #0xbe
	bl sub_080BE594
_0800DB0A:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RefreshAutoWaterShadows
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	b _0800DB4E
	.align 2, 0
_0800DB28: .4byte 0x0202BBF8
_0800DB2C:
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DB3C
	subs r0, r4, #1
	bl RemoveMapChangeTrap
_0800DB3C:
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RefreshAutoWaterShadows
_0800DB4E:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_MapChangeInstant
EvtCmd_MapChangeInstant: @ 0x0800DB58
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r4, [r0, #2]
	ldr r0, _0800DB8C @ =0x0000FFFF
	cmp r4, r0
	bne _0800DB6C
	adds r0, r1, #0
	adds r0, #0x4f
	ldrb r4, [r0]
_0800DB6C:
	adds r0, r4, #0
	bl ApplyMapChange
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RenderMap
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800DB8C: .4byte 0x0000FFFF

	thumb_func_start EvtCmd_MapChangeInstantNoRender
EvtCmd_MapChangeInstantNoRender: @ 0x0800DB90
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800DBAC @ =0x0000FFFF
	cmp r4, r0
	bne _0800DBB0
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800DBC0
	.align 2, 0
_0800DBAC: .4byte 0x0000FFFF
_0800DBB0:
	ldr r0, _0800DBD4 @ =0x00007FFF
	ands r4, r0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800DBC0:
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DBD8
	subs r0, r4, #1
	bl RemoveMapChangeTrap
	b _0800DBDE
	.align 2, 0
_0800DBD4: .4byte 0x00007FFF
_0800DBD8:
	adds r0, r4, #0
	bl AddMapChangeTrap
_0800DBDE:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_ReRenderMap
EvtCmd_ReRenderMap: @ 0x0800DBE8
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0800DC00
	bl RefreshAutoWaterShadows
_0800DC00:
	bl RenderMap
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MapChangePosition
EvtCmd_MapChangePosition: @ 0x0800DC0C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0]
	lsrs r0, r1, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0800DC30
	adds r0, r5, #0
	adds r0, #0x4f
	ldrb r4, [r0]
_0800DC30:
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800DC62
	bl RenderMapForFade
	adds r0, r4, #0
	bl ApplyMapChange
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	b _0800DC76
_0800DC62:
	adds r0, r4, #0
	bl ApplyMapChange
	adds r0, r4, #0
	bl AddMapChangeTrap
	bl RefreshTerrainMap
	bl UpdateRoofedUnits
_0800DC76:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_SetFaction
EvtCmd_SetFaction: @ 0x0800DC80
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x30]
	ldrb r6, [r0, #4]
	ldr r5, [r0, #8]
	movs r4, #1
_0800DC8A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800DCB4
	ldr r3, [r2]
	cmp r3, #0
	beq _0800DCB4
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800DCB4
	ldrb r3, [r3, #4]
	cmp r3, r6
	bne _0800DCB4
	adds r0, r2, #0
	adds r1, r5, #0
	bl UnitChangeFaction
_0800DCB4:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800DC8A
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_FlashCursorPosition
EvtCmd_FlashCursorPosition: @ 0x0800DCC8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DCDE
	movs r0, #0
	b _0800DD26
_0800DCDE:
	ldr r1, [r5, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DCF2
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0800DCF4
_0800DCF2:
	ldr r0, _0800DD08 @ =0x0000FFFF
_0800DCF4:
	adds r6, r0, #0
	ldrh r1, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DD0C
	adds r4, r1, #0
	b _0800DD0E
	.align 2, 0
_0800DD08: .4byte 0x0000FFFF
_0800DD0C:
	ldr r4, _0800DD2C @ =0x0000FFFF
_0800DD0E:
	ldr r0, _0800DD30 @ =0x08B91A38
	adds r1, r5, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x64
	strh r6, [r1]
	adds r0, #0x66
	strh r4, [r0]
	ldr r0, _0800DD34 @ =EventFlashCursorWait
	str r0, [r5, #0x40]
	movs r0, #2
_0800DD26:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DD2C: .4byte 0x0000FFFF
_0800DD30: .4byte 0x08B91A38
_0800DD34: .4byte EventFlashCursorWait

	thumb_func_start EvtCmd_FlashCursorPid
EvtCmd_FlashCursorPid: @ 0x0800DD38
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800DD80
	ldr r0, _0800DD78 @ =0x08B91A38
	adds r1, r4, #0
	bl SpawnProc
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	adds r1, r0, #0
	adds r1, #0x64
	strh r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, #0x66
	strh r1, [r0]
	ldr r0, _0800DD7C @ =EventFlashCursorWait
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800DD82
	.align 2, 0
_0800DD78: .4byte 0x08B91A38
_0800DD7C: .4byte EventFlashCursorWait
_0800DD80:
	movs r0, #0
_0800DD82:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EventFlashCursorWait
EventFlashCursorWait: @ 0x0800DD88
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DDA8
	ldr r0, _0800DDA4 @ =0x08B91A38
	bl Proc_EndEach
	movs r0, #0
	b _0800DDB2
	.align 2, 0
_0800DDA4: .4byte 0x08B91A38
_0800DDA8:
	ldr r0, _0800DDBC @ =0x08B91A38
	bl Proc_Find
	cmp r0, #0
	bne _0800DDB4
_0800DDB2:
	str r0, [r4, #0x40]
_0800DDB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800DDBC: .4byte 0x08B91A38

	thumb_func_start EventFlashCursor_OnInit
EventFlashCursor_OnInit: @ 0x0800DDC0
	movs r1, #0x3c
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0

	thumb_func_start EventFlashCursor_OnLoop
EventFlashCursor_OnLoop: @ 0x0800DDC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
	cmp r0, #0
	bgt _0800DDDC
	adds r0, r4, #0
	bl Proc_Break
_0800DDDC:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #4
	movs r2, #0
	bl PutMapCursor
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EvtCmd_PutCursor
EvtCmd_PutCursor: @ 0x0800DDFC
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DE12
	movs r0, #0
	b _0800DE56
_0800DE12:
	ldr r1, [r3, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DE26
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0800DE28
_0800DE26:
	ldr r0, _0800DE3C @ =0x0000FFFF
_0800DE28:
	adds r5, r0, #0
	ldrh r1, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DE40
	adds r4, r1, #0
	b _0800DE42
	.align 2, 0
_0800DE3C: .4byte 0x0000FFFF
_0800DE40:
	ldr r4, _0800DE5C @ =0x0000FFFF
_0800DE42:
	ldr r0, _0800DE60 @ =0x08B91A50
	adds r1, r3, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x64
	strh r5, [r1]
	adds r0, #0x66
	strh r4, [r0]
	movs r0, #2
_0800DE56:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DE5C: .4byte 0x0000FFFF
_0800DE60: .4byte 0x08B91A50

	thumb_func_start EventCursor_Loop
EventCursor_Loop: @ 0x0800DE64
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r2, r2, #4
	adds r0, #0x66
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r1, r1, #4
	adds r0, r2, #0
	movs r2, #0
	bl PutMapCursor
	pop {r0}
	bx r0

	thumb_func_start EvtCmd_ClearCursors
EvtCmd_ClearCursors: @ 0x0800DE84
	push {lr}
	ldr r0, _0800DE94 @ =0x08B91A50
	bl Proc_EndEach
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800DE94: .4byte 0x08B91A50

	thumb_func_start EventIsPidBlueForDisable
EventIsPidBlueForDisable: @ 0x0800DE98
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0800DEA0:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800DEBA
	ldr r0, [r0]
	cmp r0, #0
	beq _0800DEBA
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0800DEBA
	movs r0, #1
	b _0800DEC2
_0800DEBA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800DEA0
	movs r0, #0
_0800DEC2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_RemovePosition
EvtCmd_RemovePosition: @ 0x0800DEC8
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DEE0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800DEE2
_0800DEE0:
	ldr r0, _0800DEF8 @ =0x0000FFFF
_0800DEE2:
	adds r1, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DEFC
	adds r0, r2, #0
	b _0800DEFE
	.align 2, 0
_0800DEF8: .4byte 0x0000FFFF
_0800DEFC:
	ldr r0, _0800DF30 @ =0x0000FFFF
_0800DEFE:
	lsls r2, r0, #0x10
	ldr r0, _0800DF34 @ =0x0202E3DC
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl EventIsPidBlueForDisable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DF38
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800DF3E
	.align 2, 0
_0800DF30: .4byte 0x0000FFFF
_0800DF34: .4byte 0x0202E3DC
_0800DF38:
	adds r0, r4, #0
	bl ClearUnit
_0800DF3E:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_RemovePid
EvtCmd_RemovePid: @ 0x0800DF50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #4]
	bl EventIsPidBlueForDisable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800DF76
	ldr r0, [r5, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r5, #0xc]
	b _0800DF7C
_0800DF76:
	adds r0, r5, #0
	bl ClearUnit
_0800DF7C:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_RemovePositionDisplayed
EvtCmd_RemovePositionDisplayed: @ 0x0800DF8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DFA4
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800DFA6
_0800DFA4:
	ldr r0, _0800DFBC @ =0x0000FFFF
_0800DFA6:
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DFC0
	adds r0, r2, #0
	b _0800DFC2
	.align 2, 0
_0800DFBC: .4byte 0x0000FFFF
_0800DFC0:
	ldr r0, _0800E004 @ =0x0000FFFF
_0800DFC2:
	lsls r2, r0, #0x10
	ldr r0, _0800E008 @ =0x0202E3DC
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800E01C
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl EventIsPidBlueForDisable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E00C
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800E012
	.align 2, 0
_0800E004: .4byte 0x0000FFFF
_0800E008: .4byte 0x0202E3DC
_0800E00C:
	adds r0, r4, #0
	bl ClearUnit
_0800E012:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	b _0800E04A
_0800E01C:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	adds r4, r0, #0
	bl SetAutoMuDefaultFacing
	adds r0, r4, #0
	bl StartMuDeathFade
	ldr r0, _0800E054 @ =EventRemoveDisplayedWait
	str r0, [r5, #0x40]
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0x3c
	strh r0, [r1]
_0800E04A:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E054: .4byte EventRemoveDisplayedWait

	thumb_func_start EvtCmd_RemovePidDisplayed
EvtCmd_RemovePidDisplayed: @ 0x0800E058
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x55
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnitByPid
	adds r4, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800E0A4
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl EventIsPidBlueForDisable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E094
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800E09A
_0800E094:
	adds r0, r4, #0
	bl ClearUnit
_0800E09A:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	b _0800E0C8
_0800E0A4:
	adds r0, r4, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	adds r4, r0, #0
	bl SetAutoMuDefaultFacing
	adds r0, r4, #0
	bl StartMuDeathFade
	ldr r0, _0800E0D0 @ =EventRemoveDisplayedWait
	str r0, [r5, #0x40]
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0x3c
	strh r0, [r1]
_0800E0C8:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E0D0: .4byte EventRemoveDisplayedWait

	thumb_func_start EventRemoveDisplayedWait
EventRemoveDisplayedWait: @ 0x0800E0D4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x55
	ldrb r0, [r0]
	bl GetUnitByPid
	adds r4, r0, #0
	bl EndAllMus
	adds r0, r4, #0
	bl ClearUnit
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #0
	str r0, [r5, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EvtCmd_HidePosition
EvtCmd_HidePosition: @ 0x0800E100
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800E118
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	b _0800E11A
_0800E118:
	ldr r0, _0800E130 @ =0x0000FFFF
_0800E11A:
	adds r1, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800E134
	adds r0, r2, #0
	b _0800E136
	.align 2, 0
_0800E130: .4byte 0x0000FFFF
_0800E134:
	ldr r0, _0800E164 @ =0x0000FFFF
_0800E136:
	lsls r2, r0, #0x10
	ldr r0, _0800E168 @ =0x0202E3DC
	ldr r0, [r0]
	asrs r2, r2, #0xe
	adds r2, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #9
	orrs r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
_0800E164: .4byte 0x0000FFFF
_0800E168: .4byte 0x0202E3DC

	thumb_func_start EvtCmd_HidePid
EvtCmd_HidePid: @ 0x0800E16C
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	ldr r1, [r0, #0xc]
	movs r2, #9
	orrs r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_DisablePid
EvtCmd_DisablePid: @ 0x0800E18C
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	ldr r1, [r0, #0xc]
	ldr r2, _0800E1A4 @ =0x04010000
	orrs r1, r2
	str r1, [r0, #0xc]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E1A4: .4byte 0x04010000

	thumb_func_start EvtCmd_EnablePid
EvtCmd_EnablePid: @ 0x0800E1A8
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	ldr r1, [r0, #0xc]
	ldr r2, _0800E1C0 @ =0xFFBFFFFF
	ands r1, r2
	str r1, [r0, #0xc]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E1C0: .4byte 0xFFBFFFFF

	thumb_func_start EvtCmd_SetState
EvtCmd_SetState: @ 0x0800E1C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	ldr r1, [r0, #0xc]
	orrs r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_ClearState
EvtCmd_ClearState: @ 0x0800E1EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	ldr r1, [r0, #0xc]
	bics r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EventSetUnitAi
EventSetUnitAi: @ 0x0800E214
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r1, #0x14
	beq _0800E230
	mov r3, ip
	adds r3, #0x42
	movs r0, #0
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x43
	strb r0, [r1]
_0800E230:
	cmp r2, #0x23
	beq _0800E250
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	cmp r2, #0xc
	bne _0800E250
	movs r0, #8
	mov r1, ip
	ldrb r1, [r1, #0xa]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0xa]
_0800E250:
	bx lr
	.align 2, 0

	thumb_func_start EvtCmd_SetAiPid
EvtCmd_SetAiPid: @ 0x0800E254
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, [r0, #0x30]
	ldrb r1, [r0, #4]
	mov r8, r1
	ldr r1, [r0, #8]
	ldrb r7, [r0, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r6, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	movs r4, #1
_0800E276:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800E2A4
	ldr r3, [r2]
	cmp r3, #0
	beq _0800E2A4
	ldr r0, [r2, #0xc]
	movs r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0800E2A4
	ldrb r3, [r3, #4]
	cmp r3, r8
	bne _0800E2A4
	adds r0, r2, #0
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl EventSetUnitAi
_0800E2A4:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800E276
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_SetAiPosition
EvtCmd_SetAiPosition: @ 0x0800E2B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, [r0, #0x30]
	ldr r1, [r2, #8]
	ldrb r0, [r2, #8]
	mov sb, r0
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #8
	mov r8, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r7, r1, #0x10
	movs r4, #0x41
	movs r6, #4
	ldrsb r6, [r2, r6]
	movs r5, #6
	ldrsb r5, [r2, r5]
_0800E2E4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800E31C
	ldr r0, [r2]
	cmp r0, #0
	beq _0800E31C
	ldr r0, [r2, #0xc]
	movs r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0800E31C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _0800E31C
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0800E31C
	adds r0, r2, #0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl EventSetUnitAi
_0800E31C:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800E2E4
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_SetFlag
EvtCmd_SetFlag: @ 0x0800E330
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl SetFlag
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_ClearFlag
EvtCmd_ClearFlag: @ 0x0800E340
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl ClearFlag
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_PlayBgm
EvtCmd_PlayBgm: @ 0x0800E350
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E372
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	movs r1, #1
	movs r2, #0
	bl StartBgmExt
	movs r0, #2
	b _0800E374
_0800E372:
	movs r0, #0
_0800E374:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_PlaySongExt
EvtCmd_PlaySongExt: @ 0x0800E378
	push {lr}
	ldr r2, [r0, #0x30]
	ldrh r3, [r2, #2]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0800E38E
	movs r0, #0
	b _0800E418
_0800E38E:
	ldr r0, [r2, #4]
	subs r0, #1
	cmp r0, #7
	bhi _0800E40C
	lsls r0, r0, #2
	ldr r1, _0800E3A0 @ =_0800E3A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E3A0: .4byte _0800E3A4
_0800E3A4: @ jump table
	.4byte _0800E3C4 @ case 0
	.4byte _0800E3CC @ case 1
	.4byte _0800E3D4 @ case 2
	.4byte _0800E3DC @ case 3
	.4byte _0800E3E4 @ case 4
	.4byte _0800E3EC @ case 5
	.4byte _0800E3F4 @ case 6
	.4byte _0800E3FC @ case 7
_0800E3C4:
	ldr r2, _0800E3C8 @ =0x03005D20
	b _0800E3FE
	.align 2, 0
_0800E3C8: .4byte 0x03005D20
_0800E3CC:
	ldr r2, _0800E3D0 @ =0x03005D60
	b _0800E3FE
	.align 2, 0
_0800E3D0: .4byte 0x03005D60
_0800E3D4:
	ldr r2, _0800E3D8 @ =0x03005E30
	b _0800E3FE
	.align 2, 0
_0800E3D8: .4byte 0x03005E30
_0800E3DC:
	ldr r2, _0800E3E0 @ =0x03005DA0
	b _0800E3FE
	.align 2, 0
_0800E3E0: .4byte 0x03005DA0
_0800E3E4:
	ldr r2, _0800E3E8 @ =0x03005A90
	b _0800E3FE
	.align 2, 0
_0800E3E8: .4byte 0x03005A90
_0800E3EC:
	ldr r2, _0800E3F0 @ =0x03005AD0
	b _0800E3FE
	.align 2, 0
_0800E3F0: .4byte 0x03005AD0
_0800E3F4:
	ldr r2, _0800E3F8 @ =0x03005CE0
	b _0800E3FE
	.align 2, 0
_0800E3F8: .4byte 0x03005CE0
_0800E3FC:
	ldr r2, _0800E408 @ =0x03005DF0
_0800E3FE:
	adds r0, r3, #0
	movs r1, #1
	bl StartBgmExt
	b _0800E416
	.align 2, 0
_0800E408: .4byte 0x03005DF0
_0800E40C:
	ldr r2, _0800E41C @ =0x03005B10
	adds r0, r3, #0
	movs r1, #1
	bl StartBgmExt
_0800E416:
	movs r0, #2
_0800E418:
	pop {r1}
	bx r1
	.align 2, 0
_0800E41C: .4byte 0x03005B10

	thumb_func_start EvtCmd_OverrideBgm
EvtCmd_OverrideBgm: @ 0x0800E420
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E446
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl OverrideBgm
	adds r0, r4, #0
	movs r1, #0x21
	bl StartTemporaryLock
	movs r0, #2
	b _0800E448
_0800E446:
	movs r0, #0
_0800E448:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_RestoreBgm
EvtCmd_RestoreBgm: @ 0x0800E450
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl RestoreBgm
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_FadeBgmIn
EvtCmd_FadeBgmIn: @ 0x0800E460
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E47E
	ldr r1, [r2, #0x30]
	ldrh r0, [r1, #2]
	ldr r1, [r1, #4]
	movs r2, #0
	bl StartBgmFadeIn
_0800E47E:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_FadeBgmOut
EvtCmd_FadeBgmOut: @ 0x0800E484
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E4A2
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	bl FadeBgmOut_2
	movs r0, #2
	b _0800E4A4
_0800E4A2:
	movs r0, #0
_0800E4A4:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_LowerBgmVolume
EvtCmd_LowerBgmVolume: @ 0x0800E4A8
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E4CA
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	movs r0, #2
	b _0800E4CC
_0800E4CA:
	movs r0, #0
_0800E4CC:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_RestoreBgmVolume
EvtCmd_RestoreBgmVolume: @ 0x0800E4D0
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E4F2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	movs r0, #2
	b _0800E4FC
_0800E4F2:
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	movs r0, #0
_0800E4FC:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_PlaySe
EvtCmd_PlaySe: @ 0x0800E500
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E526
	ldr r0, _0800E52C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800E526
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	bl sub_080BE594
_0800E526:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E52C: .4byte 0x0202BBF8

	thumb_func_start EventEndBattleMap
EventEndBattleMap: @ 0x0800E530
	adds r0, #0x5e
	movs r1, #8
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start EvtCmd_NextChapter
EvtCmd_NextChapter: @ 0x0800E540
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r5, [r0, #2]
	bl EndAllMus
	adds r0, r5, #0
	bl SetNextChapter
	movs r0, #1
	bl SetNextGameAction
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #8
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800E572
	adds r0, r4, #0
	bl StartSlowLockingFadeToBlack
_0800E572:
	cmp r5, #0x2f
	beq _0800E57C
	movs r0, #4
	bl FadeBgmOut
_0800E57C:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_EndGame
EvtCmd_EndGame: @ 0x0800E584
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	bl SetNextGameAction
	adds r0, r4, #0
	bl EventEndBattleMap
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_EndLynCampaign
EvtCmd_EndLynCampaign: @ 0x0800E59C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	bl SetNextGameAction
	adds r0, r4, #0
	bl EventEndBattleMap
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_SetMap
EvtCmd_SetMap: @ 0x0800E5B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0800E5FC @ =0x0202BBF8
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	strb r0, [r1, #0xe]
	bl sub_0802E0F4
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	ldr r5, _0800E600 @ =0x0202BBB8
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0xc]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	strh r0, [r5, #0xe]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E5FC: .4byte 0x0202BBF8
_0800E600: .4byte 0x0202BBB8

	thumb_func_start EvtCmd_SetMapId
EvtCmd_SetMapId: @ 0x0800E604
	ldr r1, _0800E610 @ =0x0202BBF8
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	strb r0, [r1, #0xe]
	movs r0, #0
	bx lr
	.align 2, 0
_0800E610: .4byte 0x0202BBF8

	thumb_func_start Event_EndSkip
Event_EndSkip: @ 0x0800E614
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _0800E65C @ =0x0000FFFB
	ldrh r2, [r1]
	ands r0, r2
	movs r4, #0
	strh r0, [r1]
	bl ApplySystemGraphics
	bl ApplyChapterMapPalettes
	bl ApplyUnitSpritePalettes
	ldr r2, _0800E660 @ =0x03002870
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
	adds r1, r5, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
	str r4, [r5, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E65C: .4byte 0x0000FFFB
_0800E660: .4byte 0x03002870

	thumb_func_start EvtCmd_NoSkip
EvtCmd_NoSkip: @ 0x0800E664
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E67C
	adds r0, r1, #0
	bl Event_EndSkip
_0800E67C:
	movs r0, #0x40
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_NoSkipTalk
EvtCmd_NoSkipTalk: @ 0x0800E68C
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E6A4
	adds r0, r1, #0
	bl Event_EndSkip
_0800E6A4:
	movs r0, #0xc0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_NoSkipTalkSlow
EvtCmd_NoSkipTalkSlow: @ 0x0800E6B4
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E6CC
	adds r0, r1, #0
	bl Event_EndSkip
_0800E6CC:
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_YesSkip
EvtCmd_YesSkip: @ 0x0800E6E0
	adds r2, r0, #0
	adds r2, #0x5e
	ldrh r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800E6FC
	ldr r0, _0800E6F8 @ =0x0000FE1F
	ands r0, r1
	strh r0, [r2]
	movs r0, #2
	b _0800E6FE
	.align 2, 0
_0800E6F8: .4byte 0x0000FE1F
_0800E6FC:
	movs r0, #0
_0800E6FE:
	bx lr

	thumb_func_start EvtCmd_SilentSkip
EvtCmd_SilentSkip: @ 0x0800E700
	adds r1, r0, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r2, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0800E716
	movs r0, #0x20
	strh r0, [r1]
	movs r0, #2
	b _0800E718
_0800E716:
	movs r0, #0
_0800E718:
	bx lr
	.align 2, 0

	thumb_func_start EvtCmd_NoSkipUnlessNewGamePlus
EvtCmd_NoSkipUnlessNewGamePlus: @ 0x0800E71C
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E734
	adds r0, r1, #0
	bl Event_EndSkip
_0800E734:
	bl WasGameBeatenAtLeastOnce
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800E746
	movs r0, #0x40
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
_0800E746:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_NoSkipTalkSlowUnlessNewGamePlus
EvtCmd_NoSkipTalkSlowUnlessNewGamePlus: @ 0x0800E750
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E768
	adds r0, r1, #0
	bl Event_EndSkip
_0800E768:
	bl WasGameBeatenAtLeastOnce
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E778
	movs r1, #0xa0
	lsls r1, r1, #1
	b _0800E77C
_0800E778:
	movs r1, #0xe0
	lsls r1, r1, #1
_0800E77C:
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_NoSkipSlowUnlessNewGamePlus
EvtCmd_NoSkipSlowUnlessNewGamePlus: @ 0x0800E78C
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E7A4
	adds r0, r1, #0
	bl Event_EndSkip
_0800E7A4:
	bl WasGameBeatenAtLeastOnce
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E7B4
	movs r1, #0xc0
	lsls r1, r1, #1
	b _0800E7B8
_0800E7B4:
	movs r1, #0xe0
	lsls r1, r1, #1
_0800E7B8:
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_FadeToBlack
EvtCmd_FadeToBlack: @ 0x0800E7C8
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E7E6
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl StartLockingFadeToBlack
	movs r0, #2
	b _0800E7E8
_0800E7E6:
	movs r0, #0
_0800E7E8:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_FadeFromBlack
EvtCmd_FadeFromBlack: @ 0x0800E7EC
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E80A
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl StartLockingFadeFromBlack
	movs r0, #2
	b _0800E80C
_0800E80A:
	movs r0, #0
_0800E80C:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_LynModeDeathFadeToBlack
EvtCmd_LynModeDeathFadeToBlack: @ 0x0800E810
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800E826
	movs r0, #0
	b _0800E83E
_0800E826:
	bl GetLynModeDeathFlag
	lsls r0, r0, #0x18
	movs r1, #4
	cmp r0, #0
	beq _0800E834
	movs r1, #0x10
_0800E834:
	adds r0, r1, #0
	adds r1, r4, #0
	bl StartLockingFadeToBlack
	movs r0, #2
_0800E83E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_FadeToWhite
EvtCmd_FadeToWhite: @ 0x0800E844
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E862
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl StartLockingFadeToWhite
	movs r0, #2
	b _0800E864
_0800E862:
	movs r0, #0
_0800E864:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_FadeFromWhite
EvtCmd_FadeFromWhite: @ 0x0800E868
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E886
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl StartLockingFadeFromWhite
	movs r0, #2
	b _0800E888
_0800E886:
	movs r0, #0
_0800E888:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_ExitMap
EvtCmd_ExitMap: @ 0x0800E88C
	push {lr}
	bl Event_SetExitMap
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_EnterMap
EvtCmd_EnterMap: @ 0x0800E898
	push {lr}
	bl Event_SetEnterMap
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800E8A4
sub_0800E8A4: @ 0x0800E8A4
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E8C6
	ldr r2, [r3, #0x30]
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl sub_080AEC5C
	movs r0, #2
	b _0800E8C8
_0800E8C6:
	movs r0, #0
_0800E8C8:
	pop {r1}
	bx r1

	thumb_func_start sub_0800E8CC
sub_0800E8CC: @ 0x0800E8CC
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E8EE
	ldr r2, [r3, #0x30]
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl sub_080AECB0
	movs r0, #2
	b _0800E8F0
_0800E8EE:
	movs r0, #0
_0800E8F0:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_GiveGold
EvtCmd_GiveGold: @ 0x0800E8F4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r4, [r0, #4]
	cmp r4, #0
	bne _0800E902
	ldr r4, [r5, #0x58]
_0800E902:
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0800E91C
	bl GetGold
	adds r0, r0, r4
	bl SetGold
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartPopup_800EE90
	b _0800E93C
_0800E91C:
	ldr r0, _0800E944 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800E934
	bl GetGold
	adds r0, r0, r4
	bl SetGold
_0800E934:
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartPopup_800EE4C
_0800E93C:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E944: .4byte 0x03004690

	thumb_func_start EvtCmd_FightScript
EvtCmd_FightScript: @ 0x0800E948
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl sub_08053428
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	mov sb, r0
	mov r2, r8
	ldr r0, [r2, #0x30]
	ldr r0, [r0, #8]
	bl GetUnitByPid
	mov sl, r0
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r6, [r0, #0xc]
	movs r1, #0xff
	adds r4, r1, #0
	ldrh r2, [r0, #0x12]
	ands r4, r2
	ldrb r2, [r0, #0x13]
	ands r2, r1
	str r2, [sp]
	ldrh r7, [r0, #0x10]
	ldr r1, _0800E994 @ =0x0203A85C
	cmp r2, #0
	bne _0800E998
	str r6, [r1, #0x18]
	b _0800E99C
	.align 2, 0
_0800E994: .4byte 0x0203A85C
_0800E998:
	movs r0, #0
	str r0, [r1, #0x18]
_0800E99C:
	mov r1, sb
	ldrh r0, [r1, #0x1e]
	bl GetItemKind
	cmp r0, #4
	beq _0800E9AC
	cmp r7, #0
	beq _0800E9BC
_0800E9AC:
	mov r0, sb
	movs r1, #0
	bl BattleInitItemEffect
	mov r0, sl
	bl BattleInitItemEffectTarget
	b _0800E9D2
_0800E9BC:
	cmp r4, #0
	bne _0800E9CA
	mov r0, sb
	mov r1, sl
	bl BattleGenerateReal
	b _0800E9D2
_0800E9CA:
	mov r0, sb
	mov r1, sl
	bl BattleGenerateBallistaReal
_0800E9D2:
	ldr r4, _0800EA88 @ =0x0203A3F0
	adds r1, r4, #0
	adds r1, #0x6e
	movs r0, #0
	strb r0, [r1]
	ldr r5, _0800EA8C @ =0x0203A470
	adds r1, r5, #0
	adds r1, #0x6e
	strb r0, [r1]
	mov r0, sb
	bl GetUnitEquippedWeapon
	ldr r2, _0800EA90 @ =0x0203A438
	strh r0, [r2]
	adds r4, #0x4a
	strh r0, [r4]
	mov r0, sl
	bl GetUnitEquippedWeapon
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	cmp r7, #0
	beq _0800EA22
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r2, _0800EA90 @ =0x0203A438
	strh r0, [r2]
	strh r0, [r4]
	cmp r7, #0x7f
	bgt _0800EA22
	cmp r7, #0x7c
	blt _0800EA22
	ldr r1, _0800EA94 @ =0x0203A3D8
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
_0800EA22:
	mov r7, r8
	adds r7, #0x5e
	ldr r0, [sp]
	cmp r0, #0
	bne _0800EA60
	bl ClearBattleHits
	ldr r2, _0800EA98 @ =0x0203A50C
	ldr r1, [r2]
	ldr r0, [r6]
	str r0, [r1]
	movs r0, #0x80
	ldrb r1, [r6, #2]
	ands r0, r1
	cmp r0, #0
	bne _0800EA5C
	adds r4, r2, #0
	movs r5, #0x80
_0800EA46:
	bl BattleHitAdvance
	adds r6, #4
	ldr r1, [r4]
	ldr r0, [r6]
	str r0, [r1]
	adds r0, r5, #0
	ldrb r2, [r6, #2]
	ands r0, r2
	cmp r0, #0
	beq _0800EA46
_0800EA5C:
	bl BattleHitTerminate
_0800EA60:
	movs r0, #4
	ldrh r7, [r7]
	ands r0, r7
	cmp r0, #0
	bne _0800EA78
	mov r0, r8
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800EAA0
_0800EA78:
	bl BattleApplyUnitUpdates
	bl sub_08053434
	ldr r1, _0800EA9C @ =0x0203A85C
	movs r0, #0
	str r0, [r1, #0x18]
	b _0800EAE6
	.align 2, 0
_0800EA88: .4byte 0x0203A3F0
_0800EA8C: .4byte 0x0203A470
_0800EA90: .4byte 0x0203A438
_0800EA94: .4byte 0x0203A3D8
_0800EA98: .4byte 0x0203A50C
_0800EA9C: .4byte 0x0203A85C
_0800EAA0:
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	adds r1, #0x52
	strh r0, [r1]
	ldr r0, _0800EAF8 @ =EventScriptedBattleWait
	mov r1, r8
	str r0, [r1, #0x40]
	mov r0, sb
	bl UnitBeginAction
	ldr r4, _0800EAFC @ =0x03004690
	ldr r0, [r4]
	bl HideUnitSprite
	ldr r0, [r4]
	bl StartMu
	bl SetAutoMuDefaultFacing
	bl BeginBattleAnimations
	mov r0, r8
	movs r1, #7
	bl Proc_Mark
	ldr r1, _0800EB00 @ =0x0203A97C
	mov r2, sb
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #2]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #3]
	movs r0, #2
_0800EAE6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800EAF8: .4byte EventScriptedBattleWait
_0800EAFC: .4byte 0x03004690
_0800EB00: .4byte 0x0203A97C

	thumb_func_start EventScriptedBattleWait
EventScriptedBattleWait: @ 0x0800EB04
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0800EB28
	ldr r0, _0800EB30 @ =EventScriptedBattleWaitB
	str r0, [r5, #0x40]
	bl BattleApplyUnitUpdates
	ldr r1, _0800EB34 @ =0x0203A85C
	movs r0, #0
	str r0, [r1, #0x18]
_0800EB28:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EB30: .4byte EventScriptedBattleWaitB
_0800EB34: .4byte 0x0203A85C

	thumb_func_start EventScriptedBattleWaitB
EventScriptedBattleWaitB: @ 0x0800EB38
	push {lr}
	movs r1, #0
	str r1, [r0, #0x40]
	movs r1, #6
	bl Proc_Mark
	bl AiEndMuAndRefreshUnits
	pop {r0}
	bx r0

	thumb_func_start EvtCmd_SetNoReloadGfx
EvtCmd_SetNoReloadGfx: @ 0x0800EB4C
	adds r0, #0x5e
	movs r1, #0x10
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start EvtCmd_OnSkipFunc
EvtCmd_OnSkipFunc: @ 0x0800EB5C
	ldr r1, [r0, #0x30]
	ldr r1, [r1, #4]
	str r1, [r0, #0x3c]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start EvtCmd_ClearOnSkipFunc
EvtCmd_ClearOnSkipFunc: @ 0x0800EB68
	movs r1, #0
	str r1, [r0, #0x3c]
	movs r0, #0
	bx lr

	thumb_func_start EvtCmd_SetWeatherWithFade
EvtCmd_SetWeatherWithFade: @ 0x0800EB70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EB8C @ =0x08B91A78
	adds r1, r4, #0
	bl SpawnProcLocking
	ldr r1, [r4, #0x30]
	ldrh r1, [r1, #2]
	adds r0, #0x64
	strh r1, [r0]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EB8C: .4byte 0x08B91A78

	thumb_func_start EvtCmd_SetWeather
EvtCmd_SetWeather: @ 0x0800EB90
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800EBAC
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl SetWeather
	b _0800EBBC
_0800EBAC:
	ldr r0, _0800EBC4 @ =0x08B91A78
	adds r1, r4, #0
	bl SpawnProcLocking
	ldr r1, [r4, #0x30]
	ldrh r1, [r1, #2]
	adds r0, #0x64
	strh r1, [r0]
_0800EBBC:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EBC4: .4byte 0x08B91A78

	thumb_func_start EventWeatherChangeWithFade_SetWeather
EventWeatherChangeWithFade_SetWeather: @ 0x0800EBC8
	push {lr}
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl SetWeather
	pop {r0}
	bx r0

	thumb_func_start EvtCmd_SetVision
EvtCmd_SetVision: @ 0x0800EBD8
	push {lr}
	ldr r1, [r0, #0x30]
	ldrh r2, [r1, #2]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800EBF2
	adds r0, r2, #0
	bl SetVisionWithFade
	b _0800EBF8
_0800EBF2:
	adds r0, r2, #0
	bl SetVision
_0800EBF8:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_SetVisionInstant
EvtCmd_SetVisionInstant: @ 0x0800EC00
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl SetVision
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_BreakItemSeal
EvtCmd_BreakItemSeal: @ 0x0800EC10
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldr r0, [r1, #4]
	ldrb r1, [r1, #8]
	bl BreakItemSealForPid
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0xc]
	bl SetFlag
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_EnqueueEvent
EvtCmd_EnqueueEvent: @ 0x0800EC30
	push {lr}
	ldr r0, [r0, #0x30]
	adds r0, #4
	bl sub_0800AF5C
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_End
EvtCmd_End: @ 0x0800EC40
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0800EC5A
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x30]
	str r5, [r4, #0x34]
	str r5, [r4, #0x38]
	movs r5, #1
	b _0800EC60
_0800EC5A:
	adds r0, r4, #0
	bl Proc_Break
_0800EC60:
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800EC84
	ldr r0, _0800EC80 @ =0x08B907C0
	bl Proc_Find
	cmp r0, #0
	beq _0800EC92
	bl ClearTalk
	b _0800EC92
	.align 2, 0
_0800EC80: .4byte 0x08B907C0
_0800EC84:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800EC92
	adds r0, r4, #0
	bl EventClearTalkDisplayed
_0800EC92:
	cmp r5, #0
	bne _0800EC9A
	movs r0, #2
	b _0800EC9C
_0800EC9A:
	movs r0, #1
_0800EC9C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800ECA4
sub_0800ECA4: @ 0x0800ECA4
	push {lr}
	bl EvtCmd_End
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EventClearTalkDisplayed
EventClearTalkDisplayed: @ 0x0800ECB0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800ECC6
	bl ClearTalk
	b _0800ECEE
_0800ECC6:
	ldr r5, _0800ECF4 @ =0x08B907C0
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	beq _0800ECEE
	bl ClearTalkBubble
	ldr r1, _0800ECF8 @ =StartFaceFadeOut
	adds r0, r5, #0
	bl Proc_ForEach
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl StartTemporaryLock
_0800ECEE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800ECF4: .4byte 0x08B907C0
_0800ECF8: .4byte StartFaceFadeOut

	thumb_func_start ClearTalk
ClearTalk: @ 0x0800ECFC
	push {lr}
	bl ClearTalkBubble
	ldr r0, _0800ED14 @ =0x08B907C0
	bl Proc_EndEach
	bl InitFaces
	bl sub_08007DD4
	pop {r0}
	bx r0
	.align 2, 0
_0800ED14: .4byte 0x08B907C0

	thumb_func_start sub_0800ED18
sub_0800ED18: @ 0x0800ED18
	bx lr
	.align 2, 0

	thumb_func_start sub_0800ED1C
sub_0800ED1C: @ 0x0800ED1C
	bx lr
	.align 2, 0

	thumb_func_start sub_0800ED20
sub_0800ED20: @ 0x0800ED20
	push {lr}
	movs r0, #6
	bl sub_080046F4
	cmp r0, #0
	beq _0800ED2E
	movs r0, #1
_0800ED2E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800ED34
sub_0800ED34: @ 0x0800ED34
	push {lr}
	ldr r0, _0800ED48 @ =0x08B90D88
	bl sub_080046C8
	cmp r0, #0
	beq _0800ED42
	movs r0, #1
_0800ED42:
	pop {r1}
	bx r1
	.align 2, 0
_0800ED48: .4byte 0x08B90D88

	thumb_func_start sub_0800ED4C
sub_0800ED4C: @ 0x0800ED4C
	push {lr}
	movs r0, #6
	bl sub_08004834
	movs r0, #7
	bl sub_08004834
	movs r0, #5
	bl sub_08004834
	bl EndAllMus
	pop {r0}
	bx r0

	thumb_func_start sub_0800ED68
sub_0800ED68: @ 0x0800ED68
	push {lr}
	ldr r0, _0800ED74 @ =0x08B91AB8
	bl SetFaceConfig
	pop {r0}
	bx r0
	.align 2, 0
_0800ED74: .4byte 0x08B91AB8

	thumb_func_start sub_0800ED78
sub_0800ED78: @ 0x0800ED78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800ED8C @ =0x08B91AD8
	bl sub_0800AF5C
	str r4, [r0, #0x48]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800ED8C: .4byte 0x08B91AD8

	thumb_func_start sub_0800ED90
sub_0800ED90: @ 0x0800ED90
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0800EDA8 @ =0x08B91AE8
	bl sub_0800AF5C
	str r4, [r0, #0x48]
	str r5, [r0, #0x58]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800EDA8: .4byte 0x08B91AE8

	thumb_func_start sub_0800EDAC
sub_0800EDAC: @ 0x0800EDAC
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _0800EDBC
	movs r1, #0
	bl StartBgm
	b _0800EDC2
_0800EDBC:
	movs r0, #0x90
	bl SetBgmVolume
_0800EDC2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800EDC8
sub_0800EDC8: @ 0x0800EDC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EDDC @ =0x08B91B10
	bl sub_0800AF5C
	str r4, [r0, #0x48]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EDDC: .4byte 0x08B91B10

	thumb_func_start sub_0800EDE0
sub_0800EDE0: @ 0x0800EDE0
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800AD28
	ldr r0, _0800EE00 @ =0x08B91B34
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800AD40
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE00: .4byte 0x08B91B34

	thumb_func_start sub_0800EE04
sub_0800EE04: @ 0x0800EE04
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800AD28
	ldr r0, _0800EE24 @ =0x08B91B7C
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800AD40
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE24: .4byte 0x08B91B7C

	thumb_func_start sub_0800EE28
sub_0800EE28: @ 0x0800EE28
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800AD28
	ldr r0, _0800EE48 @ =0x08B91BC4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800AD40
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE48: .4byte 0x08B91BC4

	thumb_func_start StartPopup_800EE4C
StartPopup_800EE4C: @ 0x0800EE4C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0800AD34
	ldr r0, _0800EE70 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800EE78
	ldr r0, _0800EE74 @ =0x08B91BE4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800AD40
	b _0800EE84
	.align 2, 0
_0800EE70: .4byte 0x03004690
_0800EE74: .4byte 0x08B91BE4
_0800EE78:
	ldr r0, _0800EE8C @ =0x08B91C2C
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800AD40
_0800EE84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE8C: .4byte 0x08B91C2C

	thumb_func_start StartPopup_800EE90
StartPopup_800EE90: @ 0x0800EE90
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0800AD34
	ldr r0, _0800EEAC @ =0x08B91BE4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800AD40
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EEAC: .4byte 0x08B91BE4

	thumb_func_start StartPopup_800EEB0
StartPopup_800EEB0: @ 0x0800EEB0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800AD28
	movs r0, #0xc0
	ldrb r4, [r4, #0xb]
	ands r0, r4
	cmp r0, #0
	bne _0800EEDC
	ldr r0, _0800EED8 @ =0x08B91C64
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl sub_0800AD40
	b _0800EEE8
	.align 2, 0
_0800EED8: .4byte 0x08B91C64
_0800EEDC:
	ldr r0, _0800EEF0 @ =0x08B91CBC
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl sub_0800AD40
_0800EEE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EEF0: .4byte 0x08B91CBC

	thumb_func_start sub_0800EEF4
sub_0800EEF4: @ 0x0800EEF4
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800AD28
	ldr r0, _0800EF1C @ =0x03004690
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800EF24
	ldr r0, _0800EF20 @ =0x08B91D04
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800AD40
	b _0800EF30
	.align 2, 0
_0800EF1C: .4byte 0x03004690
_0800EF20: .4byte 0x08B91D04
_0800EF24:
	ldr r0, _0800EF38 @ =0x08B91D5C
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl sub_0800AD40
_0800EF30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF38: .4byte 0x08B91D5C

	thumb_func_start sub_0800EF3C
sub_0800EF3C: @ 0x0800EF3C
	push {lr}
	adds r3, r0, #0
	ldr r0, _0800EF50 @ =0x08B91DA4
	movs r1, #0x60
	movs r2, #0
	bl sub_0800AD40
	pop {r0}
	bx r0
	.align 2, 0
_0800EF50: .4byte 0x08B91DA4

	thumb_func_start StartGiveItem
StartGiveItem: @ 0x0800EF54
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r2, #7
	bhi _0800EF70
	ldr r0, _0800EF6C @ =0x08B91DC4
	adds r1, r2, #0
	bl SpawnProc
	b _0800EF78
	.align 2, 0
_0800EF6C: .4byte 0x08B91DC4
_0800EF70:
	ldr r0, _0800EF98 @ =0x08B91DC4
	adds r1, r2, #0
	bl SpawnProcLocking
_0800EF78:
	str r5, [r0, #0x58]
	str r4, [r0, #0x54]
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0x80
	bne _0800EF90
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_0800EF90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EF98: .4byte 0x08B91DC4

	thumb_func_start GiveItem_DoPopup
GiveItem_DoPopup: @ 0x0800EF9C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x58]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl StartPopup_800EEB0
	pop {r0}
	bx r0

	thumb_func_start GiveItem_DoGiveItem
GiveItem_DoGiveItem: @ 0x0800EFB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x58]
	bl CreateItem
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl HandleGiveUnitItem
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0800EFCC
sub_0800EFCC: @ 0x0800EFCC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0800EFE4 @ =0x08B91DF4
	bl sub_0800AF5C
	adds r0, #0x5c
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EFE4: .4byte 0x08B91DF4

	thumb_func_start sub_0800EFE8
sub_0800EFE8: @ 0x0800EFE8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800F00C @ =0x08B91E0C
	bl sub_0800AF5C
	adds r1, r0, #0
	adds r1, #0x55
	strb r4, [r1]
	adds r0, #0x5c
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F00C: .4byte 0x08B91E0C

	thumb_func_start sub_0800F010
sub_0800F010: @ 0x0800F010
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800F024 @ =0x08B91E28
	bl sub_0800AF5C
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800F024: .4byte 0x08B91E28

	thumb_func_start sub_0800F028
sub_0800F028: @ 0x0800F028
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800F040 @ =0x08B91E40
	bl sub_0800AF5C
	adds r0, #0x4f
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800F040: .4byte 0x08B91E40

	thumb_func_start sub_0800F044
sub_0800F044: @ 0x0800F044
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0800F068 @ =0x08B91E4C
	bl sub_0800AF5C
	adds r1, r0, #0
	adds r1, #0x5c
	strh r4, [r1]
	adds r0, #0x4f
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F068: .4byte 0x08B91E4C

	thumb_func_start sub_0800F06C
sub_0800F06C: @ 0x0800F06C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800F088 @ =0x08B91E68
	bl sub_0800AF5C
	str r5, [r0, #0x58]
	adds r0, #0x4f
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F088: .4byte 0x08B91E68

	thumb_func_start sub_0800F08C
sub_0800F08C: @ 0x0800F08C
	push {lr}
	ldr r0, _0800F0A8 @ =0x08B90D88
	bl Proc_Find
	cmp r0, #0
	beq _0800F0A2
	adds r0, #0x5e
	movs r1, #2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_0800F0A2:
	pop {r0}
	bx r0
	.align 2, 0
_0800F0A8: .4byte 0x08B90D88

	thumb_func_start sub_0800F0AC
sub_0800F0AC: @ 0x0800F0AC
	push {lr}
	bl sub_08079280
	adds r1, r0, #0
	movs r2, #0
	b _0800F0BC
_0800F0B8:
	adds r2, #1
	adds r1, #0x10
_0800F0BC:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800F0B8
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800F0C8
sub_0800F0C8: @ 0x0800F0C8
	push {r4, r5, r6, r7, lr}
	bl sub_08079280
	adds r6, r0, #0
	movs r7, #1
_0800F0D2:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0800F156
	ldr r2, [r4]
	cmp r2, #0
	beq _0800F156
	ldrb r0, [r6]
	cmp r0, #0
	bne _0800F0F0
	movs r0, #0xff
	strb r0, [r4, #0x10]
	b _0800F156
_0800F0F0:
	ldr r0, [r4, #0xc]
	ldr r1, _0800F144 @ =0x0201000C
	ands r0, r1
	cmp r0, #0
	bne _0800F156
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0800F14C
	ldr r5, _0800F148 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r5, #0x1b]
	cmp r2, #3
	bne _0800F120
	movs r1, #1
_0800F120:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r5, [r5, #0x1b]
	cmp r5, #3
	bne _0800F13A
	movs r1, #1
_0800F13A:
	adds r0, #0x88
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	b _0800F156
	.align 2, 0
_0800F144: .4byte 0x0201000C
_0800F148: .4byte 0x0202BBF8
_0800F14C:
	ldrb r0, [r6, #6]
	strb r0, [r4, #0x10]
	ldrb r0, [r6, #7]
	strb r0, [r4, #0x11]
	adds r6, #0x10
_0800F156:
	adds r7, #1
	cmp r7, #0x3f
	ble _0800F0D2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800F164
sub_0800F164: @ 0x0800F164
	push {r4, r5, lr}
	movs r4, #1
	movs r5, #1
	rsbs r5, r5, #0
_0800F16C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800F1B2
	ldr r0, [r2]
	cmp r0, #0
	beq _0800F1B2
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800F1B2
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800F19C
	movs r0, #0xff
	strb r0, [r2, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
	b _0800F1B2
_0800F19C:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0800F1B2
	adds r0, r2, #0
	bl sub_0800F1C0
_0800F1B2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800F16C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800F1C0
sub_0800F1C0: @ 0x0800F1C0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_08079280
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800F26A
	ldr r4, _0800F218 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0800F1F2
	movs r1, #1
_0800F1F2:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r7, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0800F20C
	movs r1, #1
_0800F20C:
	adds r0, #0x88
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r7, #0x11]
	b _0800F270
	.align 2, 0
_0800F218: .4byte 0x0202BBF8
_0800F21C:
	ldrb r0, [r4, #6]
	strb r0, [r7, #0x10]
	ldrb r0, [r4, #7]
	strb r0, [r7, #0x11]
	b _0800F270
_0800F226:
	movs r6, #0
	movs r5, #1
	b _0800F22E
_0800F22C:
	adds r5, #1
_0800F22E:
	cmp r5, #0x3f
	bgt _0800F264
	adds r0, r5, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800F22C
	ldr r0, [r2]
	cmp r0, #0
	beq _0800F22C
	ldr r0, [r2, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800F22C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	ldrb r1, [r4, #6]
	cmp r0, r1
	bne _0800F22C
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0800F22C
	movs r6, #1
_0800F264:
	cmp r6, #0
	beq _0800F21C
	adds r4, #0x10
_0800F26A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800F226
_0800F270:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800F278
sub_0800F278: @ 0x0800F278
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F27C
sub_0800F27C: @ 0x0800F27C
	push {r4, r5, r6, lr}
	movs r6, #1
_0800F280:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0800F2E4
	ldr r1, [r4]
	cmp r1, #0
	beq _0800F2E4
	ldr r0, [r4, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0800F2E4
	ldr r5, _0800F2F0 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r5, #0x1b]
	cmp r2, #3
	bne _0800F2B8
	movs r1, #1
_0800F2B8:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r5, [r5, #0x1b]
	cmp r5, #3
	bne _0800F2D2
	movs r1, #1
_0800F2D2:
	adds r0, #0x88
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
_0800F2E4:
	adds r6, #1
	cmp r6, #0x3f
	ble _0800F280
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800F2F0: .4byte 0x0202BBF8

	thumb_func_start Event_SetExitMap
Event_SetExitMap: @ 0x0800F2F4
	adds r0, #0x4d
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start Event_SetEnterMap
Event_SetEnterMap: @ 0x0800F2FC
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0800F316
	adds r0, r2, #0
	adds r0, #0x4d
	strb r1, [r0]
_0800F316:
	bx lr

	thumb_func_start sub_0800F318
sub_0800F318: @ 0x0800F318
	push {lr}
	movs r0, #0
	bl SetWeather
	pop {r0}
	bx r0

	thumb_func_start sub_0800F324
sub_0800F324: @ 0x0800F324
	push {lr}
	movs r0, #6
	bl SetWeather
	pop {r0}
	bx r0

	thumb_func_start sub_0800F330
sub_0800F330: @ 0x0800F330
	push {lr}
	ldr r0, _0800F340 @ =0x03005D20
	movs r1, #3
	bl m4aMPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
_0800F340: .4byte 0x03005D20

	thumb_func_start sub_0800F344
sub_0800F344: @ 0x0800F344
	push {lr}
	ldr r0, _0800F354 @ =0x03005B10
	movs r1, #3
	bl sub_080BE73C
	pop {r0}
	bx r0
	.align 2, 0
_0800F354: .4byte 0x03005B10

	thumb_func_start sub_0800F358
sub_0800F358: @ 0x0800F358
	push {lr}
	ldr r0, _0800F368 @ =0x03005B10
	movs r1, #2
	bl m4aMPlayFadeIn
	pop {r0}
	bx r0
	.align 2, 0
_0800F368: .4byte 0x03005B10

	thumb_func_start sub_0800F36C
sub_0800F36C: @ 0x0800F36C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F38C
	ldr r4, _0800F388 @ =0x0000FFFF
	ands r4, r2
	b _0800F390
	.align 2, 0
_0800F388: .4byte 0x0000FFFF
_0800F38C:
	movs r4, #1
	rsbs r4, r4, #0
_0800F390:
	ldr r2, [r3, #0x30]
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F3A4
	adds r6, r1, #0
_0800F3A4:
	ldr r5, [r2, #0xc]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F3CC
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_080B5554
	adds r0, r5, #0
	bl sub_080B55BC
	movs r0, #2
	b _0800F3CE
_0800F3CC:
	movs r0, #0
_0800F3CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F3D4
sub_0800F3D4: @ 0x0800F3D4
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F3F0
	adds r0, r2, #0
	bl StartSlowLockingFadeToBlack
	movs r0, #2
	b _0800F410
_0800F3F0:
	ldr r2, _0800F414 @ =0x03002870
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
	movs r0, #0
_0800F410:
	pop {r1}
	bx r1
	.align 2, 0
_0800F414: .4byte 0x03002870

	thumb_func_start sub_0800F418
sub_0800F418: @ 0x0800F418
	push {lr}
	bl sub_080B558C
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800F424
sub_0800F424: @ 0x0800F424
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F440
	ldr r3, _0800F43C @ =0x0000FFFF
	ands r3, r2
	b _0800F444
	.align 2, 0
_0800F43C: .4byte 0x0000FFFF
_0800F440:
	movs r3, #1
	rsbs r3, r3, #0
_0800F444:
	ldr r0, [r1, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800F458
	adds r4, r2, #0
_0800F458:
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F470
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080B4F74
	movs r0, #2
	b _0800F472
_0800F470:
	movs r0, #0
_0800F472:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F478
sub_0800F478: @ 0x0800F478
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F48E
	bl sub_080B4F70
	movs r0, #2
	b _0800F490
_0800F48E:
	movs r0, #0
_0800F490:
	pop {r1}
	bx r1

	thumb_func_start sub_0800F494
sub_0800F494: @ 0x0800F494
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F4B0
	ldr r4, _0800F4AC @ =0x0000FFFF
	ands r4, r2
	b _0800F4B4
	.align 2, 0
_0800F4AC: .4byte 0x0000FFFF
_0800F4B0:
	movs r4, #1
	rsbs r4, r4, #0
_0800F4B4:
	ldr r3, [r1, #0x30]
	ldrh r2, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F4C8
	adds r5, r2, #0
_0800F4C8:
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F4E4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B4F78
	movs r0, #2
	b _0800F4E6
_0800F4E4:
	movs r0, #0
_0800F4E6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F4EC
sub_0800F4EC: @ 0x0800F4EC
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F508
	ldr r3, _0800F504 @ =0x0000FFFF
	ands r3, r2
	b _0800F50C
	.align 2, 0
_0800F504: .4byte 0x0000FFFF
_0800F508:
	movs r3, #1
	rsbs r3, r3, #0
_0800F50C:
	ldr r0, [r1, #0x30]
	ldrh r2, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800F520
	adds r4, r2, #0
_0800F520:
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F538
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080B5B44
	movs r0, #2
	b _0800F53A
_0800F538:
	movs r0, #0
_0800F53A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F540
sub_0800F540: @ 0x0800F540
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080B5B6C
	adds r4, #0x5e
	movs r0, #4
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _0800F558
	movs r0, #2
	b _0800F55A
_0800F558:
	movs r0, #0
_0800F55A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F560
sub_0800F560: @ 0x0800F560
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r4, [r1, #4]
	ldr r5, [r1, #8]
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F5A2
	cmp r2, #0
	beq _0800F596
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_080B5760
	b _0800F5A2
_0800F596:
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B4D4C
_0800F5A2:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F5AC
sub_0800F5AC: @ 0x0800F5AC
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F5B0
sub_0800F5B0: @ 0x0800F5B0
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F5B4
sub_0800F5B4: @ 0x0800F5B4
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r4, [r1, #8]
	ldr r3, [r1, #0xc]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0800F5D8
	adds r0, r2, #0
	bl sub_08006D50
	b _0800F5F8
_0800F5D8:
	cmp r3, #0
	beq _0800F5EE
	str r1, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	adds r0, r3, #0
	movs r1, #7
	movs r3, #0
	bl sub_080B5760
	b _0800F5F8
_0800F5EE:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	adds r0, r2, #0
	bl sub_080B4E88
_0800F5F8:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F604
sub_0800F604: @ 0x0800F604
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F608
sub_0800F608: @ 0x0800F608
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F60C
sub_0800F60C: @ 0x0800F60C
	push {lr}
	movs r1, #0x2a
	ldrsh r0, [r0, r1]
	bl sub_08006D50
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800F61C
sub_0800F61C: @ 0x0800F61C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x5e
	movs r0, #4
	ldrh r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _0800F632
	movs r0, #0
	b _0800F650
_0800F632:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl sub_080B4FE4
	ldr r0, _0800F658 @ =EventTalkWait
	str r0, [r4, #0x40]
	movs r0, #0x80
	ldrh r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0800F64E
	movs r0, #4
	bl SetTalkFlag
_0800F64E:
	movs r0, #2
_0800F650:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800F658: .4byte EventTalkWait

	thumb_func_start sub_0800F65C
sub_0800F65C: @ 0x0800F65C
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F674
	movs r0, #1
	bl sub_080B3D20
	movs r0, #2
	b _0800F676
_0800F674:
	movs r0, #0
_0800F676:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F67C
sub_0800F67C: @ 0x0800F67C
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F694
	movs r0, #0
	bl sub_080B3D20
	movs r0, #2
	b _0800F696
_0800F694:
	movs r0, #0
_0800F696:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F69C
sub_0800F69C: @ 0x0800F69C
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F6B2
	bl sub_080B3D78
	movs r0, #2
	b _0800F6B4
_0800F6B2:
	movs r0, #0
_0800F6B4:
	pop {r1}
	bx r1

	thumb_func_start sub_0800F6B8
sub_0800F6B8: @ 0x0800F6B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r7, [r0, #4]
	ldr r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800F6D8
	ldr r4, _0800F6D4 @ =0x0000FFFF
	ands r4, r3
	b _0800F6DC
	.align 2, 0
_0800F6D4: .4byte 0x0000FFFF
_0800F6D8:
	movs r4, #1
	rsbs r4, r4, #0
_0800F6DC:
	ldr r1, [r2, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F6F0
	adds r5, r3, #0
_0800F6F0:
	ldr r6, [r1, #0xc]
	ldr r3, [r1, #0x10]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F726
	cmp r3, #0
	beq _0800F71A
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	adds r0, r3, #0
	movs r1, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_080B5760
	b _0800F726
_0800F71A:
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_080B4904
_0800F726:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0800F730
sub_0800F730: @ 0x0800F730
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r3, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F766
	cmp r3, #0
	beq _0800F760
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r3, #0
	movs r1, #1
	movs r3, #0
	bl sub_080B5760
	b _0800F766
_0800F760:
	adds r0, r2, #0
	bl sub_080B4ADC
_0800F766:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F770
sub_0800F770: @ 0x0800F770
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r4, [r1, #8]
	ldr r2, [r1, #0xc]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F7AC
	cmp r2, #0
	beq _0800F7A4
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r2, #0
	movs r1, #2
	adds r2, r3, #0
	adds r3, r4, #0
	bl sub_080B5760
	b _0800F7AC
_0800F7A4:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080B39D8
_0800F7AC:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F7B8
sub_0800F7B8: @ 0x0800F7B8
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r3, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0800F7D6
	movs r0, #0
	b _0800F7F4
_0800F7D6:
	cmp r3, #0
	beq _0800F7EC
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r3, #0
	movs r1, #3
	movs r3, #0
	bl sub_080B5760
	b _0800F7F2
_0800F7EC:
	adds r0, r2, #0
	bl sub_080B3AFC
_0800F7F2:
	movs r0, #2
_0800F7F4:
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F7FC
sub_0800F7FC: @ 0x0800F7FC
	movs r1, #0
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F804
sub_0800F804: @ 0x0800F804
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F81A
	bl sub_080B3B70
	movs r0, #2
	b _0800F81C
_0800F81A:
	movs r0, #0
_0800F81C:
	pop {r1}
	bx r1

	thumb_func_start sub_0800F820
sub_0800F820: @ 0x0800F820
	movs r1, #0
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_0800F828
sub_0800F828: @ 0x0800F828
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F83E
	bl sub_080B3BE8
	movs r0, #2
	b _0800F840
_0800F83E:
	movs r0, #0
_0800F840:
	pop {r1}
	bx r1

	thumb_func_start sub_0800F844
sub_0800F844: @ 0x0800F844
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F87C
	cmp r2, #0
	beq _0800F876
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xa
	movs r2, #0
	movs r3, #0
	bl sub_080B5760
	b _0800F87C
_0800F876:
	adds r0, r3, #0
	bl sub_080B5844
_0800F87C:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_0800F884
sub_0800F884: @ 0x0800F884
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F8BC
	cmp r2, #0
	beq _0800F8B6
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #9
	movs r2, #0
	movs r3, #0
	bl sub_080B5760
	b _0800F8BC
_0800F8B6:
	adds r0, r3, #0
	bl sub_080B5934
_0800F8BC:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_0800F8C4
sub_0800F8C4: @ 0x0800F8C4
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F8FC
	cmp r2, #0
	beq _0800F8F6
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xc
	movs r2, #0
	movs r3, #0
	bl sub_080B5760
	b _0800F8FC
_0800F8F6:
	adds r0, r3, #0
	bl sub_080B4890
_0800F8FC:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_0800F904
sub_0800F904: @ 0x0800F904
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F93C
	cmp r2, #0
	beq _0800F936
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xb
	movs r2, #0
	movs r3, #0
	bl sub_080B5760
	b _0800F93C
_0800F936:
	adds r0, r3, #0
	bl sub_080B4828
_0800F93C:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1

	thumb_func_start sub_0800F944
sub_0800F944: @ 0x0800F944
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F960
	ldr r4, _0800F95C @ =0x0000FFFF
	ands r4, r2
	b _0800F964
	.align 2, 0
_0800F95C: .4byte 0x0000FFFF
_0800F960:
	movs r4, #1
	rsbs r4, r4, #0
_0800F964:
	ldr r2, [r1, #0x30]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F978
	adds r5, r3, #0
_0800F978:
	ldr r2, [r2, #8]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F98E
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B4F68
_0800F98E:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800F998
sub_0800F998: @ 0x0800F998
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F9AA
	bl sub_080B4F6C
_0800F9AA:
	movs r0, #0
	pop {r1}
	bx r1

