	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057970
sub_08057970: @ 0x08057970
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08057998
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_08057998:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _080579E4
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	bl sub_08057A20
	adds r0, r5, #0
	bl sub_08057B30
	adds r0, r5, #0
	bl sub_08057BB8
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0xf
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _080579E0 @ =0x0000011D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _08057A16
	.align 2, 0
_080579E0: .4byte 0x0000011D
_080579E4:
	cmp r0, #0xf
	bne _08057A08
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
	bne _08057A16
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08057A16
_08057A08:
	cmp r0, #0x82
	bne _08057A16
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_08057A16:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
