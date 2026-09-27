	.include "macro.inc"

	.syntax unified

	thumb_func_start WeatherInit_Clouds
WeatherInit_Clouds: @ 0x0802DC84
	push {lr}
	movs r0, #0
	bl AllocWeatherParticles
	ldr r0, _0802DCA4 @ =0x081995F8
	ldr r1, _0802DCA8 @ =0x020027DC
	bl Decompress
	ldr r0, _0802DCAC @ =0x08199B14
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0802DCA4: .4byte 0x081995F8
_0802DCA8: .4byte 0x020027DC
_0802DCAC: .4byte 0x08199B14
