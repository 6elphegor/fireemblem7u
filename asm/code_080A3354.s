	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenu_HandleExtraMiscOption
SaveMenu_HandleExtraMiscOption: @ 0x080A3354
	push {lr}
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0
