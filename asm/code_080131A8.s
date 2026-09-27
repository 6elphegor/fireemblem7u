	.include "macro.inc"

	.syntax unified

	thumb_func_start GetDataSize
GetDataSize: @ 0x080131A8
	ldr r0, [r0]
	lsrs r0, r0, #8
	bx lr
	.align 2, 0
