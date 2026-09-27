	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTextDrawDest
GetTextDrawDest: @ 0x0800587C
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r2, [r0]
	adds r1, r2, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #3
	adds r1, r1, r0
	ldr r0, _0800589C @ =0x02028D70
	ldr r0, [r0]
	lsls r1, r1, #6
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0800589C: .4byte 0x02028D70
