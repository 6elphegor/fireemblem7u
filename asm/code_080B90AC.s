	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B90AC
sub_080B90AC: @ 0x080B90AC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B90BC @ =0x08CEE9A8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B90BC: .4byte 0x08CEE9A8
