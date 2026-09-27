	.include "macro.inc"

	.syntax unified

	thumb_func_start EndSubtitleHelp
EndSubtitleHelp: @ 0x0803279C
	push {lr}
	ldr r0, _080327A8 @ =0x08B96A14
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080327A8: .4byte 0x08B96A14
