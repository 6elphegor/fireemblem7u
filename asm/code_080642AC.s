	.include "macro.inc"

	.syntax unified

	thumb_func_start StartCRSubSpell_efxopFireBG
StartCRSubSpell_efxopFireBG: @ 0x080642AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _080642F8 @ =0x08BA4820
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080642FC @ =0x081E9838
	str r0, [r4, #0x48]
	ldr r0, _08064300 @ =0x08BA4838
	str r0, [r4, #0x4c]
	ldr r1, _08064304 @ =0x081FD2CC
	adds r0, r5, #0
	bl CRSpell_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r1, _08064308 @ =0x081FC6D4
	bl CRSpell_RegisterBgGfx
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl SetCRSpellBgPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080642F8: .4byte 0x08BA4820
_080642FC: .4byte 0x081E9838
_08064300: .4byte 0x08BA4838
_08064304: .4byte 0x081FD2CC
_08064308: .4byte 0x081FC6D4
