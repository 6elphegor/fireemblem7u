	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC904
sub_080AC904: @ 0x080AC904
	push {lr}
	movs r1, #4
	str r1, [r0, #0x58]
	ldr r0, _080AC938 @ =0x08CE5734
	bl InitBgs
	ldr r2, _080AC93C @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x3f
	ldrb r1, [r2, #0x15]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	pop {r0}
	bx r0
	.align 2, 0
_080AC938: .4byte 0x08CE5734
_080AC93C: .4byte 0x03002870
