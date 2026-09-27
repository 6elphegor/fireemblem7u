	.include "macro.inc"

	.syntax unified

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
