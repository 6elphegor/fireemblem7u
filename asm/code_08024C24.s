	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08024C24
sub_08024C24: @ 0x08024C24
	push {lr}
	adds r3, r0, #0
	movs r2, #0xb
	ldrsb r2, [r3, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _08024C50
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08024C50
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	movs r3, #0
	bl EnlistTarget
_08024C50:
	pop {r0}
	bx r0
