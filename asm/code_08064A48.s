	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetEkrDragonStatus
ResetEkrDragonStatus: @ 0x08064A48
	ldr r1, _08064A64 @ =0x02020040
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	ldr r1, _08064A68 @ =0x02020050
	strh r0, [r1]
	strh r0, [r1, #2]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_08064A64: .4byte 0x02020040
_08064A68: .4byte 0x02020050
