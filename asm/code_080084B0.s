	.include "macro.inc"

	.syntax unified

	thumb_func_start LockTalk
LockTalk: @ 0x080084B0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080084C0 @ =0x08B90A04
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080084C0: .4byte 0x08B90A04
