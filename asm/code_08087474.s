	.include "macro.inc"

	.syntax unified

	thumb_func_start SetCgTextFlags
SetCgTextFlags: @ 0x08087474
	ldr r3, _08087484 @ =0x0203E738
	lsls r0, r0, #0xa
	ldr r1, [r3, #0x48]
	ldr r2, _08087488 @ =0x000003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #0x48]
	bx lr
	.align 2, 0
_08087484: .4byte 0x0203E738
_08087488: .4byte 0x000003FF
