	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseLockpickItem
CanUnitUseLockpickItem: @ 0x080273B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080273F2
	adds r0, r4, #0
	bl CanUnitUseChestKeyItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080273F6
	adds r0, r4, #0
	bl CanUnitUseDoorKeyItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080273F6
	adds r0, r4, #0
	bl CanUnitOpenBridge
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080273F6
_080273F2:
	movs r0, #0
	b _080273F8
_080273F6:
	movs r0, #1
_080273F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
