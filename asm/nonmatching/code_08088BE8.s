	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08088BE8
sub_08088BE8: @ 0x08088BE8
	push {r4, r5, lr}
	ldr r0, _08088C54 @ =0x0200D668
	bl InitUnitStack
	movs r5, #1
_08088BF2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08088C16
	ldr r0, [r4]
	cmp r0, #0
	beq _08088C16
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08088C16
	adds r0, r4, #0
	bl PushUnit
_08088C16:
	adds r5, #1
	cmp r5, #0x3f
	ble _08088BF2
	movs r5, #1
_08088C1E:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08088C42
	ldr r0, [r4]
	cmp r0, #0
	beq _08088C42
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08088C42
	adds r0, r4, #0
	bl PushUnit
_08088C42:
	adds r5, #1
	cmp r5, #0x3f
	ble _08088C1E
	bl LoadPlayerUnitsFromUnitStack
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088C54: .4byte 0x0200D668
