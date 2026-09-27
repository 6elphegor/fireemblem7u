	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeInOut_Init
FadeInOut_Init: @ 0x080AA178
	push {r4, lr}
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
