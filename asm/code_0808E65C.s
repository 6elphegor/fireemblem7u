	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepAtSubMenuUI
StartPrepAtSubMenuUI: @ 0x0808E65C
	push {r4, lr}
	adds r4, r0, #0
	bl EndSysBlackBoxs
	bl EndPrepSpecialCharEffect
	bl EndMuralBackground_
	bl GetActivePrepMenuItemIndex
	adds r4, #0x2d
	strb r0, [r4]
	bl EndPrepScreenMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
