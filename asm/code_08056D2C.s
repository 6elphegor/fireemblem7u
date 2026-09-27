	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08056D2C
sub_08056D2C: @ 0x08056D2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08056DB6
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xca
	movs r3, #1
	bl PlaySFX
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne _08056DB6
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
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
	beq _08056DA8
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _08056D9C
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _08056DA8
_08056D9C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056DCC
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_08056DA8:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056DCC
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08056DCC
_08056DB6:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0xe
	beq _08056DCC
	cmp r0, #0x10
	bne _08056DCC
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_08056DCC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
