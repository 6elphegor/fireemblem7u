	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B76D8
sub_080B76D8: @ 0x080B76D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080B76F4 @ =0x08CEDEA4
	bl Proc_Start
	str r4, [r0, #0x34]
	adds r1, r0, #0
	adds r1, #0x42
	strh r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B76F4: .4byte 0x08CEDEA4
