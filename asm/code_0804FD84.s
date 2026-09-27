	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FD84
sub_0804FD84: @ 0x0804FD84
	push {lr}
	ldr r1, _0804FD9C @ =0x02017778
	ldr r0, [r1]
	cmp r0, #0
	beq _0804FD96
	movs r0, #0
	str r0, [r1]
	bl Proc_End
_0804FD96:
	pop {r0}
	bx r0
	.align 2, 0
_0804FD9C: .4byte 0x02017778
