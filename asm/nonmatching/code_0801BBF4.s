	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BBF4
sub_0801BBF4: @ 0x0801BBF4
	push {lr}
	ldr r0, _0801BC04 @ =0x08B9586C
	bl StartMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801BC04: .4byte 0x08B9586C
