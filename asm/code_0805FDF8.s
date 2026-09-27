	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805FDF8
sub_0805FDF8: @ 0x0805FDF8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805FE22
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805FE22:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805FE3E
	movs r0, #0xf
	bl StartSubSpell_efxExcaliburSCR
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #1
	bl NewEfxRestWINH_
	b _0805FE84
_0805FE3E:
	adds r0, r6, #2
	cmp r1, r0
	bne _0805FE68
	adds r0, r4, #0
	bl sub_0805FF48
	adds r0, r4, #0
	bl sub_080600D0
	ldr r0, _0805FE64 @ =0x000002BF
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl PlaySFX
	b _0805FE84
	.align 2, 0
_0805FE64: .4byte 0x000002BF
_0805FE68:
	adds r0, r6, #0
	adds r0, #0x2e
	cmp r1, r0
	bne _0805FE84
	movs r0, #0xb0
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0805FE84:
	adds r7, r5, #0
	adds r7, #0x29
	ldrb r0, [r7]
	cmp r0, #0
	bne _0805FF0A
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x33
	cmp r1, r0
	bne _0805FEAC
	adds r0, r4, #0
	bl StartSubSpell_efxExcaliburOBJ
	adds r0, r4, #0
	bl sub_08060298
	adds r0, r4, #0
	bl sub_080603B8
_0805FEAC:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x54
	cmp r1, r0
	bne _0805FED6
	adds r0, r4, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r4, #0
	bl EfxPlayHittedSFX
_0805FED6:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne _0805FEEE
	adds r0, r4, #0
	bl sub_08060444
	adds r0, r4, #0
	bl sub_08060564
_0805FEEE:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x69
	cmp r1, r0
	bne _0805FF40
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl Proc_Break
	b _0805FF40
_0805FF0A:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x32
	cmp r1, r0
	bne _0805FF26
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
_0805FF26:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x33
	cmp r1, r0
	bne _0805FF40
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl Proc_Break
_0805FF40:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
