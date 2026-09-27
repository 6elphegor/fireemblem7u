	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBattleAnimHitEffects
StartBattleAnimHitEffects: @ 0x08050160
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r1, #0
	str r2, [sp]
	mov sl, r3
	bl GetAnimPosition
	cmp r0, #0
	bne _0805018C
	ldr r0, _08050188 @ =0x02000000
	ldr r7, [r0, #8]
	ldr r1, [r0, #0xc]
	mov sb, r1
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b _08050198
	.align 2, 0
_08050188: .4byte 0x02000000
_0805018C:
	ldr r0, _080501A8 @ =0x02000000
	ldr r7, [r0]
	ldr r1, [r0, #4]
	mov sb, r1
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
_08050198:
	mov r8, r0
	cmp r4, #0
	beq _080501AC
	cmp r4, #1
	bne _080501A4
	b _080502D6
_080501A4:
	b _080502DC
	.align 2, 0
_080501A8: .4byte 0x02000000
_080501AC:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _080501FC
	adds r0, r7, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _080501FC
	adds r0, r7, #0
	movs r1, #1
	bl SetUnitEfxDebuff
_080501FC:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0805021E
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _0805021E
	adds r0, r5, #0
	movs r1, #1
	bl SetUnitEfxDebuff
_0805021E:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08050234
	asrs r0, r4, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0805023C
_08050234:
	adds r0, r5, #0
	adds r5, r7, #0
	adds r7, r0, #0
	mov r8, sb
_0805023C:
	ldr r4, _080502A4 @ =0x0203E05E
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
	cmp r6, r4
	beq _080502CA
	adds r0, r5, #0
	bl NewEfxHPBar
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _080502A8
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sl
	bl NewEfxHitQuake
	b _080502B2
	.align 2, 0
_080502A4: .4byte 0x0203E05E
_080502A8:
	adds r0, r5, #0
	adds r1, r7, #0
	ldr r2, [sp]
	bl NewEfxHitQuake
_080502B2:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl NewEfxFlashHPBar
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxFlashUnit
	b _080502DC
_080502CA:
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0
	bl NewEfxNoDmage
	b _080502DC
_080502D6:
	adds r0, r5, #0
	bl NewEfxAvoid
_080502DC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
