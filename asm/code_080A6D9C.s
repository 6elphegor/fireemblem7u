	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6D9C
sub_080A6D9C: @ 0x080A6D9C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6DAC @ =0x08CE45E4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A6DAC: .4byte 0x08CE45E4
