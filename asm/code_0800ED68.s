	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800ED68
sub_0800ED68: @ 0x0800ED68
	push {lr}
	ldr r0, _0800ED74 @ =0x08B91AB8
	bl SetFaceConfig
	pop {r0}
	bx r0
	.align 2, 0
_0800ED74: .4byte 0x08B91AB8
