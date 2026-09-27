	.include "macro.inc"

	.syntax unified

	thumb_func_start EndHelpPromptSprite
EndHelpPromptSprite: @ 0x08082014
	push {lr}
	ldr r0, _08082028 @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _08082024
	bl Proc_End
_08082024:
	pop {r0}
	bx r0
	.align 2, 0
_08082028: .4byte 0x08CC209C
