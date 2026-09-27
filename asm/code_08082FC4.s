	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082FC4
sub_08082FC4: @ 0x08082FC4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08082F50
	adds r0, r4, #0
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0
