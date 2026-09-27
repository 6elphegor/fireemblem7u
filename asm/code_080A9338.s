	.include "macro.inc"

	.syntax unified

	thumb_func_start GetParallelWorker
GetParallelWorker: @ 0x080A9338
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	b _080A934A
_080A9340:
	ldr r0, [r1, #0x2c]
	cmp r0, r4
	bne _080A934A
	adds r0, r1, #0
	b _080A9358
_080A934A:
	ldr r0, _080A9360 @ =0x08CE4AB0
	bl Proc_FindAfter
	adds r1, r0, #0
	cmp r1, #0
	bne _080A9340
	movs r0, #0
_080A9358:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9360: .4byte 0x08CE4AB0
