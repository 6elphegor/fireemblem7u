	.include "macro.inc"

	.syntax unified

	thumb_func_start DummyIrqRoutine
DummyIrqRoutine: @ 0x08000BB0
	push {r7, lr}
	mov r7, sp
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
