	.include "macro.inc"

	.syntax unified

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
