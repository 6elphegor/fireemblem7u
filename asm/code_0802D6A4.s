	.include "macro.inc"

	.syntax unified

	thumb_func_start WeatherInit_Sandstorm
WeatherInit_Sandstorm: @ 0x0802D6A4
	push {r4, r5, r6, lr}
	ldr r0, _0802D700 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	ldr r0, _0802D704 @ =0x08199458
	ldr r4, _0802D708 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r1, _0802D70C @ =0x06010380
	adds r0, r4, #0
	movs r2, #4
	movs r3, #4
	bl Copy2dChr
	movs r6, #0
	ldr r4, _0802D710 @ =0x020027DC
	movs r5, #0x3f
_0802D6CA:
	bl RandNextB
	strh r0, [r4]
	bl RandNextB
	movs r1, #0xa0
	bl __umodsi3
	adds r0, #0xf0
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #2]
	bl RandNextB
	movs r1, #7
	ands r0, r1
	subs r0, #0x20
	strh r0, [r4, #4]
	strh r6, [r4, #6]
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0802D6CA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D700: .4byte 0x0202BBF8
_0802D704: .4byte 0x08199458
_0802D708: .4byte 0x02020140
_0802D70C: .4byte 0x06010380
_0802D710: .4byte 0x020027DC
