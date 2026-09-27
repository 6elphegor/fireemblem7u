	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AF20
sub_0800AF20: @ 0x0800AF20
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r3, #0x68
	ldrb r4, [r3]
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800AF50
	ldr r2, _0800AF58 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r5, [r2]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xff
	orrs r0, r4
	strb r0, [r3]
_0800AF50:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800AF58: .4byte 0x0202BBF8
