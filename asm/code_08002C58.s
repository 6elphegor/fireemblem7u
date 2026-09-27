	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002C58
sub_08002C58: @ 0x08002C58
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002C70 @ =0x02024C90
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C70: .4byte 0x02024C90
