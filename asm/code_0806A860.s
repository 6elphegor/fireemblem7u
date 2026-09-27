	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrTriPegasusKnightBgMain
EkrTriPegasusKnightBgMain: @ 0x0806A860
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806A88E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0806A8A0
_0806A88E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806A8A0
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806A8A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
