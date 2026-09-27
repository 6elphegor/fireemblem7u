	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022DD4
sub_08022DD4: @ 0x08022DD4
	push {lr}
	ldr r0, _08022DE8 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022DEC
	movs r0, #3
	b _08022E02
	.align 2, 0
_08022DE8: .4byte 0x03004690
_08022DEC:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0x13
	bne _08022E00
	movs r1, #1
_08022E00:
	adds r0, r1, #0
_08022E02:
	pop {r1}
	bx r1
	.align 2, 0
