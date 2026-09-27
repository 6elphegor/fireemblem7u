	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_InsertDrawNumberOrBlank
Text_InsertDrawNumberOrBlank: @ 0x08005B3C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumberOrBlank
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
