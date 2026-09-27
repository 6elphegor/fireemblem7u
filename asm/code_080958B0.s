	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080958B0
sub_080958B0: @ 0x080958B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080958C4 @ =0x08CC4A2C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080958C4: .4byte 0x08CC4A2C
