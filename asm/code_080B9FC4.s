	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9FC4
sub_080B9FC4: @ 0x080B9FC4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B9FD4 @ =0x08CEED00
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B9FD4: .4byte 0x08CEED00
