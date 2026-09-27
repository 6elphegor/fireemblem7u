	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BE84
sub_0801BE84: @ 0x0801BE84
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r2, _0801BEB4 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801BF2C
	adds r0, r5, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _0801BEBC
	ldr r1, _0801BEB8 @ =0x0202BBF8
	adds r0, r1, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801BEC6
	.align 2, 0
_0801BEB4: .4byte 0x08B857F8
_0801BEB8: .4byte 0x0202BBF8
_0801BEBC:
	ldr r1, _0801BF0C @ =0x0202BBF8
	adds r0, r1, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801BEC6:
	lsrs r3, r0, #0x1e
	ldr r0, [r2]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0801BED6
	subs r3, #1
_0801BED6:
	movs r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0801BEE0
	adds r3, #1
_0801BEE0:
	cmp r3, #2
	ble _0801BEE6
	movs r3, #2
_0801BEE6:
	cmp r3, #0
	bge _0801BEEC
	movs r3, #0
_0801BEEC:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0801BF10
	adds r2, r1, #0
	adds r2, #0x43
	movs r0, #3
	ands r3, r0
	lsls r1, r3, #1
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _0801BF24
	.align 2, 0
_0801BF0C: .4byte 0x0202BBF8
_0801BF10:
	adds r2, r1, #0
	adds r2, #0x42
	movs r0, #3
	ands r3, r0
	lsls r1, r3, #7
	ldr r0, _0801BF34 @ =0xFFFFFE7F
	ldrh r3, [r2]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
_0801BF24:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0801BDDC
_0801BF2C:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BF34: .4byte 0xFFFFFE7F
