	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08081C80
sub_08081C80: @ 0x08081C80
	push {r4, lr}
	adds r4, r0, #0
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0
