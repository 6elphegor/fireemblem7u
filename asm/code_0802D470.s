	.include "macro.inc"

	.syntax unified

	thumb_func_start WeatherInit_None
WeatherInit_None: @ 0x0802D470
	push {lr}
	ldr r0, _0802D484 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	movs r0, #0
	bl SetOnHBlankB
	pop {r0}
	bx r0
	.align 2, 0
_0802D484: .4byte 0x0202BBF8
