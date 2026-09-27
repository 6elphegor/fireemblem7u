	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805898C
sub_0805898C: @ 0x0805898C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080589C2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_080589C2:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #1
	cmp r1, r0
	bne _08058A1E
	adds r0, r5, #0
	bl sub_08058AC4
	adds r0, r5, #0
	bl StartSubSpell_efxFimbulvetrOBJ2
	ldr r3, _08058A34 @ =0x03002870
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
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl NewEfxALPHA
	movs r0, #0x91
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
_08058A1E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x52
	cmp r1, r0
	bne _08058A38
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	b _08058AB8
	.align 2, 0
_08058A34: .4byte 0x03002870
_08058A38:
	adds r0, r6, #0
	adds r0, #0x55
	cmp r1, r0
	bne _08058A74
	adds r0, r5, #0
	bl sub_08058BAC
	adds r0, r5, #0
	bl StartSubSpell_efxFimbulvetrOBJ
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _08058A70 @ =0x00000123
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _08058AB8
	.align 2, 0
_08058A70: .4byte 0x00000123
_08058A74:
	adds r0, r6, #0
	adds r0, #0x58
	cmp r1, r0
	bne _08058A9C
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
	bne _08058AB8
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08058AB8
_08058A9C:
	adds r0, r6, #0
	adds r0, #0x88
	cmp r1, r0
	beq _08058AB8
	adds r0, #0x19
	cmp r1, r0
	bne _08058AB8
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_08058AB8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
