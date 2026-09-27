	.include "macro.inc"

	.syntax unified

	thumb_func_start ResumeTalk
ResumeTalk: @ 0x080084DC
	push {lr}
	ldr r0, _080084E8 @ =0x08B90A04
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080084E8: .4byte 0x08B90A04
