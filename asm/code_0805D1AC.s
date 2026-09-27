	.include "macro.inc"

	.syntax unified

	thumb_func_start efxLiveBG_Loop
efxLiveBG_Loop: @ 0x0805D1AC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805D1DE
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r2, r2, r3
	bl EfxCreateBackAnim
	b _0805D210
_0805D1DE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805D210
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D1F8
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
_0805D1F8:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _0805D218 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D210:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D218: .4byte 0x0201774C
