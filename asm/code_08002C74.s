	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002C74
sub_08002C74: @ 0x08002C74
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002C84 @ =0x02024C8C
	ldr r1, _08002C88 @ =0x3CC35AA5
	str r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002C84: .4byte 0x02024C8C
_08002C88: .4byte 0x3CC35AA5
