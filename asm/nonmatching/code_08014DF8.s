	.include "macro.inc"

	.syntax unified

	thumb_func_start PlaySeFunc
PlaySeFunc: @ 0x08014DF8
	push {lr}
	adds r1, r0, #0
	ldr r0, _08014E14 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08014E10
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08014E10:
	pop {r0}
	bx r0
	.align 2, 0
_08014E14: .4byte 0x0202BBF8
