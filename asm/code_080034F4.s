	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080034F4
sub_080034F4: @ 0x080034F4
	push {r7, lr}
	mov r7, sp
	ldr r0, _08003504 @ =0x02024E1C
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08003508
	.align 2, 0
_08003504: .4byte 0x02024E1C
_08003508:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
