	.include "macro.inc"

	.syntax unified

	thumb_func_start InitMainMiniAnim
InitMainMiniAnim: @ 0x08054AF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08054B78 @ =0x08E00008
	mov sb, r0
	ldr r2, _08054B7C @ =0x081D856C
	ldrh r3, [r5, #0xa]
	lsls r1, r3, #2
	adds r0, r1, r2
	ldrb r4, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, #6
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x10]
	ldr r1, [r5, #0x28]
	bl LZ77UnCompWram
	movs r2, #6
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	mov r3, sb
	adds r1, r0, r3
	ldr r2, [r1, #0xc]
	ldr r3, [r5, #0x28]
	ldr r7, _08054B80 @ =0x08B9B28C
	cmp r4, #0xff
	beq _08054B4E
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
_08054B4E:
	ldr r0, _08054B80 @ =0x08B9B28C
	mov sl, r0
	cmp r6, #0xff
	beq _08054B60
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov sl, r3
_08054B60:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08054B88
	ldr r4, [r5, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, _08054B84 @ =0x000057F0
	adds r1, r4, r2
	b _08054B96
	.align 2, 0
_08054B78: .4byte 0x08E00008
_08054B7C: .4byte 0x081D856C
_08054B80: .4byte 0x08B9B28C
_08054B84: .4byte 0x000057F0
_08054B88:
	ldr r4, [r5, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r3, _08054C80 @ =0x000057F0
	adds r1, r4, r3
_08054B96:
	movs r0, #1
	str r0, [r1]
	mov r1, r8
	adds r0, r7, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r5, #2]
	movs r6, #0
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	ldrh r1, [r5, #0x10]
	lsls r0, r1, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r4, r3, #0
	orrs r0, r4
	ldrh r1, [r5, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r3, [r5, #0xc]
	lsls r0, r3, #9
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r6, [r2, #0xe]
	ldrh r0, [r5, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r5, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r5, #0x14]
	str r5, [r2, #0x44]
	ldr r1, [sp]
	mov r0, sl
	bl AnimCreate
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	ldrh r3, [r5, #0x10]
	lsls r0, r3, #0xc
	orrs r0, r4
	ldrh r1, [r5, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r3, [r5, #0xc]
	lsls r0, r3, #9
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r6, [r2, #0xe]
	ldrh r0, [r5, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r5, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r5, #0x18]
	str r5, [r2, #0x44]
	movs r2, #6
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r1, [r5, #0x20]
	bl LZ77UnCompWram
	movs r3, #8
	ldrsh r1, [r5, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08054C52
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r2, _08054C84 @ =0x08FD8008
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	ldr r1, [r5, #0x20]
	bl LZ77UnCompWram
_08054C52:
	ldrb r3, [r5, #1]
	lsls r1, r3, #5
	ldr r0, [r5, #0x20]
	adds r0, r0, r1
	ldrh r2, [r5, #0x10]
	lsls r1, r2, #5
	ldr r2, _08054C88 @ =0x02022A60
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	str r6, [r5, #0x2c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054C80: .4byte 0x000057F0
_08054C84: .4byte 0x08FD8008
_08054C88: .4byte 0x02022A60
