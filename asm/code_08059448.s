	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08059448
sub_08059448: @ 0x08059448
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08059484
	movs r0, #0x85
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_08059538
	b _08059532
_08059484:
	cmp r0, #0x10
	bne _08059490
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxMistyRainOBJ
	b _08059532
_08059490:
	cmp r0, #0x4a
	bne _080594A0
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b _08059532
_080594A0:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x4b
	cmp r1, r0
	bne _080594B6
	adds r0, r5, #0
	bl StartSubSpell_efxMistyrainOBJ2
	str r0, [r4, #0x64]
	b _08059532
_080594B6:
	adds r0, r2, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _080594DC
	ldr r0, _080594D8 @ =0x000002E1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	bl sub_080595E8
	b _08059532
	.align 2, 0
_080594D8: .4byte 0x000002E1
_080594DC:
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _080594EC
	ldr r0, [r4, #0x64]
	bl Proc_End
	b _08059532
_080594EC:
	adds r0, r2, #0
	adds r0, #0x83
	cmp r1, r0
	bne _0805951C
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl NewEfxFlashBgWhite
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
	bne _08059532
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08059532
_0805951C:
	adds r0, r2, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _08059532
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_08059532:
	pop {r4, r5}
	pop {r0}
	bx r0
