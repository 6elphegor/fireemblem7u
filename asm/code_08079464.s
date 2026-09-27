	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBattleTalk
StartBattleTalk: @ 0x08079464
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r1, #0
	adds r0, r4, #0
	bl sub_080792C4
	adds r5, r0, #0
	cmp r5, #0
	beq _080794A8
	ldr r0, [r5, #0xc]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079508
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _08079496
	bl sub_0800ED78
	b _0807949C
_08079496:
	ldr r0, [r5, #8]
	bl sub_0800AF5C
_0807949C:
	bl sub_0800ADB8
	ldr r0, [r5, #0xc]
	bl SetFlag
	b _08079508
_080794A8:
	ldr r5, _080794DC @ =0x08C9EAF4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08079320
	adds r4, r0, #0
	cmp r4, #0
	bne _080794C6
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08079320
	adds r4, r0, #0
	cmp r4, #0
	beq _080794E0
_080794C6:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080794D4
	bl sub_0800ED78
	bl sub_0800ADB8
_080794D4:
	ldr r0, [r4, #8]
	bl SetFlag
	b _08079508
	.align 2, 0
_080794DC: .4byte 0x08C9EAF4
_080794E0:
	ldr r1, _08079510 @ =0x08C9F130
	adds r0, r7, #0
	bl sub_08079320
	adds r4, r0, #0
	cmp r4, #0
	beq _08079508
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079508
	ldr r0, [r4, #4]
	bl sub_0800ED78
	bl sub_0800ADB8
	ldr r0, [r4, #8]
	bl SetFlag
_08079508:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079510: .4byte 0x08C9F130
