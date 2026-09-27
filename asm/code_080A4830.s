	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4830
sub_080A4830: @ 0x080A4830
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080A484C @ =0x08CE3C24
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A484C: .4byte 0x08CE3C24
