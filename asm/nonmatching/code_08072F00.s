	.include "macro.inc"

	.syntax unified

	thumb_func_start ManimRepairFx_Blink
ManimRepairFx_Blink: @ 0x08072F00
	push {r4, r5, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	adds r1, r7, #4
	ldr r2, _08072FB8 @ =0x083FC508
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x13
	bl memcpy
	ldr r0, _08072FBC @ =0x03002870
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
	ldr r0, _08072FBC @ =0x03002870
	adds r1, r7, #4
	ldr r2, [r7]
	adds r3, r2, #0
	adds r2, #0x4a
	ldrh r3, [r2]
	adds r4, r3, #1
	adds r5, r4, #0
	strh r5, [r2]
	lsls r3, r3, #0x10
	asrs r2, r3, #0x10
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08072FBC @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072FBC @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4a
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08072FB0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08072FB0:
	add sp, #0x18
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072FB8: .4byte 0x083FC508
_08072FBC: .4byte 0x03002870
