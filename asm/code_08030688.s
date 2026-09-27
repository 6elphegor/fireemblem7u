	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030688
sub_08030688: @ 0x08030688
	push {lr}
	bl EndHelpPromptSprite
	ldr r0, _08030698 @ =0x08B96448
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08030698: .4byte 0x08B96448
