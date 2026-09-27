	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E6D8
sub_0805E6D8: @ 0x0805E6D8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E706
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805E706:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805E754
	adds r0, r5, #0
	bl sub_0805E9DC
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_0805E7B8
	adds r0, r5, #0
	movs r1, #0x4a
	bl StartSubSpell_efxBerserkCLONE
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0xa
	adds r3, r4, #0
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0
	bl NewEfxRestWINH_
	movs r1, #2
	ldrsh r2, [r5, r1]
	movs r0, #0xf9
	adds r1, r4, #0
	movs r3, #1
	bl PlaySFX
	b _0805E7AE
_0805E754:
	adds r0, r6, #0
	adds r0, #0x4a
	cmp r1, r0
	bne _0805E790
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimStatusChgHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805E7AE
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _0805E7AE
	adds r0, r5, #0
	movs r1, #4
	bl SetUnitEfxDebuff
	b _0805E7AE
_0805E790:
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne _0805E7AE
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805E7AE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
