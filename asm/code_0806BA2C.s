	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSpellAssocFacing
GetSpellAssocFacing: @ 0x0806BA2C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #0xd]
	pop {r1}
	bx r1
