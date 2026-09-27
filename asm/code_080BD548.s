	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD548
sub_080BD548: @ 0x080BD548
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD558 @ =0x08CEF464
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BD558: .4byte 0x08CEF464
