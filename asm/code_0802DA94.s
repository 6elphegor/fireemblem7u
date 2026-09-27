	.include "macro.inc"

	.syntax unified

	thumb_func_start FlamesWeatherInitParticles
FlamesWeatherInitParticles: @ 0x0802DA94
	push {r4, r5, r6, lr}
	ldr r0, _0802DAE0 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	ldr r0, _0802DAE4 @ =0x08199578
	ldr r1, _0802DAE8 @ =0x06010300
	bl Decompress
	ldr r0, _0802DAEC @ =0x081995B8
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, _0802DAF0 @ =0x081C3FCC
	ldr r4, _0802DAF4 @ =0x020027DC
	movs r6, #0xf
_0802DAB8:
	bl RandNextB
	strh r0, [r4]
	bl RandNextB
	strh r0, [r4, #2]
	ldrh r1, [r5]
	rsbs r0, r1, #0
	strh r0, [r4, #4]
	ldrh r1, [r5, #2]
	rsbs r0, r1, #0
	strh r0, [r4, #6]
	adds r5, #6
	adds r4, #0xc
	subs r6, #1
	cmp r6, #0
	bge _0802DAB8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DAE0: .4byte 0x0202BBF8
_0802DAE4: .4byte 0x08199578
_0802DAE8: .4byte 0x06010300
_0802DAEC: .4byte 0x081995B8
_0802DAF0: .4byte 0x081C3FCC
_0802DAF4: .4byte 0x020027DC
