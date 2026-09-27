	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADAF8
sub_080ADAF8: @ 0x080ADAF8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080ADB08 @ =0x08CE578C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080ADB08: .4byte 0x08CE578C
