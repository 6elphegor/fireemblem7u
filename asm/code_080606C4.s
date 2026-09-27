	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080606C4
sub_080606C4: @ 0x080606C4
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
	bne _080606F8
	ldr r0, [r6, #0x5c]
	subs r1, #1
	bl NewEfxFarAttackWithDistance
_080606F8:
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	adds r0, r4, #1
	cmp r1, r0
	bne _08060768
	adds r0, r5, #0
	bl sub_080608AC
	adds r0, r5, #0
	bl sub_08060CFC
	ldr r3, _08060760 @ =0x03002870
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
	mov r3, r8
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl NewEfxALPHA
	mov r0, r8
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x32
	movs r2, #0xa
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _08060764 @ =0x000002C7
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	b _08060868
	.align 2, 0
_08060760: .4byte 0x03002870
_08060764: .4byte 0x000002C7
_08060768:
	adds r0, r4, #0
	adds r0, #0x45
	cmp r1, r0
	bne _080607C0
	ldr r0, [r6, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	movs r1, #0x54
	bl sub_080609E4
	ldr r3, _080607BC @ =0x03002870
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
	mov r3, r8
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl NewEfxALPHA
	movs r0, #0xb2
	lsls r0, r0, #2
	b _08060862
	.align 2, 0
_080607BC: .4byte 0x03002870
_080607C0:
	adds r0, r4, #0
	adds r0, #0x58
	cmp r1, r0
	bne _080607D2
	adds r0, r5, #0
	movs r1, #0x32
	bl sub_08060C60
	b _0806089E
_080607D2:
	adds r0, r4, #0
	adds r0, #0x5d
	cmp r1, r0
	beq _080607E2
	adds r0, r4, #0
	adds r0, #0x6c
	cmp r1, r0
	bne _080607EC
_080607E2:
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	b _0806089E
_080607EC:
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	bne _0806081E
	adds r0, r5, #0
	movs r1, #0xa
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
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806089E
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0806089E
_0806081E:
	adds r0, r4, #0
	adds r0, #0x9f
	cmp r1, r0
	bne _08060840
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806089E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
	b _0806089E
_08060840:
	adds r0, r4, #0
	adds r0, #0xa3
	cmp r1, r0
	bne _08060874
	ldr r0, [r6, #0x5c]
	movs r1, #0xf
	movs r2, #9
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	movs r1, #0x1e
	bl sub_08060AEC
	adds r0, r5, #0
	bl StartSubSpell_efxGespenstBGCOL2
	ldr r0, _08060870 @ =0x000002C9
_08060862:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
_08060868:
	movs r3, #1
	bl PlaySFX
	b _0806089E
	.align 2, 0
_08060870: .4byte 0x000002C9
_08060874:
	adds r0, r4, #0
	adds r0, #0xb3
	cmp r1, r0
	bne _08060888
	ldr r0, [r6, #0x5c]
	movs r1, #0xf
	movs r2, #8
	bl StartSpellThing_MagicQuake
	b _0806089E
_08060888:
	adds r0, r4, #0
	adds r0, #0xcc
	cmp r1, r0
	bne _0806089E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0806089E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
