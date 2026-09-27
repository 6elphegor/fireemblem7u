	.include "macro.inc"

	.syntax unified

	thumb_func_start WeatherInit
WeatherInit: @ 0x0802DD60
	push {lr}
	ldr r0, _0802DD74 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bhi _0802DDCA
	lsls r0, r0, #2
	ldr r1, _0802DD78 @ =_0802DD7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DD74: .4byte 0x0202BBF8
_0802DD78: .4byte _0802DD7C
_0802DD7C: @ jump table
	.4byte _0802DD9C @ case 0
	.4byte _0802DDA2 @ case 1
	.4byte _0802DDAE @ case 2
	.4byte _0802DDBA @ case 3
	.4byte _0802DDB4 @ case 4
	.4byte _0802DDC0 @ case 5
	.4byte _0802DDA8 @ case 6
	.4byte _0802DDC6 @ case 7
_0802DD9C:
	bl WeatherInit_None
	b _0802DDCA
_0802DDA2:
	bl WeatherInit_Snow
	b _0802DDCA
_0802DDA8:
	bl WeatherInit_Sandstorm
	b _0802DDCA
_0802DDAE:
	bl WeatherInit_Snowstorm
	b _0802DDCA
_0802DDB4:
	bl WeatherInit_Rain
	b _0802DDCA
_0802DDBA:
	bl WeatherInit_Blue
	b _0802DDCA
_0802DDC0:
	bl WeatherInit_Flames
	b _0802DDCA
_0802DDC6:
	bl WeatherInit_Clouds
_0802DDCA:
	pop {r0}
	bx r0
	.align 2, 0
