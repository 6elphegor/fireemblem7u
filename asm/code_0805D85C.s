	.include "macro.inc"

	.syntax unified

	thumb_func_start efxReserveBG_Loop
efxReserveBG_Loop: @ 0x0805D85C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805D8B4
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r6, #0
	bl SpellFx_WriteBgMap
	ldr r0, _0805D8AC @ =0x081E8DD2
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, _0805D8B0 @ =0x081E8DDA
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0
	bl PlaySFX
	b _0805D8D2
	.align 2, 0
_0805D8AC: .4byte 0x081E8DD2
_0805D8B0: .4byte 0x081E8DDA
_0805D8B4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805D8D2
	bl SpellFx_ClearBG1
	ldr r1, _0805D8D8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805D8D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D8D8: .4byte 0x0201774C
