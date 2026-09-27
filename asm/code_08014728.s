	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPaletteAnimatorReverse
StartPaletteAnimatorReverse: @ 0x08014728
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl StartPaletteAnimatorExt
	movs r1, #0
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
