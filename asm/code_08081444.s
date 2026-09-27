	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreen_UpdateLastHelpInfo
StatScreen_UpdateLastHelpInfo: @ 0x08081444
	push {lr}
	bl GetLastHelpBoxInfo
	ldr r1, _08081454 @ =0x0200310C
	str r0, [r1, #0x14]
	pop {r0}
	bx r0
	.align 2, 0
_08081454: .4byte 0x0200310C
