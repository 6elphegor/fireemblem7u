	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitWeaponReach
GetUnitWeaponReach: @ 0x08016EBC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0
	cmp r1, #0
	blt _08016ED4
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemReach
	b _08016F08
_08016ED4:
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _08016F06
_08016EDC:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016EF2
	adds r0, r4, #0
	bl GetItemReach
	orrs r7, r0
_08016EF2:
	adds r5, #1
	cmp r5, #4
	bgt _08016F06
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08016EDC
_08016F06:
	adds r0, r7, #0
_08016F08:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
