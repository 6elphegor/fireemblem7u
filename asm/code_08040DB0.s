	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040DB0
sub_08040DB0: @ 0x08040DB0
	push {lr}
	ldr r0, _08040DC8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08040DC4
	movs r0, #0x7e
	bl m4aSongNumStart
_08040DC4:
	pop {r0}
	bx r0
	.align 2, 0
_08040DC8: .4byte 0x0202BBF8
