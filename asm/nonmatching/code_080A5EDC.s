	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSaveDrawCursor
StartSaveDrawCursor: @ 0x080A5EDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A5EEC @ =0x08CE433C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A5EEC: .4byte 0x08CE433C
