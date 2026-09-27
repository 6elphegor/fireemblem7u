	.include "macro.inc"

	.syntax unified

	thumb_func_start NewSysBlackBoxHandler
NewSysBlackBoxHandler: @ 0x080A91AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A91CC @ =0x08CE4A80
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A91CC: .4byte 0x08CE4A80
