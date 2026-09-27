	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshMapSelect_Select
RefreshMapSelect_Select: @ 0x08022168
	ldr r2, _08022178 @ =0x0203A85C
	movs r0, #4
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022178: .4byte 0x0203A85C
