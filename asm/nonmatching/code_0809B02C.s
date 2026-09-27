	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809B02C
sub_0809B02C: @ 0x0809B02C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809B03C @ =0x08CC5760
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0809B03C: .4byte 0x08CC5760
