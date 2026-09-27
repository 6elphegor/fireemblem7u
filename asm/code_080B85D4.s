	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B85D4
sub_080B85D4: @ 0x080B85D4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B85E4 @ =0x08CEE86C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B85E4: .4byte 0x08CEE86C
