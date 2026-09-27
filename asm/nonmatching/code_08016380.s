	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseWeaponNow
CanUnitUseWeaponNow: @ 0x08016380
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _080163B6
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080163BC @ =0x08BE222C
	adds r0, r0, r1
	ldr r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080163B6
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080163C0
	adds r0, r5, #0
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080163C0
_080163B6:
	movs r0, #0
	b _080163CC
	.align 2, 0
_080163BC: .4byte 0x08BE222C
_080163C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080163CC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
