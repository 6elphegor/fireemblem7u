	.include "macro.inc"

	.syntax unified

	thumb_func_start KillHelpBox
KillHelpBox: @ 0x08081B68
	push {r4, lr}
	ldr r0, _08081B88 @ =0x08CC2014
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08081B80
	bl ClearHelpBoxText
	adds r0, r4, #0
	bl Proc_End
_08081B80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081B88: .4byte 0x08CC2014
