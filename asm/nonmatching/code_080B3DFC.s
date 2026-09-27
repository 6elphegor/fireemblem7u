	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3DFC
sub_080B3DFC: @ 0x080B3DFC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080B3E1C @ =0x08CE7670
	bl Proc_Start
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x29
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E1C: .4byte 0x08CE7670
