	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08041FF8
sub_08041FF8: @ 0x08041FF8
	push {r4, r5, lr}
	ldr r5, _08042038 @ =0x0203D90C
	movs r1, #0x80
	lsls r1, r1, #1
	adds r5, r5, r1
	movs r4, #1
	ldrb r2, [r0]
	ands r2, r4
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r5]
	ands r1, r3
	orrs r1, r2
	ldrb r2, [r0, #1]
	ands r2, r4
	lsls r2, r2, #1
	movs r3, #3
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r2
	ldrb r0, [r0, #2]
	ands r4, r0
	lsls r4, r4, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r4
	strb r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042038: .4byte 0x0203D90C
