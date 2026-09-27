	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800ED78
sub_0800ED78: @ 0x0800ED78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800ED8C @ =0x08B91AD8
	bl StartEvent
	str r4, [r0, #0x48]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800ED8C: .4byte 0x08B91AD8
