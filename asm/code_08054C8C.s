	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054C8C
sub_08054C8C: @ 0x08054C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _08054D00 @ =0x08E00008
	mov sb, r0
	ldr r2, _08054D04 @ =0x081D856C
	ldrh r1, [r6, #0xa]
	lsls r0, r1, #2
	adds r1, r0, r2
	ldrb r4, [r1]
	adds r0, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	movs r2, #6
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x10]
	ldr r1, [r6, #0x28]
	bl LZ77UnCompWram
	movs r3, #6
	ldrsh r0, [r6, r3]
	lsls r0, r0, #5
	mov r7, sb
	adds r1, r0, r7
	ldr r2, [r1, #0xc]
	ldr r3, [r6, #0x28]
	ldr r7, _08054D08 @ =0x08B9B28C
	cmp r4, #0xff
	beq _08054CD6
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
_08054CD6:
	ldr r0, _08054D08 @ =0x08B9B28C
	mov r8, r0
	cmp r5, #0xff
	beq _08054CE8
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov r8, r3
_08054CE8:
	ldrh r0, [r6, #0xc]
	cmp r0, #0
	bne _08054D10
	ldr r4, [r6, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, _08054D0C @ =0x000057F0
	adds r1, r4, r2
	b _08054D1E
	.align 2, 0
_08054D00: .4byte 0x08E00008
_08054D04: .4byte 0x081D856C
_08054D08: .4byte 0x08B9B28C
_08054D0C: .4byte 0x000057F0
_08054D10:
	ldr r4, [r6, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r3, _08054DF4 @ =0x000057F0
	adds r1, r4, r3
_08054D1E:
	movs r0, #1
	str r0, [r1]
	ldr r5, [r6, #0x14]
	str r7, [r5, #0x24]
	str r7, [r5, #0x20]
	ldr r0, [r6, #0x24]
	str r0, [r5, #0x30]
	ldrh r0, [r6, #2]
	movs r4, #0
	movs r2, #0
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	strh r0, [r5, #4]
	ldrh r7, [r6, #0x10]
	lsls r0, r7, #0xc
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r1, #0
	orrs r0, r3
	ldrh r7, [r6, #0xe]
	orrs r0, r7
	strh r0, [r5, #8]
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r7, [r5, #0xc]
	ands r0, r7
	strh r0, [r5, #0xc]
	strh r2, [r5, #0x10]
	strh r2, [r5, #6]
	strh r2, [r5, #0xe]
	ldrh r0, [r6, #0xa]
	strb r0, [r5, #0x12]
	ldr r0, [r6, #0x1c]
	str r0, [r5, #0x2c]
	strb r4, [r5, #0x14]
	str r5, [r6, #0x14]
	ldr r5, [r6, #0x18]
	mov r0, r8
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	ldr r0, [r6, #0x24]
	str r0, [r5, #0x30]
	ldrh r0, [r6, #2]
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	strh r0, [r5, #4]
	ldrh r7, [r6, #0x10]
	lsls r0, r7, #0xc
	orrs r0, r3
	ldrh r3, [r6, #0xe]
	orrs r0, r3
	strh r0, [r5, #8]
	ldrh r7, [r5, #0xc]
	ands r1, r7
	strh r1, [r5, #0xc]
	strh r2, [r5, #0x10]
	strh r2, [r5, #6]
	strh r2, [r5, #0xe]
	ldrh r0, [r6, #0xa]
	strb r0, [r5, #0x12]
	ldr r0, [r6, #0x1c]
	str r0, [r5, #0x2c]
	strb r4, [r5, #0x14]
	str r5, [r6, #0x18]
	movs r1, #6
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
	movs r2, #8
	ldrsh r1, [r6, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08054DCC
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r7, _08054DF8 @ =0x08FD8008
	adds r0, r0, r7
	ldr r0, [r0, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
_08054DCC:
	ldrb r0, [r6, #1]
	lsls r1, r0, #5
	ldr r0, [r6, #0x20]
	adds r0, r0, r1
	ldrh r6, [r6, #0x10]
	lsls r1, r6, #5
	ldr r2, _08054DFC @ =0x02022A60
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054DF4: .4byte 0x000057F0
_08054DF8: .4byte 0x08FD8008
_08054DFC: .4byte 0x02022A60
