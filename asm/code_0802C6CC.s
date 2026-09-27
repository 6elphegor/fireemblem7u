	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C6CC
sub_0802C6CC: @ 0x0802C6CC
	push {lr}
	bl ExecTrapAfterWarp
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
