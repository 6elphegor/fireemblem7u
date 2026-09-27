	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMapWindows
StartMapWindows: @ 0x08085C68
	push {lr}
	ldr r0, _08085C78 @ =0x08CC2D18
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08085C78: .4byte 0x08CC2D18
