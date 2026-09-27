	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08056490
sub_08056490: @ 0x08056490
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805650E
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	ldr r0, [r5, #0x5c]
	bl NewEfxTeonoOBJ
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne _0805650E
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
	bl GetEfxHpChangeType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08056500
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _080564F4
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _08056500
_080564F4:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056524
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_08056500:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056524
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08056524
_0805650E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x46
	beq _08056524
	cmp r0, #0x50
	bne _08056524
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08056524:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
