	.include "macro.inc"

	.syntax unified

	thumb_func_start efxopLiveBG_Loop
efxopLiveBG_Loop: @ 0x0806471C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064748
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #0
	bl CRSpell_WriteBgMap
	b _08064760
_08064748:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08064760
	ldr r0, [r4, #0x5c]
	bl ClearCRSpellBgTmBuf
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08064760:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
