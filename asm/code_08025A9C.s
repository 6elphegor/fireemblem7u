	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08025A9C
sub_08025A9C: @ 0x08025A9C
	push {r4, r5, lr}
	ldr r4, _08025B38 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x93
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x94
	ldrb r4, [r0]
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08025AC8
	movs r2, #1
_08025AC8:
	cmp r5, #0xff
	beq _08025B32
	cmp r2, #0
	beq _08025B32
	ldr r0, _08025B3C @ =0x0202E3EC
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025B32
	ldr r0, _08025B40 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _08025B32
	lsls r1, r5, #4
	ldr r2, _08025B44 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	lsls r1, r4, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r2, r1, r0
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08025B32
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _08025B32
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r3, r1
	subs r1, #5
	ands r0, r1
	ldr r3, _08025B48 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08025B4C @ =0x08B905B0
	ldr r3, _08025B50 @ =0x00000C51
	bl PutOamHiRam
_08025B32:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025B38: .4byte 0x0202BBF8
_08025B3C: .4byte 0x0202E3EC
_08025B40: .4byte 0x0202E3E0
_08025B44: .4byte 0x0202BBB8
_08025B48: .4byte 0x00000107
_08025B4C: .4byte 0x08B905B0
_08025B50: .4byte 0x00000C51
