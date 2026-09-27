	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057478
sub_08057478: @ 0x08057478
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805749C
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl NewEfxFlashBgWhite
	b _0805750E
_0805749C:
	cmp r0, #6
	bne _080574D4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	adds r0, r5, #0
	movs r1, #9
	bl sub_08057514
	adds r0, r5, #0
	movs r1, #9
	bl sub_08057608
	adds r0, r5, #0
	bl sub_08057714
	movs r0, #0x86
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805750E
_080574D4:
	cmp r0, #0xa
	bne _080574F8
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
	bne _0805750E
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805750E
_080574F8:
	cmp r0, #0x19
	beq _0805750E
	cmp r0, #0x1e
	bne _0805750E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805750E:
	pop {r4, r5}
	pop {r0}
	bx r0
