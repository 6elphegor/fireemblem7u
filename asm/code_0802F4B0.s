	.include "macro.inc"

	.syntax unified

	thumb_func_start ActionArena
ActionArena: @ 0x0802F4B0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802F4C0 @ =0x08B963C8
	bl Proc_StartBlocking
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802F4C0: .4byte 0x08B963C8
