	.include "macro.inc"

	.syntax unified

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
