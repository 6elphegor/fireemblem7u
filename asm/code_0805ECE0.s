	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805ECE0
sub_0805ECE0: @ 0x0805ECE0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805ED0C
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805ED0C:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805ED3C
	ldr r0, [r5, #0x5c]
	bl sub_0805EDAC
	adds r0, r4, #0
	bl sub_0805EE60
	adds r0, r4, #0
	bl StartSubSpell_efxMshieldBGOBJ2
	movs r0, #0x81
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl PlaySFX
	b _0805EDA6
_0805ED3C:
	adds r0, r6, #0
	adds r0, #0x28
	cmp r1, r0
	beq _0805ED4C
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	bne _0805ED54
_0805ED4C:
	adds r0, r4, #0
	bl StartSubSpell_efxMshieldBGOBJ2
	b _0805EDA6
_0805ED54:
	adds r0, r6, #0
	adds r0, #0xb0
	cmp r1, r0
	bne _0805ED6A
	adds r0, r4, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b _0805EDA6
_0805ED6A:
	adds r0, r6, #0
	adds r0, #0xe1
	cmp r1, r0
	bne _0805ED88
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl StartBattleAnimStatusChgHitEffects
	b _0805EDA6
_0805ED88:
	adds r0, r6, #0
	adds r0, #0xe6
	cmp r1, r0
	bne _0805EDA6
	movs r0, #2
	ldrh r3, [r4, #0x10]
	orrs r0, r3
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl Proc_Break
_0805EDA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
