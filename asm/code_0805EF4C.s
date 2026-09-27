	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805EF4C
sub_0805EF4C: @ 0x0805EF4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805EF76
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805EF76:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805EF8A
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _0805F018
_0805EF8A:
	adds r0, r6, #0
	adds r0, #0xb
	cmp r1, r0
	bne _0805EFAC
	adds r0, r5, #0
	bl StartSubSpell_efxShineBG2
	movs r0, #0xaf
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805F018
_0805EFAC:
	adds r0, r6, #0
	adds r0, #0x17
	cmp r1, r0
	bne _0805EFC4
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl StartSubSpell_efxShineOBJRND
	b _0805F018
_0805EFC4:
	adds r0, r6, #0
	adds r0, #0x1d
	cmp r1, r0
	bne _0805EFDA
	adds r0, r5, #0
	bl StartSubSpell_efxShineBG
	adds r0, r5, #0
	bl sub_0805F1FC
	b _0805F018
_0805EFDA:
	adds r0, r6, #0
	adds r0, #0x1e
	cmp r1, r0
	bne _0805F002
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805F018
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805F018
_0805F002:
	adds r0, r6, #0
	adds r0, #0x23
	cmp r1, r0
	bne _0805F018
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805F018:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
