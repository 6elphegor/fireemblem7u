	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMagicEffectBufferFor
GetMagicEffectBufferFor: @ 0x08064044
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0
