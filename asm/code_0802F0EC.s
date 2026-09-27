	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaSetResult
ArenaSetResult: @ 0x0802F0EC
	ldr r1, _0802F0F4 @ =0x0203A7F4
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_0802F0F4: .4byte 0x0203A7F4
