	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUse_unused
CanUnitUse_unused: @ 0x08016B2C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016B54 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08016B58
	adds r0, r3, #0
	adds r1, r2, #0
	bl CanUnitUseItem
	b _08016B60
	.align 2, 0
_08016B54: .4byte 0x08BE222C
_08016B58:
	adds r0, r3, #0
	adds r1, r2, #0
	bl CanUnitUseWeapon
_08016B60:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
