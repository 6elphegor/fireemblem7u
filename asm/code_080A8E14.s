	.include "macro.inc"

	.syntax unified

	thumb_func_start StartParallelFiniteLoop
StartParallelFiniteLoop: @ 0x080A8E14
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080A8E2C @ =0x08CE4A60
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8E2C: .4byte 0x08CE4A60
