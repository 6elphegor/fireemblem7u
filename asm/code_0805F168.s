	.include "macro.inc"

	.syntax unified

	thumb_func_start efxShineBG2_Loop
efxShineBG2_Loop: @ 0x0805F168
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805F1D0
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _0805F1B0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F1EE
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0805F1B8
	ldr r0, _0805F1B4 @ =0x02023460
	b _0805F1BC
	.align 2, 0
_0805F1B0: .4byte 0x0203E02C
_0805F1B4: .4byte 0x02023460
_0805F1B8:
	ldr r0, _0805F1CC @ =0x0202349A
	movs r1, #0
_0805F1BC:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0805F1EE
	.align 2, 0
_0805F1CC: .4byte 0x0202349A
_0805F1D0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805F1EE
	bl SpellFx_ClearBG1
	ldr r1, _0805F1F8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805F1EE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F1F8: .4byte 0x0201774C
