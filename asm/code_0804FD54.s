	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FD54
sub_0804FD54: @ 0x0804FD54
	ldr r0, _0804FD68 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _0804FD64
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_0804FD64:
	bx lr
	.align 2, 0
_0804FD68: .4byte 0x02017778
