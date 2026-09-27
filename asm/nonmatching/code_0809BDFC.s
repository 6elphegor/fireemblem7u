	.include "macro.inc"

	.syntax unified

	thumb_func_start SupportScreen_StartUnitSubMenu
SupportScreen_StartUnitSubMenu: @ 0x0809BDFC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl StartSupportUnitSubScreen
	pop {r0}
	bx r0
	.align 2, 0
