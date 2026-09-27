	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4DA8
sub_080A4DA8: @ 0x080A4DA8
	push {lr}
	bl EndHelpPromptSprite
	pop {r0}
	bx r0
	.align 2, 0
