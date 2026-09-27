	.include "macro.inc"

	.syntax unified

	thumb_func_start EventCall_HideNinianDragonSMS
EventCall_HideNinianDragonSMS: @ 0x0807D944
	push {lr}
	movs r0, #0xda
	bl GetUnitFromCharId
	bl HideUnitSprite
	pop {r0}
	bx r0
