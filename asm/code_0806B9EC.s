	.include "macro.inc"

	.syntax unified

	thumb_func_start GetWeaponAnimActorCount
GetWeaponAnimActorCount: @ 0x0806B9EC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocStructPtr
	ldrb r0, [r0, #2]
	pop {r1}
	bx r1
