	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08058080
sub_08058080: @ 0x08058080
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
	bne _080580AA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_080580AA:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _080580C8
	adds r0, r5, #0
	bl NewEfxThunderBG
	adds r0, r5, #0
	bl sub_08058228
	adds r0, r5, #0
	bl NewEfxThunderOBJ
	b _0805811A
_080580C8:
	adds r0, r6, #4
	cmp r1, r0
	bne _080580FE
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xf5
	movs r3, #1
	bl PlaySFX
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805811A
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805811A
_080580FE:
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	beq _0805811A
	adds r0, #0x10
	cmp r1, r0
	bne _0805811A
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805811A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
