	.include "macro.inc"

	.syntax unified

	thumb_func_start EvCheck06_VILL
EvCheck06_VILL: @ 0x0807850C
	push {r4, lr}
	adds r4, r0, #0
	bl EvCheck05_LOCA
	movs r1, #3
	str r1, [r4, #0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
