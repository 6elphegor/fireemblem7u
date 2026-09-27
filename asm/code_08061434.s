	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061434
sub_08061434: @ 0x08061434
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
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
	movs r1, #0
	mov r8, r1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08061468
	ldr r0, [r6, #0x5c]
	subs r1, #1
	bl NewEfxFarAttackWithDistance
_08061468:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _0806147C
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _0806158E
_0806147C:
	adds r0, r4, #0
	adds r0, #0xb
	cmp r1, r0
	bne _08061490
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG1
	movs r0, #0xb1
	lsls r0, r0, #2
	b _08061566
_08061490:
	adds r0, r4, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _080614E0
	adds r0, r5, #0
	movs r1, #0x72
	bl sub_08061914
	ldr r3, _080614D8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	ldr r0, _080614DC @ =0x000002C5
	b _08061566
	.align 2, 0
_080614D8: .4byte 0x03002870
_080614DC: .4byte 0x000002C5
_080614E0:
	adds r0, r4, #0
	adds r0, #0x4c
	cmp r1, r0
	bne _080614FA
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_08061760
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_080617DC
	b _0806158E
_080614FA:
	adds r0, r4, #0
	adds r0, #0x56
	cmp r1, r0
	bne _0806150E
	adds r0, r5, #0
	movs r1, #0x37
	movs r2, #0x2d
	bl sub_08061874
	b _0806158E
_0806150E:
	adds r0, r4, #0
	adds r0, #0x8d
	cmp r1, r0
	bne _08061538
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806158E
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0806158E
_08061538:
	adds r0, r4, #0
	adds r0, #0x8e
	cmp r1, r0
	bne _08061578
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_08061658
	mov r0, r8
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _08061574 @ =0x000002C6
_08061566:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _0806158E
	.align 2, 0
_08061574: .4byte 0x000002C6
_08061578:
	adds r0, r4, #0
	adds r0, #0xf5
	cmp r1, r0
	bne _0806158E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0806158E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
