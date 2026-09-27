	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805AECC
sub_0805AECC: @ 0x0805AECC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r3, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #1
	bne _0805AF10
	ldr r0, _0805AF0C @ =0x00000127
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_0805AFBC
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxDivineOBJ
	b _0805AFB6
	.align 2, 0
_0805AF0C: .4byte 0x00000127
_0805AF10:
	cmp r2, #0x14
	bne _0805AF24
	movs r0, #0x94
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805AF50
_0805AF24:
	cmp r2, #0x32
	bne _0805AF34
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b _0805AFB6
_0805AF34:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805AF5C
	adds r0, r5, #0
	bl sub_0805B040
	ldr r0, _0805AF58 @ =0x00000129
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805AF50:
	movs r3, #1
	bl PlaySFX
	b _0805AFB6
	.align 2, 0
_0805AF58: .4byte 0x00000129
_0805AF5C:
	adds r0, r3, #0
	adds r0, #0x49
	cmp r1, r0
	bne _0805AF6E
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _0805AFB6
_0805AF6E:
	adds r0, r3, #0
	adds r0, #0x4b
	cmp r1, r0
	bne _0805AF9C
	adds r0, r5, #0
	bl sub_0805B0C4
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
	bne _0805AFB6
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805AFB6
_0805AF9C:
	adds r0, r3, #0
	adds r0, #0x5a
	cmp r1, r0
	beq _0805AFB6
	cmp r2, #0x64
	bne _0805AFB6
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805AFB6:
	pop {r4, r5}
	pop {r0}
	bx r0
