	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08011DAC
sub_08011DAC: @ 0x08011DAC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	movs r0, #0
	str r0, [sp]
	ldr r5, _08011DFC @ =0x030041D0
	ldr r2, _08011E00 @ =0x01000004
	mov r0, sp
	adds r1, r5, #0
	bl CpuFastSet
	ldrb r2, [r4, #3]
	movs r1, #6
	ands r1, r2
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r3, [r5, #3]
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #3
	lsls r2, r2, #3
	movs r1, #7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #3]
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r4, #1]
	strb r0, [r5, #1]
	cmp r6, #0
	beq _08011E04
	ldrb r0, [r4, #4]
	strb r0, [r5, #4]
	ldrb r0, [r4, #5]
	strb r0, [r5, #5]
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	b _08011E0E
	.align 2, 0
_08011DFC: .4byte 0x030041D0
_08011E00: .4byte 0x01000004
_08011E04:
	ldrb r1, [r4, #6]
	strb r1, [r5, #4]
	ldrb r0, [r4, #7]
	strb r0, [r5, #5]
	adds r2, r0, #0
_08011E0E:
	ldr r0, _08011E24 @ =0x030041D0
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	adds r1, r6, #0
	bl LoadUnitCore
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011E24: .4byte 0x030041D0
