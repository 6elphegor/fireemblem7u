	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08058FF0
sub_08058FF0: @ 0x08058FF0
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
	bne _0805901A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805901A:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08059040
	ldr r0, _08059088 @ =0x00000119
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_080590B0
	adds r0, r5, #0
	bl sub_080591EC
_08059040:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x59
	cmp r1, r0
	bne _08059056
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	bl StartSubSpell_efxThunderstormDARK
_08059056:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _0805908C
	adds r0, r5, #0
	bl sub_08059160
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
	bne _080590A8
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _080590A8
	.align 2, 0
_08059088: .4byte 0x00000119
_0805908C:
	adds r0, r6, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _080590A8
	adds r0, #5
	cmp r1, r0
	bne _080590A8
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_080590A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
