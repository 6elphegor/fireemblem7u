	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUiSpinningArrows
StartUiSpinningArrows: @ 0x080A8CD4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A8CE4 @ =0x08CE4A40
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A8CE4: .4byte 0x08CE4A40
