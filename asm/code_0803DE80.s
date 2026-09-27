	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DE80
sub_0803DE80: @ 0x0803DE80
	push {lr}
	ldr r0, _0803DE90 @ =0x08B98BEC
	bl IsKeyInputSequenceComplete
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0803DE90: .4byte 0x08B98BEC
