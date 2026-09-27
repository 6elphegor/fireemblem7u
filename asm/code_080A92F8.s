	.include "macro.inc"

	.syntax unified

	thumb_func_start StartParallelWorker
StartParallelWorker: @ 0x080A92F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetParallelWorker
	cmp r0, #0
	bne _080A9310
	ldr r0, _080A9318 @ =0x08CE4AB0
	adds r1, r5, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
_080A9310:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A9318: .4byte 0x08CE4AB0
