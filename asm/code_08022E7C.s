	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022E7C
sub_08022E7C: @ 0x08022E7C
	push {lr}
	ldr r0, _08022E90 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022E94
	movs r0, #3
	b _08022EAA
	.align 2, 0
_08022E90: .4byte 0x03004690
_08022E94:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0x15
	bne _08022EA8
	movs r1, #1
_08022EA8:
	adds r0, r1, #0
_08022EAA:
	pop {r1}
	bx r1
	.align 2, 0
