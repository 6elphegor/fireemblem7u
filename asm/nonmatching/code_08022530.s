	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022530
sub_08022530: @ 0x08022530
	push {r4, r5, lr}
	ldr r5, _08022580 @ =0x03004690
	ldr r0, [r5]
	ldr r1, _08022584 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemEffect
	cmp r0, #0
	beq _0802257C
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	beq _0802257C
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	beq _0802257C
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022588
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022588
_0802257C:
	movs r0, #3
	b _0802259E
	.align 2, 0
_08022580: .4byte 0x03004690
_08022584: .4byte 0x0203A85C
_08022588:
	ldr r0, _080225A4 @ =0x03004690
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0802259C
	movs r1, #1
_0802259C:
	adds r0, r1, #0
_0802259E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080225A4: .4byte 0x03004690
