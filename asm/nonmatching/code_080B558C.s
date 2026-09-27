	.include "macro.inc"

	.syntax unified

	thumb_func_start EndWM
EndWM: @ 0x080B558C
	push {lr}
	ldr r0, _080B55B4 @ =0x08CE4C50
	bl Proc_Find
	bl Proc_End
	ldr r0, _080B55B8 @ =0x08CE76E8
	bl Proc_Find
	bl Proc_End
	bl ClearTalk
	bl EndEachSpriteAnimProc
	movs r0, #0
	bl InitBgs
	pop {r0}
	bx r0
	.align 2, 0
_080B55B4: .4byte 0x08CE4C50
_080B55B8: .4byte 0x08CE76E8
