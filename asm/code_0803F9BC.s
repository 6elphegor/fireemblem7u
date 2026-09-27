	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F9BC
sub_0803F9BC: @ 0x0803F9BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _0803F9FC @ =0x030013F8
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xf
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0803F9F4
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r6, #0
	bl Proc_Break
_0803F9F4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F9FC: .4byte 0x030013F8
