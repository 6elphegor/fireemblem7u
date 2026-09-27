	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803B340
sub_0803B340: @ 0x0803B340
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
_0803B346:
	lsls r0, r6, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803B38E
	adds r0, r4, #0
	bl GetItemAttributes
	ldr r1, _0803B384 @ =0x00000405
	ands r1, r0
	cmp r1, #0
	beq _0803B388
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B380
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B388
_0803B380:
	movs r0, #1
	b _0803B390
	.align 2, 0
_0803B384: .4byte 0x00000405
_0803B388:
	adds r6, #1
	cmp r6, #4
	ble _0803B346
_0803B38E:
	movs r0, #0
_0803B390:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
