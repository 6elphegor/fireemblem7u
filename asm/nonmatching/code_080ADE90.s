	.include "macro.inc"

	.syntax unified

	thumb_func_start ConfigSprites_Init
ConfigSprites_Init: @ 0x080ADE90
	push {lr}
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	movs r0, #0x80
	movs r1, #3
	bl UnpackUiVArrowGfx
	pop {r0}
	bx r0
	.align 2, 0
