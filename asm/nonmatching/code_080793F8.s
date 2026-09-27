	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckBattleTalk
CheckBattleTalk: @ 0x080793F8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	adds r0, r4, #0
	bl sub_080792C4
	cmp r0, #0
	beq _0807941E
	ldr r0, [r0, #0xc]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807945C
	b _0807944E
_0807941E:
	ldr r6, _08079454 @ =0x08C9EAF4
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08079320
	cmp r0, #0
	bne _0807944E
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08079320
	cmp r0, #0
	bne _0807944E
	ldr r1, _08079458 @ =0x08C9F130
	adds r0, r7, #0
	bl sub_08079320
	cmp r0, #0
	beq _0807945C
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807945C
_0807944E:
	movs r0, #1
	b _0807945E
	.align 2, 0
_08079454: .4byte 0x08C9EAF4
_08079458: .4byte 0x08C9F130
_0807945C:
	movs r0, #0
_0807945E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
