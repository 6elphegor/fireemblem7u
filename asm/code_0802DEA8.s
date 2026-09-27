	.include "macro.inc"

	.syntax unified

	thumb_func_start SetWeather
SetWeather: @ 0x0802DEA8
	push {lr}
	ldr r1, _0802DEBC @ =0x0202BBF8
	strb r0, [r1, #0x15]
	bl AllocWeatherParticles
	bl WeatherInit
	pop {r0}
	bx r0
	.align 2, 0
_0802DEBC: .4byte 0x0202BBF8
