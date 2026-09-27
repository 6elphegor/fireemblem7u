	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093A7C
sub_08093A7C: @ 0x08093A7C
	push {lr}
	bl EndMenuScrollBar
	bl EndAllParallelWorkers
	bl EndSysBlackBoxs
	bl EndSysHandCursor
	bl EndHelpPromptSprite
	bl EndUiSpinningArrows
	bl EndMuralBackground_
	pop {r0}
	bx r0
	.align 2, 0
