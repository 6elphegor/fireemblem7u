	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSioIndex
GetSioIndex: @ 0x0803C24C
	ldr r0, _0803C258 @ =0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
_0803C258: .4byte 0x04000128
