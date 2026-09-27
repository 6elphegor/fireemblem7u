	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045C38
sub_08045C38: @ 0x08045C38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08045C50 @ =0x08B99C18
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045C50: .4byte 0x08B99C18
