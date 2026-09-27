	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809DFC4
sub_0809DFC4: @ 0x0809DFC4
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r6, r1, #0
	add r0, sp, #0x18
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0809E07C @ =0x020144E0
	ldr r2, _0809E080 @ =0x0100000A
	adds r1, r4, #0
	bl CpuSet
	mov r0, sp
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0809F224
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809E088
	strb r5, [r4]
	strb r6, [r4, #2]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	strb r0, [r4, #3]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	strb r0, [r4, #4]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	strb r0, [r4, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	strb r0, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r4, #8]
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r4, #1]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	strh r0, [r4, #0xc]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xe]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xf]
	mov r0, sp
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #8]
	ldr r1, _0809E084 @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x17]
	strb r0, [r4, #0xa]
	mov r2, sp
	ldrb r1, [r2, #3]
	lsrs r1, r1, #7
	movs r0, #0x7f
	ldrb r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	strb r0, [r4, #0xb]
	movs r0, #1
	b _0809E08A
	.align 2, 0
_0809E07C: .4byte 0x020144E0
_0809E080: .4byte 0x0100000A
_0809E084: .4byte 0x001FFFFF
_0809E088:
	movs r0, #0
_0809E08A:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
