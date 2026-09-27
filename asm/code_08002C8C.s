	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002C8C
sub_08002C8C: @ 0x08002C8C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002C9C @ =0x02024C90
	ldr r1, _08002CA0 @ =0x3CC35AA5
	str r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C9C: .4byte 0x02024C90
_08002CA0: .4byte 0x3CC35AA5
