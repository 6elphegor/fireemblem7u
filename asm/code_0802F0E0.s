	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaGetResult
ArenaGetResult: @ 0x0802F0E0
	ldr r0, _0802F0E8 @ =0x0203A7F4
	ldrb r0, [r0, #0xa]
	bx lr
	.align 2, 0
_0802F0E8: .4byte 0x0203A7F4
