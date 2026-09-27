	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080490B4
sub_080490B4: @ 0x080490B4
	push {lr}
	ldr r0, _080490C0 @ =0x08B9A5E0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080490C0: .4byte 0x08B9A5E0
