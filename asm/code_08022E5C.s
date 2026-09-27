	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022E5C
sub_08022E5C: @ 0x08022E5C
	push {lr}
	ldr r0, _08022E78 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022E78: .4byte 0x03004690
