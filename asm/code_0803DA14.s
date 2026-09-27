	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckInLinkArena
CheckInLinkArena: @ 0x0803DA14
	ldr r0, _0803DA20 @ =0x0202BBB8
	ldrb r0, [r0, #4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0803DA20: .4byte 0x0202BBB8
