	.include "macro.inc"

	.syntax unified

	thumb_func_start SoundRoomUi_OnEnd
SoundRoomUi_OnEnd: @ 0x080ABD7C
	push {lr}
	bl EndAllProcChildren
	ldr r0, _080ABD8C @ =0x08CE54B4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080ABD8C: .4byte 0x08CE54B4
