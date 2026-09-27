	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BE6C
sub_0803BE6C: @ 0x0803BE6C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r3, #1
	ldr r2, _0803BE9C @ =0x030043F0
	adds r5, r2, #0
_0803BE7A:
	adds r1, r3, r5
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x40
	bls _0803BE7A
	adds r0, r6, r2
	movs r1, #1
	strb r1, [r0]
	adds r0, r7, r2
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BE9C: .4byte 0x030043F0
