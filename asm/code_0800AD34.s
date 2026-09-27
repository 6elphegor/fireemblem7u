	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPopupNumber
SetPopupNumber: @ 0x0800AD34
	ldr r1, _0800AD3C @ =0x0300010C
	str r0, [r1]
	bx lr
	.align 2, 0
_0800AD3C: .4byte 0x0300010C
