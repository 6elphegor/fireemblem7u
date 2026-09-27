	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D778
sub_0809D778: @ 0x0809D778
	push {r4, lr}
	ldrb r3, [r1]
	str r3, [r0, #8]
	ldrb r4, [r1, #2]
	lsls r2, r4, #8
	ldrb r1, [r1, #1]
	orrs r2, r1
	str r2, [r0, #4]
	str r3, [r0, #0xc]
	pop {r4}
	pop {r0}
	bx r0
