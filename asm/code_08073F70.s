	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08073F70
sub_08073F70: @ 0x08073F70
	push {r7, lr}
	mov r7, sp
	ldr r1, _08073F84 @ =0x08C9DDA4
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073F84: .4byte 0x08C9DDA4
