	.include "macro.inc"

	.syntax unified

	thumb_func_start InitUnitStack
InitUnitStack: @ 0x0802E8D0
	ldr r2, _0802E8E0 @ =0x0203A7E8
	ldr r1, _0802E8E4 @ =0x0203A7EC
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0802E8E8 @ =0x0203A7F0
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802E8E0: .4byte 0x0203A7E8
_0802E8E4: .4byte 0x0203A7EC
_0802E8E8: .4byte 0x0203A7F0
