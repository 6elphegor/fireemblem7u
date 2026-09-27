	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805BC2C
sub_0805BC2C: @ 0x0805BC2C
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
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805BC62
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805BC62:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805BCD4
	ldr r3, _0805BCD0 @ =0x03002870
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
	movs r2, #0xf
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0xf
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, [r6, #0x5c]
	bl sub_0805BDCC
	ldr r0, [r6, #0x5c]
	bl StartSubSpell_efxHazymoonOBJ3
	movs r0, #0x9c
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _0805BDC0
	.align 2, 0
_0805BCD0: .4byte 0x03002870
_0805BCD4:
	adds r0, r4, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805BD02
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl NewefxRestRST
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x1e
	bl sub_08059DAC
	adds r0, r5, #0
	movs r1, #0x2b
	movs r2, #0
	bl NewEfxRestWINH_
	b _0805BDC0
_0805BD02:
	adds r0, r4, #0
	adds r0, #0x78
	cmp r1, r0
	bne _0805BD12
	adds r0, r5, #0
	bl sub_0805BE3C
	b _0805BDC0
_0805BD12:
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	bne _0805BD30
	ldr r0, _0805BD2C @ =0x00000139
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805BDC0
	.align 2, 0
_0805BD2C: .4byte 0x00000139
_0805BD30:
	adds r0, r4, #0
	adds r0, #0x97
	cmp r1, r0
	bne _0805BD40
	ldr r0, [r6, #0x5c]
	bl sub_0805BF94
	b _0805BDC0
_0805BD40:
	adds r0, r4, #0
	adds r0, #0xe2
	cmp r1, r0
	bne _0805BD88
	ldr r0, _0805BD84 @ =0x000002E2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
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
	bne _0805BDC0
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805BDC0
	.align 2, 0
_0805BD84: .4byte 0x000002E2
_0805BD88:
	adds r0, r4, #0
	adds r0, #0xec
	cmp r1, r0
	bne _0805BDA8
	adds r0, r5, #0
	bl sub_0805BEC0
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl NewEfxALPHA
	b _0805BDC0
_0805BDA8:
	movs r2, #0x87
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne _0805BDC0
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0805BDC0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
