	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSpellAssocReturnBool
GetSpellAssocReturnBool: @ 0x0806BA1C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #0xc]
	pop {r1}
	bx r1
