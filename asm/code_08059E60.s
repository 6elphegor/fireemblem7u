	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08059E60
sub_08059E60: @ 0x08059E60
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
	bne _08059E8A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_08059E8A:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08059EAE
	movs r0, #0x90
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl StartSubSpell_efxLightningBG
	b _08059F10
_08059EAE:
	adds r0, r6, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _08059EF4
	ldr r0, _08059EF0 @ =0x00000121
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	movs r1, #4
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
	bne _08059F10
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08059F10
	.align 2, 0
_08059EF0: .4byte 0x00000121
_08059EF4:
	adds r0, r6, #0
	adds r0, #0x2f
	cmp r1, r0
	beq _08059F10
	adds r0, #1
	cmp r1, r0
	bne _08059F10
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_08059F10:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
