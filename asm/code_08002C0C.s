	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002C0C
sub_08002C0C: @ 0x08002C0C
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002C18 @ =0x02024C8C
	ldr r1, [r0]
	adds r0, r1, #0
	b _08002C1C
	.align 2, 0
_08002C18: .4byte 0x02024C8C
_08002C1C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
