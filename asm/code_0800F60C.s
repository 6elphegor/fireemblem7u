	.include "macro.inc"

	.syntax unified

	thumb_func_start EventFaceDeamonDelete
EventFaceDeamonDelete: @ 0x0800F60C
	push {lr}
	movs r1, #0x2a
	ldrsh r0, [r0, r1]
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0
