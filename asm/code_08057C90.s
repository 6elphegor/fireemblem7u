	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057C90
sub_08057C90: @ 0x08057C90
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
	bne _08057CCC
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxIcebreathOBJ
	movs r0, #0x8f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
_08057CCC:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _08057CF4
	movs r0, #9
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08057D0A
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08057D0A
_08057CF4:
	cmp r0, #0x32
	beq _08057D0A
	cmp r0, #0x3c
	bne _08057D0A
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_08057D0A:
	pop {r4, r5}
	pop {r0}
	bx r0
