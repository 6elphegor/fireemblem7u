	.include "macro.inc"

	.syntax unified

	thumb_func_start GetWeaponAnimManimSpecialScr
GetWeaponAnimManimSpecialScr: @ 0x0806BA0C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldr r0, [r0, #8]
	pop {r1}
	bx r1
