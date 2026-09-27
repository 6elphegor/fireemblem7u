	.include "macro.inc"

	.syntax unified

	thumb_func_start WeatherInit_Flames
WeatherInit_Flames: @ 0x0802DAF8
	push {lr}
	bl FlamesWeatherInitGradient
	bl FlamesWeatherInitParticles
	pop {r0}
	bx r0
	.align 2, 0
