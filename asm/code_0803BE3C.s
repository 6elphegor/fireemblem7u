	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BE3C
sub_0803BE3C: @ 0x0803BE3C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	movs r2, #1
	ldr r6, _0803BE68 @ =0x030043F0
	adds r4, r6, #0
_0803BE48:
	adds r1, r2, r4
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls _0803BE48
	adds r1, r5, r6
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803BE68: .4byte 0x030043F0
