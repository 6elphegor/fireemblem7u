	.include "macro.inc"

	.syntax unified

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
