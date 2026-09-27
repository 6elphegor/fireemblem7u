	.include "macro.inc"

	.syntax unified

	thumb_func_start UnsetBmStLinkArenaFlag
UnsetBmStLinkArenaFlag: @ 0x0803DA04
	ldr r1, _0803DA10 @ =0x0202BBB8
	movs r0, #0xbf
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_0803DA10: .4byte 0x0202BBB8
