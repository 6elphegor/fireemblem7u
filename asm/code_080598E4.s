	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080598E4
sub_080598E4: @ 0x080598E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805991A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805991A:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _08059978
	ldr r3, _08059974 @ =0x03002870
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
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x23
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	adds r0, r6, #0
	bl sub_08059AB4
	movs r0, #0x92
	lsls r0, r0, #1
	b _080599C6
	.align 2, 0
_08059974: .4byte 0x03002870
_08059978:
	adds r0, r5, #0
	adds r0, #0xf
	cmp r1, r0
	bne _080599B0
	movs r0, #2
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl NewefxRestRST
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x1e
	bl sub_08059DAC
	ldr r0, _080599AC @ =0x03002870
	movs r1, #0x20
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	movs r1, #0x2b
	movs r3, #0
	bl NewEfxRestWINH
	b _08059A1C
	.align 2, 0
_080599AC: .4byte 0x03002870
_080599B0:
	adds r0, r5, #0
	adds r0, #0x3c
	cmp r1, r0
	bne _080599DC
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl StartSubSpell_efxResireBG
	ldr r0, _080599D8 @ =0x00000125
_080599C6:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl PlaySFX
	b _08059A1C
	.align 2, 0
_080599D8: .4byte 0x00000125
_080599DC:
	adds r0, r5, #0
	adds r0, #0x41
	cmp r1, r0
	bne _08059A04
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimResireHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne _08059A1C
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08059A1C
_08059A04:
	adds r0, r5, #0
	adds r0, #0x6e
	cmp r1, r0
	beq _08059A1C
	adds r0, #0x14
	cmp r1, r0
	bne _08059A1C
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_08059A1C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
