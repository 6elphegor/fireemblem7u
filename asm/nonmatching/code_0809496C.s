	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809496C
sub_0809496C: @ 0x0809496C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08094988 @ =0x08CC49E4
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094988: .4byte 0x08CC49E4
