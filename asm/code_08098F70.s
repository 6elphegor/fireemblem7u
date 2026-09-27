	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098F70
sub_08098F70: @ 0x08098F70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08098F84 @ =0x08CC4EC0
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098F84: .4byte 0x08CC4EC0
