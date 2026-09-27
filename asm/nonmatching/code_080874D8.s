	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCgTextFlags
GetCgTextFlags: @ 0x080874D8
	ldr r0, _080874E0 @ =0x0203E738
	ldr r0, [r0, #0x48]
	lsrs r0, r0, #0xa
	bx lr
	.align 2, 0
_080874E0: .4byte 0x0203E738
