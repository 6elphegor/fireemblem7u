	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809E3D8
sub_0809E3D8: @ 0x0809E3D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0809E3F0 @ =0x08CC5AF0
	bl Proc_StartBlocking
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809E3F0: .4byte 0x08CC5AF0
