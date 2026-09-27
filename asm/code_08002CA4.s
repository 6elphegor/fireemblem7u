	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002CA4
sub_08002CA4: @ 0x08002CA4
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002CB8 @ =0x02024C8C
	ldr r1, [r0]
	ldr r0, _08002CBC @ =0x3CC35AA5
	cmp r1, r0
	beq _08002CC0
	movs r0, #0
	b _08002CC4
	.align 2, 0
_08002CB8: .4byte 0x02024C8C
_08002CBC: .4byte 0x3CC35AA5
_08002CC0:
	movs r0, #1
	b _08002CC4
_08002CC4:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
