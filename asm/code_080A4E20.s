	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4E20
sub_080A4E20: @ 0x080A4E20
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4E30 @ =0x08CE4034
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A4E30: .4byte 0x08CE4034
