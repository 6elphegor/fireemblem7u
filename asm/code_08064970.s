	.include "macro.inc"

	.syntax unified

	thumb_func_start StartCRSubSpell_efxopLightningBG
StartCRSubSpell_efxopLightningBG: @ 0x08064970
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _080649B4 @ =0x08BA49C4
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080649B8 @ =0x081E98FE
	str r0, [r4, #0x48]
	ldr r0, _080649BC @ =0x08BA4AE4
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _080649C0 @ =0x08BA49DC
	str r0, [r4, #0x54]
	ldr r0, _080649C4 @ =0x08BA4A60
	str r0, [r4, #0x58]
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl SetCRSpellBgPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080649B4: .4byte 0x08BA49C4
_080649B8: .4byte 0x081E98FE
_080649BC: .4byte 0x08BA4AE4
_080649C0: .4byte 0x08BA49DC
_080649C4: .4byte 0x08BA4A60
