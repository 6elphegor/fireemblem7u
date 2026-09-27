	.include "macro.inc"

	.syntax unified

	thumb_func_start IsEventRunning
IsEventRunning: @ 0x0800ED20
	push {lr}
	movs r0, #6
	bl sub_080046F4
	cmp r0, #0
	beq _0800ED2E
	movs r0, #1
_0800ED2E:
	pop {r1}
	bx r1
	.align 2, 0
