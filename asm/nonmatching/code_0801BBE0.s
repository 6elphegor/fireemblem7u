	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BBE0
sub_0801BBE0: @ 0x0801BBE0
	push {lr}
	ldr r0, _0801BBF0 @ =0x08B958B4
	bl StartMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801BBF0: .4byte 0x08B958B4
