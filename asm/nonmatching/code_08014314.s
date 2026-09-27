	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeCoreEndEach
FadeCoreEndEach: @ 0x08014314
	push {lr}
	ldr r0, _08014320 @ =0x08B929AC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08014320: .4byte 0x08B929AC
