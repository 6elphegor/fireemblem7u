	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7194
sub_080A7194: @ 0x080A7194
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A71A4 @ =0x08CE47AC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A71A4: .4byte 0x08CE47AC
