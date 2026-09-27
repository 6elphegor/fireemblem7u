	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSpellAssocEfxIndex
GetSpellAssocEfxIndex: @ 0x0806B9FC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrh r0, [r0, #4]
	pop {r1}
	bx r1
