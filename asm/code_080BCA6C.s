	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCA6C
sub_080BCA6C: @ 0x080BCA6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BCA80 @ =0x08CEF2D4
	bl Proc_Start
	str r4, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCA80: .4byte 0x08CEF2D4
