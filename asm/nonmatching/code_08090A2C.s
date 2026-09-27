	.include "macro.inc"

	.syntax unified

	thumb_func_start SallyCir_OnEnd
SallyCir_OnEnd: @ 0x08090A2C
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
