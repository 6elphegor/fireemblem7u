	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800ED34
sub_0800ED34: @ 0x0800ED34
	push {lr}
	ldr r0, _0800ED48 @ =0x08B90D88
	bl Proc_FindNonBlocked
	cmp r0, #0
	beq _0800ED42
	movs r0, #1
_0800ED42:
	pop {r1}
	bx r1
	.align 2, 0
_0800ED48: .4byte 0x08B90D88
