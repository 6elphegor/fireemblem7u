	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013E54
sub_08013E54: @ 0x08013E54
	push {lr}
	bl sub_08013CCC
	ldr r3, _08013E80 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08013E80: .4byte 0x03002870
