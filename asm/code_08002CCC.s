	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002CCC
sub_08002CCC: @ 0x08002CCC
	push {r7, lr}
	mov r7, sp
	ldr r0, _08002CE0 @ =0x02024C90
	ldr r1, [r0]
	ldr r0, _08002CE4 @ =0x3CC35AA5
	cmp r1, r0
	beq _08002CE8
	movs r0, #0
	b _08002CEC
	.align 2, 0
_08002CE0: .4byte 0x02024C90
_08002CE4: .4byte 0x3CC35AA5
_08002CE8:
	movs r0, #1
	b _08002CEC
_08002CEC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
