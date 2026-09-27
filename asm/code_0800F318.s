	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F318
sub_0800F318: @ 0x0800F318
	push {lr}
	movs r0, #0
	bl SetWeather
	pop {r0}
	bx r0
