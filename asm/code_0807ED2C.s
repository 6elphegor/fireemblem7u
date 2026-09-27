	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807ED2C
sub_0807ED2C: @ 0x0807ED2C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807ED3C @ =0x08CBFCB4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807ED3C: .4byte 0x08CBFCB4
