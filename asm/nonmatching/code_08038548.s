	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08038548
sub_08038548: @ 0x08038548
	push {lr}
	ldrb r0, [r0]
	bl AiGetClassRank
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
