	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FD6C
sub_0804FD6C: @ 0x0804FD6C
	ldr r0, _0804FD80 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _0804FD7C
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
_0804FD7C:
	bx lr
	.align 2, 0
_0804FD80: .4byte 0x02017778
