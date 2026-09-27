	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08072784
sub_08072784: @ 0x08072784
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08072884 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	subs r1, r2, #1
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	subs r2, r3, #3
	ldr r3, _08072888 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0807288C @ =0x083F4E88
	str r4, [sp, #8]
	ldr r4, _08072890 @ =0x08C9DB4C
	ldr r6, [r7]
	adds r5, r6, #0
	adds r6, #0x40
	ldrh r5, [r6]
	mov r8, r5
	mov r6, r8
	lsrs r5, r6, #1
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	adds r4, r4, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_080148FC
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08072890 @ =0x08C9DB4C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r3, [r2]
	lsrs r1, r3, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _0807281A
	ldr r0, [r7]
	bl Proc_Break
_0807281A:
	bl SetDefaultManimScreenConf
	ldr r0, _08072894 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072894 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072894 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xc
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072894 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072884: .4byte 0x02023C60
_08072888: .4byte 0x00004140
_0807288C: .4byte 0x083F4E88
_08072890: .4byte 0x08C9DB4C
_08072894: .4byte 0x03002870
