	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSelectedGameOption
GetSelectedGameOption: @ 0x080ADB38
	ldr r0, _080ADB44 @ =0x08CE583C
	ldr r0, [r0]
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080ADB44: .4byte 0x08CE583C
