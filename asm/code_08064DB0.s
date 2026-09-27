	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_StartDragonTailIntro
EkrDragon_StartDragonTailIntro: @ 0x08064DB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _08064E4C @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldr r0, _08064E50 @ =0x082DE7E8
	ldr r1, _08064E54 @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _08064E58 @ =0x082E10CC
	ldr r1, _08064E5C @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _08064E60 @ =0x082E0FEC
	ldr r1, _08064E64 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08064E68 @ =0x001F001F
	bl EfxTmFill
	ldr r0, _08064E6C @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	movs r0, #0
	movs r1, #0x78
	bl EkrDragonTmCpyHFlip
	movs r0, #0xf8
	rsbs r0, r0, #0
	movs r1, #0
	bl EkrDragonTmCpyExt
	bl EnablePalSync
	movs r1, #0x80
	lsls r1, r1, #3
	movs r0, #0x78
	movs r2, #0x60
	movs r3, #2
	bl NewEkrDragonBg3HfScrollHandler
	str r0, [r4, #0x64]
	movs r0, #0x78
	movs r1, #0
	bl NewEkrDragonBg3HfScroll
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x3c
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064E4C: .4byte 0x03002870
_08064E50: .4byte 0x082DE7E8
_08064E54: .4byte 0x06008000
_08064E58: .4byte 0x082E10CC
_08064E5C: .4byte 0x02019784
_08064E60: .4byte 0x082E0FEC
_08064E64: .4byte 0x02022920
_08064E68: .4byte 0x001F001F
_08064E6C: .4byte 0x02024460
