	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSpellAssocFlashColor
GetSpellAssocFlashColor: @ 0x0806BA3C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #0xe]
	pop {r1}
	bx r1
