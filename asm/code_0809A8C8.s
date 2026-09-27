	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A8C8
sub_0809A8C8: @ 0x0809A8C8
	push {r4, lr}
	ldr r4, _0809A8E0 @ =0x08CC52D8
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809A8E0: .4byte 0x08CC52D8
