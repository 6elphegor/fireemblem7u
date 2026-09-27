	.include "macro.inc"

	.syntax unified

	thumb_func_start PointsNumberMover_AwaitEnd
PointsNumberMover_AwaitEnd: @ 0x080446C8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x3c]
	adds r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #0x14
	bls _080446DC
	adds r0, r1, #0
	bl Proc_Break
_080446DC:
	pop {r0}
	bx r0
