	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F950
sub_0803F950: @ 0x0803F950
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _0803F98C @ =0x030013F8
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf
	movs r2, #0
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0803F982
	adds r0, r6, #0
	bl Proc_Break
_0803F982:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F98C: .4byte 0x030013F8
