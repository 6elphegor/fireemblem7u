	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080567E8
sub_080567E8: @ 0x080567E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805687E
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	ldr r0, [r5, #0x5c]
	bl NewEfxArrowOBJ
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xcc
	movs r3, #1
	bl PlaySFX
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne _0805687E
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08056870
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _08056864
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _08056870
_08056864:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805689A
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_08056870:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805689A
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _0805689A
_0805687E:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r4, #0
	adds r0, #9
	cmp r1, r0
	beq _0805689A
	adds r0, #1
	cmp r1, r0
	bne _0805689A
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805689A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
