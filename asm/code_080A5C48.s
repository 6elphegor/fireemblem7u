	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSaveDraw
StartSaveDraw: @ 0x080A5C48
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5C58 @ =0x08CE42EC
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A5C58: .4byte 0x08CE42EC
