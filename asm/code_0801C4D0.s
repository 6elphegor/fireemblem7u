	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801C4D0
sub_0801C4D0: @ 0x0801C4D0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #1
	ldr r5, _0801C538 @ =0x03004690
	ldr r0, [r5]
	ldr r1, [r0, #4]
	ldrb r2, [r0, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r2, r1
	ldr r2, _0801C53C @ =0x0203A85C
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapFloodUnitMovement
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801C570
	ldr r0, _0801C540 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C518
	movs r0, #1
	bl GenerateMagicSealMap
_0801C518:
	ldr r0, _0801C544 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	bl GetUnitWeaponUsabilityBits
	cmp r0, #2
	beq _0801C558
	cmp r0, #2
	bgt _0801C548
	cmp r0, #1
	beq _0801C568
	b _0801C570
	.align 2, 0
_0801C538: .4byte 0x03004690
_0801C53C: .4byte 0x0203A85C
_0801C540: .4byte 0x0202E3F4
_0801C544: .4byte 0x0202E3E8
_0801C548:
	cmp r0, #3
	bne _0801C570
	ldr r0, _0801C564 @ =0x0202BBB8
	adds r0, #0x3e
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, #0
	beq _0801C568
_0801C558:
	ldr r0, [r5]
	bl GenerateUnitCompleteStaffRange
	movs r4, #5
	b _0801C570
	.align 2, 0
_0801C564: .4byte 0x0202BBB8
_0801C568:
	ldr r0, [r5]
	bl GenerateUnitCompleteAttackRange
	movs r4, #3
_0801C570:
	adds r0, r4, #0
	bl DisplayMoveRangeGraphics
	pop {r4, r5, r6}
	pop {r0}
	bx r0
