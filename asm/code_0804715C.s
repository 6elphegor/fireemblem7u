	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804715C
sub_0804715C: @ 0x0804715C
	push {lr}
	ldr r2, _08047180 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_08047180: .4byte 0x03002870
