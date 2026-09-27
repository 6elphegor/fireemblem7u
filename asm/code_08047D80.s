	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047D80
sub_08047D80: @ 0x08047D80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _08047DA0 @ =0x08B9A3A8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047DA0: .4byte 0x08B9A3A8
