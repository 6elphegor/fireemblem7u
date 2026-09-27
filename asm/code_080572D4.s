	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080572D4
sub_080572D4: @ 0x080572D4
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
	cmp r0, #2
	bne _080572FA
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b _0805738C
_080572FA:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x22
	bne _0805731C
	ldr r0, _08057318 @ =0x00000137
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _0805738C
	.align 2, 0
_08057318: .4byte 0x00000137
_0805731C:
	cmp r0, #0x2a
	bne _08057328
	adds r0, r6, #0
	bl sub_08057394
	b _0805738C
_08057328:
	cmp r0, #0x2d
	bne _0805737A
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
	beq _0805736C
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _08057360
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _0805736C
_08057360:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805738C
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_0805736C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805738C
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _0805738C
_0805737A:
	cmp r0, #0x3e
	beq _0805738C
	cmp r0, #0x40
	bne _0805738C
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805738C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
