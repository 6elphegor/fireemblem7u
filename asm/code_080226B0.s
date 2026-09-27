	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080226B0
sub_080226B0: @ 0x080226B0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080226DC
	ldr r0, _080226D4 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _080226D8 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	bl EquipUnitItemSlot
	adds r0, r4, #0
	bl sub_08022404
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080226E6
	.align 2, 0
_080226D4: .4byte 0x03004690
_080226D8: .4byte 0x0203A85C
_080226DC:
	ldr r1, _080226EC @ =0x00000737
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080226E6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080226EC: .4byte 0x00000737
