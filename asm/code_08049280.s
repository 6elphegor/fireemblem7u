	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08049280
sub_08049280: @ 0x08049280
	push {r4, r5, lr}
	ldr r5, _080492AC @ =0x03004690
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080492C2
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _080492B0
	movs r0, #2
	b _080492C4
	.align 2, 0
_080492AC: .4byte 0x03004690
_080492B0:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080492C2
	movs r0, #1
	b _080492C4
_080492C2:
	movs r0, #3
_080492C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
