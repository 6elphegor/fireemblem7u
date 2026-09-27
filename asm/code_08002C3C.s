	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002C3C
sub_08002C3C: @ 0x08002C3C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002C54 @ =0x02024C8C
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C54: .4byte 0x02024C8C
