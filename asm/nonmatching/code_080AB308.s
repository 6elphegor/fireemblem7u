	.include "macro.inc"

	.syntax unified

	thumb_func_start VolumeGraphBuffer_Init
VolumeGraphBuffer_Init: @ 0x080AB308
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
