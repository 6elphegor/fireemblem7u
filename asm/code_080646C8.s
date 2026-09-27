	.include "macro.inc"

	.syntax unified

	thumb_func_start StartCRSubSpell_efxopLiveBG
StartCRSubSpell_efxopLiveBG: @ 0x080646C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _0806470C @ =0x08BA4928
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl SetActiveClassReelSpell
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064710 @ =0x081E98B6
	str r0, [r4, #0x48]
	ldr r0, _08064714 @ =0x08BA4940
	str r0, [r4, #0x4c]
	ldr r1, _08064718 @ =0x08269CF8
	adds r0, r5, #0
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
_0806470C: .4byte 0x08BA4928
_08064710: .4byte 0x081E98B6
_08064714: .4byte 0x08BA4940
_08064718: .4byte 0x08269CF8
