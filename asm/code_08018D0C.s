	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnit
GetUnit: @ 0x08018D0C
	ldr r2, _08018D1C @ =0x08B92EB0
	movs r1, #0xff
	ands r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08018D1C: .4byte 0x08B92EB0
