	.include "macro.inc"

	.syntax unified

	thumb_func_start CgTextInterpreter_Loop_Main
CgTextInterpreter_Loop_Main: @ 0x08088380
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _080883C4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080883C8
	bl GetCgTextFlags
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _080883C8
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x7f
	mov sl, r0
	b _080883FA
	.align 2, 0
_080883C4: .4byte 0x08B857F8
_080883C8:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080883EE
	subs r0, r2, #1
	strb r0, [r1]
	b _0808891E
_080883DC:
	adds r1, r6, #0
	adds r1, #0x5f
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _0808890C
_080883EE:
	adds r0, r6, #0
	adds r0, #0x52
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x60
_080883FA:
	str r1, [sp, #0xc]
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r2, #0
	mov sb, r2
	cmp sb, sl
	blt _08088422
	b _0808890C
_08088422:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _0808842E
	b _0808887A
_0808842E:
	lsls r0, r1, #2
	ldr r1, _08088438 @ =_0808843C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088438: .4byte _0808843C
_0808843C: @ jump table
	.4byte _080886F0 @ case 0
	.4byte _0808871E @ case 1
	.4byte _08088796 @ case 2
	.4byte _080887D8 @ case 3
	.4byte _0808874A @ case 4
	.4byte _08088756 @ case 5
	.4byte _08088762 @ case 6
	.4byte _0808876E @ case 7
	.4byte _0808887A @ case 8
	.4byte _0808887A @ case 9
	.4byte _0808887A @ case 10
	.4byte _0808887A @ case 11
	.4byte _0808887A @ case 12
	.4byte _0808887A @ case 13
	.4byte _0808887A @ case 14
	.4byte _0808887A @ case 15
	.4byte _0808887A @ case 16
	.4byte _0808887A @ case 17
	.4byte _0808887A @ case 18
	.4byte _0808887A @ case 19
	.4byte _0808887A @ case 20
	.4byte _0808887A @ case 21
	.4byte _0808877A @ case 22
	.4byte _08088788 @ case 23
	.4byte _08088640 @ case 24
	.4byte _080886A0 @ case 25
	.4byte _0808887A @ case 26
	.4byte _0808887A @ case 27
	.4byte _0808887A @ case 28
	.4byte _0808887A @ case 29
	.4byte _0808887A @ case 30
	.4byte _0808887A @ case 31
	.4byte _0808887A @ case 32
	.4byte _0808887A @ case 33
	.4byte _0808887A @ case 34
	.4byte _0808887A @ case 35
	.4byte _0808887A @ case 36
	.4byte _0808887A @ case 37
	.4byte _0808887A @ case 38
	.4byte _0808887A @ case 39
	.4byte _0808887A @ case 40
	.4byte _0808887A @ case 41
	.4byte _0808887A @ case 42
	.4byte _0808887A @ case 43
	.4byte _0808887A @ case 44
	.4byte _0808887A @ case 45
	.4byte _0808887A @ case 46
	.4byte _0808887A @ case 47
	.4byte _0808887A @ case 48
	.4byte _0808887A @ case 49
	.4byte _0808887A @ case 50
	.4byte _0808887A @ case 51
	.4byte _0808887A @ case 52
	.4byte _0808887A @ case 53
	.4byte _0808887A @ case 54
	.4byte _0808887A @ case 55
	.4byte _0808887A @ case 56
	.4byte _0808887A @ case 57
	.4byte _0808887A @ case 58
	.4byte _0808887A @ case 59
	.4byte _0808887A @ case 60
	.4byte _0808887A @ case 61
	.4byte _0808887A @ case 62
	.4byte _0808887A @ case 63
	.4byte _0808887A @ case 64
	.4byte _0808887A @ case 65
	.4byte _0808887A @ case 66
	.4byte _0808887A @ case 67
	.4byte _0808887A @ case 68
	.4byte _0808887A @ case 69
	.4byte _0808887A @ case 70
	.4byte _0808887A @ case 71
	.4byte _0808887A @ case 72
	.4byte _0808887A @ case 73
	.4byte _0808887A @ case 74
	.4byte _0808887A @ case 75
	.4byte _0808887A @ case 76
	.4byte _0808887A @ case 77
	.4byte _0808887A @ case 78
	.4byte _0808887A @ case 79
	.4byte _0808887A @ case 80
	.4byte _0808887A @ case 81
	.4byte _0808887A @ case 82
	.4byte _0808887A @ case 83
	.4byte _0808887A @ case 84
	.4byte _0808887A @ case 85
	.4byte _0808887A @ case 86
	.4byte _0808887A @ case 87
	.4byte _0808887A @ case 88
	.4byte _0808887A @ case 89
	.4byte _0808887A @ case 90
	.4byte _0808887A @ case 91
	.4byte _0808887A @ case 92
	.4byte _0808887A @ case 93
	.4byte _0808887A @ case 94
	.4byte _0808887A @ case 95
	.4byte _0808887A @ case 96
	.4byte _0808887A @ case 97
	.4byte _0808887A @ case 98
	.4byte _0808887A @ case 99
	.4byte _0808887A @ case 100
	.4byte _0808887A @ case 101
	.4byte _0808887A @ case 102
	.4byte _0808887A @ case 103
	.4byte _0808887A @ case 104
	.4byte _0808887A @ case 105
	.4byte _0808887A @ case 106
	.4byte _0808887A @ case 107
	.4byte _0808887A @ case 108
	.4byte _0808887A @ case 109
	.4byte _0808887A @ case 110
	.4byte _0808887A @ case 111
	.4byte _0808887A @ case 112
	.4byte _0808887A @ case 113
	.4byte _0808887A @ case 114
	.4byte _0808887A @ case 115
	.4byte _0808887A @ case 116
	.4byte _0808887A @ case 117
	.4byte _0808887A @ case 118
	.4byte _0808887A @ case 119
	.4byte _0808887A @ case 120
	.4byte _0808887A @ case 121
	.4byte _0808887A @ case 122
	.4byte _0808887A @ case 123
	.4byte _0808887A @ case 124
	.4byte _0808887A @ case 125
	.4byte _0808887A @ case 126
	.4byte _0808887A @ case 127
	.4byte _0808885A @ case 128
_08088640:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _08088698 @ =0x08CC310C
	cmp r1, #0
	beq _0808865C
	ldr r5, _0808869C @ =0x08CC3104
_0808865C:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x58
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #1
_08088684:
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r5, #0
	bl StartYesNoChoice
_08088690:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _080887CE
	.align 2, 0
_08088698: .4byte 0x08CC310C
_0808869C: .4byte 0x08CC3104
_080886A0:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _080886E8 @ =0x08CC310C
	cmp r1, #0
	beq _080886BC
	ldr r5, _080886EC @ =0x08CC3104
_080886BC:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x58
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #2
	b _08088684
	.align 2, 0
_080886E8: .4byte 0x08CC310C
_080886EC: .4byte 0x08CC3104
_080886F0:
	bl GetCgTextFlags
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0808870C
	movs r0, #4
	bl ClearCgTextFlag
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _08088714
_0808870C:
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_08088714:
	mov r0, r8
	movs r1, #0x63
	bl Proc_Goto
	b _080887CE
_0808871E:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	adds r3, r6, #0
	adds r3, #0x54
	movs r2, #0
	ldrsb r2, [r3, r2]
	adds r2, #1
	adds r0, r6, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _08088742
	b _080883DC
_08088742:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _08088902
_0808874A:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	adds r0, #8
	strb r0, [r1]
	b _08088690
_08088756:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	adds r0, #0x10
	strb r0, [r1]
	b _08088690
_08088762:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	adds r0, #0x20
	strb r0, [r1]
	b _08088690
_0808876E:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	adds r0, #0x40
	strb r0, [r1]
	b _08088690
_0808877A:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldr r0, _08088784 @ =0x0000FFF7
	ands r7, r0
	b _08088902
	.align 2, 0
_08088784: .4byte 0x0000FFF7
_08088788:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	movs r0, #8
	orrs r7, r0
	lsls r0, r7, #0x10
	lsrs r7, r0, #0x10
	b _08088902
_08088796:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldrb r2, [r2, #1]
	cmp r2, #1
	bne _080887A4
	adds r0, #1
	str r0, [r6, #0x2c]
_080887A4:
	bl GetCgTextFlags
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq _080887BA
	mov r0, r8
	movs r1, #2
	bl Proc_Goto
	b _080887CE
_080887BA:
	adds r0, r6, #0
	adds r0, #0x54
	ldrb r1, [r0]
	adds r1, #1
	adds r0, #0xb
	strb r1, [r0]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
_080887CE:
	ldr r0, _080887D4 @ =0x0000FFEF
	ands r7, r0
	b _0808890C
	.align 2, 0
_080887D4: .4byte 0x0000FFEF
_080887D8:
	ldr r0, _08088820 @ =0x0000FFEF
	ands r7, r0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08088824
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r5, r6, #0
	adds r5, #0x59
	ldrb r2, [r5]
	adds r1, r2, r1
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r4, r6, #0
	adds r4, #0x5a
	ldrb r0, [r4]
	adds r2, r0, r2
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	bl StartTalkWaitForInputUnk
	b _0808884E
	.align 2, 0
_08088820: .4byte 0x0000FFEF
_08088824:
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r5, r6, #0
	adds r5, #0x59
	ldrb r2, [r5]
	adds r1, r2, r1
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r4, r6, #0
	adds r4, #0x5a
	ldrb r0, [r4]
	adds r2, r0, r2
	adds r2, #8
	mov r0, r8
	bl StartTalkWaitForInput
_0808884E:
	adds r1, r5, #0
	adds r2, r4, #0
	ldr r0, [r6, #0x2c]
	bl GetCgTextDimensions
	b _0808890C
_0808885A:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #1
	str r0, [r6, #0x2c]
	ldrb r1, [r1, #1]
	cmp r1, #0x21
	bne _08088872
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #1
	ldrb r2, [r1]
	subs r0, r0, r2
	strb r0, [r1]
_08088872:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _08088902
_0808887A:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808889E
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xc
	bl Text_SetColor
	b _080888B6
_0808889E:
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xb
	bl Text_SetColor
_080888B6:
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_DrawCharacter
	str r0, [r6, #0x2c]
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _080888DC
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _08088902
_080888DC:
	bl GetCgTextFlags
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _08088902
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	bne _08088902
	ldr r0, _08088930 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08088902
	ldr r0, _08088934 @ =0x0000038E
	bl m4aSongNumStart
_08088902:
	movs r2, #1
	add sb, r2
	cmp sb, sl
	bge _0808890C
	b _08088422
_0808890C:
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	bl SetTextFont
	movs r0, #0
	adds r1, r7, #0
	bl SetFaceDispById
_0808891E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088930: .4byte 0x0202BBF8
_08088934: .4byte 0x0000038E
