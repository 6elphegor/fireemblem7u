	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBmStLinkArenaFlag
SetBmStLinkArenaFlag: @ 0x0803D9F4
	ldr r0, _0803DA00 @ =0x0202BBB8
	movs r1, #0x40
	ldrb r2, [r0, #4]
	orrs r1, r2
	strb r1, [r0, #4]
	bx lr
	.align 2, 0
_0803DA00: .4byte 0x0202BBB8
