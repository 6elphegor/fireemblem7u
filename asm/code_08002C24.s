	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002C24
sub_08002C24: @ 0x08002C24
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002C30 @ =0x02024C90
	ldr r1, [r0]
	adds r0, r1, #0
	b _08002C34
	.align 2, 0
_08002C30: .4byte 0x02024C90
_08002C34:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
