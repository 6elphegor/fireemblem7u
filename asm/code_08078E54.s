	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078E54
sub_08078E54: @ 0x08078E54
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r0, #0x18
	asrs r5, r0, #0x18
	lsrs r7, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetAvailableTileEventCommand
	cmp r0, #0x13
	beq _08078EB0
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetAvailableTileEventCommand
	cmp r0, #0x14
	beq _08078EB0
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetAvailableTileEventCommand
	cmp r0, #0x15
	bne _08078E98
	ldr r0, _08078EAC @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x71
	bl GetUnitItemSlot
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08078EB0
_08078E98:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0x16
	beq _08078EB0
	movs r0, #0
	b _08078EB2
	.align 2, 0
_08078EAC: .4byte 0x03004690
_08078EB0:
	movs r0, #1
_08078EB2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
