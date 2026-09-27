	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08083CE8
sub_08083CE8: @ 0x08083CE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, _08083D1C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08083D6A
	bl GetDialogueBoxConfig
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08083D6A
	movs r3, #0x80
	mov r8, r3
	b _08083D84
	.align 2, 0
_08083D1C: .4byte 0x08B857F8
_08083D20:
	bl sub_08083C44
	ldr r0, _08083D40 @ =0x08CC2A4C
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08083D44 @ =0x08CC2B84
	bl Proc_EndEach
	b _08084028
	.align 2, 0
_08083D40: .4byte 0x08CC2A4C
_08083D44: .4byte 0x08CC2B84
_08083D48:
	adds r1, r6, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _080842D6
_08083D5A:
	adds r0, r6, #0
	bl Proc_Break
	b _080842D6
_08083D62:
	adds r0, r6, #0
	bl sub_08083C8C
	b _080842D6
_08083D6A:
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08083D7C
	b _080842DC
_08083D7C:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	strh r0, [r1]
_08083D84:
	bl sub_08083C68
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r7, #0
	cmp r7, r8
	blt _08083D96
	b _080842D6
_08083D96:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _08083DA2
	b _0808420C
_08083DA2:
	lsls r0, r1, #2
	ldr r1, _08083DAC @ =_08083DB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083DAC: .4byte _08083DB0
_08083DB0: @ jump table
	.4byte _080840D0 @ case 0
	.4byte _080840D6 @ case 1
	.4byte _0808414E @ case 2
	.4byte _080841C8 @ case 3
	.4byte _080840FE @ case 4
	.4byte _08084112 @ case 5
	.4byte _08084126 @ case 6
	.4byte _0808413A @ case 7
	.4byte _0808420C @ case 8
	.4byte _0808420C @ case 9
	.4byte _0808420C @ case 10
	.4byte _0808420C @ case 11
	.4byte _0808420C @ case 12
	.4byte _0808420C @ case 13
	.4byte _0808420C @ case 14
	.4byte _0808420C @ case 15
	.4byte _0808420C @ case 16
	.4byte _0808420C @ case 17
	.4byte _08084060 @ case 18
	.4byte _08084060 @ case 19
	.4byte _08084060 @ case 20
	.4byte _0808420C @ case 21
	.4byte _0808420C @ case 22
	.4byte _0808420C @ case 23
	.4byte _08083FB4 @ case 24
	.4byte _08083FF0 @ case 25
	.4byte _0808420C @ case 26
	.4byte _0808420C @ case 27
	.4byte _0808420C @ case 28
	.4byte _0808420C @ case 29
	.4byte _0808420C @ case 30
	.4byte _0808420C @ case 31
	.4byte _0808420C @ case 32
	.4byte _0808420C @ case 33
	.4byte _0808420C @ case 34
	.4byte _0808420C @ case 35
	.4byte _0808420C @ case 36
	.4byte _0808420C @ case 37
	.4byte _0808420C @ case 38
	.4byte _0808420C @ case 39
	.4byte _0808420C @ case 40
	.4byte _0808420C @ case 41
	.4byte _0808420C @ case 42
	.4byte _0808420C @ case 43
	.4byte _0808420C @ case 44
	.4byte _0808420C @ case 45
	.4byte _0808420C @ case 46
	.4byte _0808420C @ case 47
	.4byte _0808420C @ case 48
	.4byte _0808420C @ case 49
	.4byte _0808420C @ case 50
	.4byte _0808420C @ case 51
	.4byte _0808420C @ case 52
	.4byte _0808420C @ case 53
	.4byte _0808420C @ case 54
	.4byte _0808420C @ case 55
	.4byte _0808420C @ case 56
	.4byte _0808420C @ case 57
	.4byte _0808420C @ case 58
	.4byte _0808420C @ case 59
	.4byte _0808420C @ case 60
	.4byte _0808420C @ case 61
	.4byte _0808420C @ case 62
	.4byte _0808420C @ case 63
	.4byte _0808420C @ case 64
	.4byte _0808420C @ case 65
	.4byte _0808420C @ case 66
	.4byte _0808420C @ case 67
	.4byte _0808420C @ case 68
	.4byte _0808420C @ case 69
	.4byte _0808420C @ case 70
	.4byte _0808420C @ case 71
	.4byte _0808420C @ case 72
	.4byte _0808420C @ case 73
	.4byte _0808420C @ case 74
	.4byte _0808420C @ case 75
	.4byte _0808420C @ case 76
	.4byte _0808420C @ case 77
	.4byte _0808420C @ case 78
	.4byte _0808420C @ case 79
	.4byte _0808420C @ case 80
	.4byte _0808420C @ case 81
	.4byte _0808420C @ case 82
	.4byte _0808420C @ case 83
	.4byte _0808420C @ case 84
	.4byte _0808420C @ case 85
	.4byte _0808420C @ case 86
	.4byte _0808420C @ case 87
	.4byte _0808420C @ case 88
	.4byte _0808420C @ case 89
	.4byte _0808420C @ case 90
	.4byte _0808420C @ case 91
	.4byte _0808420C @ case 92
	.4byte _0808420C @ case 93
	.4byte _0808420C @ case 94
	.4byte _0808420C @ case 95
	.4byte _0808420C @ case 96
	.4byte _0808420C @ case 97
	.4byte _0808420C @ case 98
	.4byte _0808420C @ case 99
	.4byte _0808420C @ case 100
	.4byte _0808420C @ case 101
	.4byte _0808420C @ case 102
	.4byte _0808420C @ case 103
	.4byte _0808420C @ case 104
	.4byte _0808420C @ case 105
	.4byte _0808420C @ case 106
	.4byte _0808420C @ case 107
	.4byte _0808420C @ case 108
	.4byte _0808420C @ case 109
	.4byte _0808420C @ case 110
	.4byte _0808420C @ case 111
	.4byte _0808420C @ case 112
	.4byte _0808420C @ case 113
	.4byte _0808420C @ case 114
	.4byte _0808420C @ case 115
	.4byte _0808420C @ case 116
	.4byte _0808420C @ case 117
	.4byte _0808420C @ case 118
	.4byte _0808420C @ case 119
	.4byte _0808420C @ case 120
	.4byte _0808420C @ case 121
	.4byte _0808420C @ case 122
	.4byte _0808420C @ case 123
	.4byte _0808420C @ case 124
	.4byte _0808420C @ case 125
	.4byte _0808420C @ case 126
	.4byte _0808420C @ case 127
	.4byte _08084038 @ case 128
