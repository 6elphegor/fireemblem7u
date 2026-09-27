	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBattleAnimResireHitEffects
StartBattleAnimResireHitEffects: @ 0x080502EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r1
	bl GetAnimPosition
	cmp r0, #0
	bne _0805030C
	ldr r0, _08050308 @ =0x02000000
	ldr r7, [r0, #8]
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b _08050314
	.align 2, 0
_08050308: .4byte 0x02000000
_0805030C:
	ldr r0, _0805036C @ =0x02000000
	ldr r7, [r0]
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
_08050314:
	mov r8, r0
	ldr r4, _08050370 @ =0x0203E05E
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	mov r0, sb
	cmp r0, #0
	beq _08050374
	cmp r0, #1
	beq _080503CC
	b _080503D2
	.align 2, 0
_0805036C: .4byte 0x02000000
_08050370: .4byte 0x0203E05E
_08050374:
	cmp r6, r4
	beq _080503B6
	adds r0, r5, #0
	bl NewEfxHpBarResire
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08050394
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #4
	bl NewEfxHitQuake
	b _0805039E
_08050394:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #3
	bl NewEfxHitQuake
_0805039E:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl NewEfxFlashHPBar
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxFlashUnit
	b _080503D2
_080503B6:
	ldr r1, _080503C8 @ =0x02017750
	movs r0, #2
	str r0, [r1]
	adds r0, r5, #0
	mov r1, r8
	movs r2, #1
	bl NewEfxNoDmage
	b _080503D2
	.align 2, 0
_080503C8: .4byte 0x02017750
_080503CC:
	adds r0, r5, #0
	bl NewEfxAvoid
_080503D2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
