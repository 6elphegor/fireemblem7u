	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800421C
sub_0800421C: @ 0x0800421C
	push {r7, lr}
	mov r7, sp
	ldr r1, _08004230 @ =0x08B85854
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004230: .4byte 0x08B85854
