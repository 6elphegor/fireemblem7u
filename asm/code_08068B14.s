	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEkrLevelUp
EndEkrLevelUp: @ 0x08068B14
	push {lr}
	ldr r0, _08068B24 @ =0x020200AC
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08068B24: .4byte 0x020200AC
