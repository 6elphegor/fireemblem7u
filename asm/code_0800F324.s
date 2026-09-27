	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F324
sub_0800F324: @ 0x0800F324
	push {lr}
	movs r0, #6
	bl SetWeather
	pop {r0}
	bx r0
