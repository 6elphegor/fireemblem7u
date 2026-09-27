	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6264
sub_080B6264: @ 0x080B6264
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B6274 @ =0x08CE7878
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B6274: .4byte 0x08CE7878
