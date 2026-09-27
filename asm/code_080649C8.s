	.include "macro.inc"

	.syntax unified

	thumb_func_start efxopLightningBG_Loop
efxopLightningBG_Loop: @ 0x080649C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08064A0C
	ldr r6, [r7, #0x4c]
	ldr r1, [r7, #0x54]
	ldr r5, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl CRSpell_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	bl CRSpell_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r4, r4, r6
	ldr r2, [r4]
	movs r1, #0
	movs r3, #1
	bl CRSpell_WriteBgMap
	b _08064A24
_08064A0C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08064A24
	ldr r0, [r7, #0x5c]
	bl ClearCRSpellBgTmBuf
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_08064A24:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
