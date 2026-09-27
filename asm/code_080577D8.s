	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080577D8
sub_080577D8: @ 0x080577D8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
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
	bne _08057806
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_08057806:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08057854
	ldr r0, _08057850 @ =0x0000010D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl StartSubSpell_efxHurtmutOBJ
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
	bne _0805788A
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805788A
	.align 2, 0
_08057850: .4byte 0x0000010D
_08057854:
	adds r0, r6, #0
	adds r0, #0x1c
	cmp r1, r0
	bne _0805786E
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x10
	bl NewEfxALPHA
	b _0805788A
_0805786E:
	adds r0, r6, #0
	adds r0, #0x32
	cmp r1, r0
	beq _0805788A
	adds r0, #5
	cmp r1, r0
	bne _0805788A
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805788A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
