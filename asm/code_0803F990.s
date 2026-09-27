	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F990
sub_0803F990: @ 0x0803F990
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	adds r0, #1
	movs r5, #0
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_0803F1A8
	movs r0, #2
	bl EnableBgSync
	adds r4, #0x3a
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
