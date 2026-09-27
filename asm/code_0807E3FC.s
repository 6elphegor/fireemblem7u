	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E3FC
sub_0807E3FC: @ 0x0807E3FC
	push {lr}
	sub sp, #0x10
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0x12
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x26
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x12
	bl EventLoadUnit
	add sp, #0x10
	pop {r0}
	bx r0
