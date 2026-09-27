	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUnitSpriteIconsOam
PutUnitSpriteIconsOam: @ 0x08025B54
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
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025BD4
	b _08025F62
_08025BD4:
	bl PutChapterMarkedTileIconOam
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
	bl GetUnitSpriteHideFlag
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
