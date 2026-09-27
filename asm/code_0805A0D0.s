	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A0D0
sub_0805A0D0: @ 0x0805A0D0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805A0FE
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805A0FE:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805A120
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl sub_0805A200
	adds r0, r5, #0
	bl StartSubSpell_efxPurgeOBJRND
	movs r0, #0x30
	b _0805A146
_0805A120:
	adds r0, r4, #0
	adds r0, #0x15
	cmp r1, r0
	bne _0805A134
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #0xa0
	b _0805A146
_0805A134:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne _0805A14E
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #0x70
_0805A146:
	movs r1, #0
	bl sub_0805A094
	b _0805A1F8
_0805A14E:
	adds r0, r4, #0
	adds r0, #0x3d
	cmp r1, r0
	bne _0805A182
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r0, r1, #0
	movs r3, #1
	bl PlaySFX
	b _0805A1F8
_0805A182:
	adds r0, r4, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _0805A1C8
	adds r0, r5, #0
	movs r1, #4
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, _0805A1C4 @ =0x00000101
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805A1F8
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805A1F8
	.align 2, 0
_0805A1C4: .4byte 0x00000101
_0805A1C8:
	adds r0, r4, #0
	adds r0, #0x69
	cmp r1, r0
	bne _0805A1E2
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #8
	bl NewEfxALPHA
	b _0805A1F8
_0805A1E2:
	adds r0, r4, #0
	adds r0, #0x71
	cmp r1, r0
	bne _0805A1F8
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0805A1F8:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