_08083FB4:
	bl sub_08083C44
	ldr r0, _08083FE8 @ =0x08CC2AAC
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _08083FEC @ =0x08CC2A44
	adds r1, r6, #0
	adds r1, #0x48
	movs r5, #0
	ldrsh r4, [r1, r5]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #1
	b _08084020
	.align 2, 0
_08083FE8: .4byte 0x08CC2AAC
_08083FEC: .4byte 0x08CC2A44
_08083FF0:
	bl sub_08083C44
	ldr r0, _08084030 @ =0x08CC2AAC
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _08084034 @ =0x08CC2A44
	adds r1, r6, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r4, [r1, r2]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #2
_08084020:
	str r4, [sp, #4]
	str r6, [sp, #8]
	bl StartYesNoChoice
_08084028:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _080842D6
	.align 2, 0
_08084030: .4byte 0x08CC2AAC
_08084034: .4byte 0x08CC2A44
_08084038:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #0x21
	bne _0808405A
	adds r2, r6, #0
	adds r2, #0x59
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	subs r7, #1
	b _080842CE
_0808405A:
	cmp r0, #4
	bne _08084060
	b _08083D20
_08084060:
	ldr r0, _080840CC @ =0x08CC2AAC
	bl Proc_Find
	adds r4, r0, #0
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0808407C
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_0808407C:
	cmp r4, #0
	bne _08084082
	b _080842D6
_08084082:
	adds r0, r6, #0
	bl sub_08083C8C
	ldr r0, [r6, #0x2c]
	add r2, sp, #0x10
	add r1, sp, #0xc
	bl GetBoxDialogueSize
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	adds r1, #0x56
	movs r2, #0
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	strb r2, [r0]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	b _080842D6
	.align 2, 0
_080840CC: .4byte 0x08CC2AAC
_080840D0:
	bl sub_08083C44
	b _0808416A
_080840D6:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #1
	cmp r1, r0
	bne _080840F6
	b _08083D48
_080840F6:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _080842CE
_080840FE:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #8
	strh r0, [r1]
	b _080842D6
_08084112:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x10
	strh r0, [r1]
	b _080842D6
_08084126:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x20
	strh r0, [r1]
	b _080842D6
_0808413A:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x40
	strh r0, [r1]
	b _080842D6
_0808414E:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _08084162
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_08084162:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808419C
_0808416A:
	bl GetDialogueBoxConfig
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne _08084178
	b _08083D5A
_08084178:
	ldr r0, _08084194 @ =0x08CC2A4C
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08084198 @ =0x08CC2B84
	bl Proc_EndEach
	b _080842D6
	.align 2, 0
_08084194: .4byte 0x08CC2A4C
_08084198: .4byte 0x08CC2B84
_0808419C:
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _080841AE
	b _08083D62
_080841AE:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _080841B8
	b _080842D6
_080841B8:
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _080842D6
_080841C8:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	ldr r0, _08084208 @ =0x08CC2AAC
	bl Proc_Find
	movs r5, #0x3c
	ldrsh r1, [r0, r5]
	adds r4, r6, #0
	adds r4, #0x52
	ldrb r2, [r4]
	adds r1, r2, r1
	movs r3, #0x3e
	ldrsh r2, [r0, r3]
	adds r0, r6, #0
	adds r0, #0x48
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	adds r0, r6, #0
	bl StartTalkWaitForInput
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl DialogBoxGetGlyphLen
	b _080842D6
	.align 2, 0
_08084208: .4byte 0x08CC2AAC
_0808420C:
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08084232
	adds r5, r6, #0
	adds r5, #0x48
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #1
	bl Text_SetColor
	b _0808426E
_08084232:
	adds r0, r6, #0
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	beq _08084256
	adds r5, r6, #0
	adds r5, #0x48
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xa
	bl Text_SetColor
	b _0808426E
_08084256:
	adds r5, r6, #0
	adds r5, #0x48
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #6
	bl Text_SetColor
_0808426E:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_DrawCharacter
	str r0, [r6, #0x2c]
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _08084294
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _080842CE
_08084294:
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080842BC
	ldr r0, _080842B4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080842CE
	ldr r0, _080842B8 @ =0x000002E5
	bl m4aSongNumStart
	b _080842CE
	.align 2, 0
_080842B4: .4byte 0x0202BBF8
_080842B8: .4byte 0x000002E5
_080842BC:
	ldr r0, _080842E8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080842CE
	ldr r0, _080842EC @ =0x0000038E
	bl m4aSongNumStart
_080842CE:
	adds r7, #1
	cmp r7, r8
	bge _080842D6
	b _08083D96
_080842D6:
	movs r0, #0
	bl SetTextFont
_080842DC:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080842E8: .4byte 0x0202BBF8
_080842EC: .4byte 0x0000038E
