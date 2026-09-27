	.include "macro.inc"

	.syntax unified

	thumb_func_start GetKeyStatus_IgnoreMask
GetKeyStatus_IgnoreMask: @ 0x08064A3C
	ldr r0, _08064A44 @ =0x02020040
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08064A44: .4byte 0x02020040
