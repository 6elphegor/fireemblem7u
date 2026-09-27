	.include "macro.inc"

	.syntax unified

	thumb_func_start SetInitTalkTextFont
SetInitTalkTextFont: @ 0x08007F64
	push {lr}
	ldr r0, _08007F74 @ =0x030000E8
	bl SetTextFont
	bl InitTalkTextFont
	pop {r0}
	bx r0
	.align 2, 0
_08007F74: .4byte 0x030000E8
