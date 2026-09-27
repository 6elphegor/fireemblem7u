	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037548
sub_08037548: @ 0x08037548
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_0803754E:
	lsls r0, r5, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _08037584
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	beq _0803757E
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803757E
	movs r0, #1
	b _08037586
_0803757E:
	adds r5, #1
	cmp r5, #4
	ble _0803754E
_08037584:
	movs r0, #0
_08037586:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
