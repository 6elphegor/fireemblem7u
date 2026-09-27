	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080583C8
sub_080583C8: @ 0x080583C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldr r0, _080583F4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080583F8
	movs r5, #0x20
	movs r7, #0x34
	movs r3, #0x36
	mov r8, r3
	movs r0, #0x55
	mov sb, r0
	b _08058404
	.align 2, 0
_080583F4: .4byte 0x0203E02C
_080583F8:
	movs r5, #0x28
	movs r7, #0x3c
	movs r1, #0x41
	mov r8, r1
	movs r3, #0x60
	mov sb, r3
_08058404:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08058430
	ldr r0, [r4, #0x5c]
	bl NewEfxFireBG
	ldr r0, [r4, #0x5c]
	bl NewEfxFireOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf1
	movs r3, #1
	bl PlaySFX
_08058430:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bne _08058444
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b _080584C4
_08058444:
	cmp r0, r7
	bne _080584AE
	movs r0, #9
	ldrh r3, [r6, #0x10]
	orrs r0, r3
	strh r0, [r6, #0x10]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r5]
	cmp r0, #0
	bne _080584C4
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058484
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xf7
	movs r3, #1
	bl PlaySFX
	adds r0, r6, #0
	bl StartSubSpell_efxFireHITBG
	b _080584A6
_08058484:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #0xf8
	movs r3, #1
	bl PlaySFX
	adds r0, r6, #0
	bl StartSubSpell_efxElfireBG
	adds r0, r6, #0
	bl StartSubSpell_efxElfireBGCOL
	adds r0, r6, #0
	bl StartSubSpell_efxElfireOBJ
_080584A6:
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _080584C4
_080584AE:
	cmp r0, r8
	beq _080584C4
	cmp r0, sb
	bne _080584C4
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_080584C4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
