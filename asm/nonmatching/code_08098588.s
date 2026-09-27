	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098588
sub_08098588: @ 0x08098588
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809859C @ =0x08CC4DBC
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809859C: .4byte 0x08CC4DBC
