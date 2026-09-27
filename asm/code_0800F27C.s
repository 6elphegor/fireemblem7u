	.include "macro.inc"

	.syntax unified

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
