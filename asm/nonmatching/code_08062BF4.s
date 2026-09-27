	.include "macro.inc"

	.syntax unified

	thumb_func_start efxHurtmutEff01OBJ_806D05C
efxHurtmutEff01OBJ_806D05C: @ 0x08062BF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062C14 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062C14: .4byte 0x0201774C
