	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9FB0
sub_080B9FB0: @ 0x080B9FB0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B9FC0 @ =0x08CEEBD8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B9FC0: .4byte 0x08CEEBD8
