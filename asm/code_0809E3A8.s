	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809E3A8
sub_0809E3A8: @ 0x0809E3A8
	push {lr}
	ldr r0, [r0, #0x2c]
	bl Proc_End
	ldr r2, _0809E3D4 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0809E3D4: .4byte 0x03002870
