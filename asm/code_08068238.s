	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEkrClasschg
EndEkrClasschg: @ 0x08068238
	push {lr}
	ldr r0, _08068248 @ =0x020200A8
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08068248: .4byte 0x020200A8
