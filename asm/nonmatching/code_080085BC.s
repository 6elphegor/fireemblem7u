	.include "macro.inc"

	.syntax unified

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
