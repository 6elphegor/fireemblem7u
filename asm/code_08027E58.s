	.include "macro.inc"

	.syntax unified

	thumb_func_start SubtitleMapSelect_End
SubtitleMapSelect_End: @ 0x08027E58
	push {lr}
	bl EndSubtitleHelp
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
