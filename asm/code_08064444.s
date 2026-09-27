	.include "macro.inc"

	.syntax unified

	thumb_func_start StartCRSubSpell_efxopThunderBG
StartCRSubSpell_efxopThunderBG: @ 0x08064444
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _0806448C @ =0x08BA48A8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064490 @ =0x081E986A
	str r0, [r4, #0x48]
	ldr r0, _08064494 @ =0x08BA48C0
	str r0, [r4, #0x4c]
	ldr r1, _08064498 @ =0x081FBD70
	adds r0, r5, #0
	bl CRSpell_RegisterBgPal
	ldr r0, [r4, #0x5c]
	ldr r1, _0806449C @ =0x081FB4B4
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
_0806448C: .4byte 0x08BA48A8
_08064490: .4byte 0x081E986A
_08064494: .4byte 0x08BA48C0
_08064498: .4byte 0x081FBD70
_0806449C: .4byte 0x081FB4B4
