	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082FD8
sub_08082FD8: @ 0x08082FD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08082FEC @ =0x08CC2A04
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082FEC: .4byte 0x08CC2A04
