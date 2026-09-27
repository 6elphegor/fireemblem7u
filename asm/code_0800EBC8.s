	.include "macro.inc"

	.syntax unified

	thumb_func_start EventWeatherChangeWithFade_SetWeather
EventWeatherChangeWithFade_SetWeather: @ 0x0800EBC8
	push {lr}
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl SetWeather
	pop {r0}
	bx r0
