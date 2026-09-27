	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUiFrame2
DrawUiFrame2: @ 0x08049CE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	str r0, [sp]
	mov sb, r1
	ldr r0, [sp, #0x50]
	ldr r1, _08049F4C @ =0x08B9A824
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r0, [sp]
	adds r2, r0, r2
	subs r2, #1
	str r2, [sp, #4]
	add r3, sb
	subs r3, #1
	str r3, [sp, #8]
	mov r4, sb
	adds r4, #1
	cmp r4, r3
	bge _08049D8E
	ldr r1, _08049F50 @ =0x02023460
	mov sl, r1
_08049D18:
	ldr r7, [sp]
	adds r7, #1
	adds r2, r4, #2
	mov r8, r2
	ldr r0, [sp, #4]
	cmp r7, r0
	bge _08049D86
	ldr r1, _08049F54 @ =0x02022C60
	mov ip, r1
	movs r5, #0
	mov r3, sl
_08049D2E:
	lsls r0, r4, #5
	adds r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #1
	mov r1, ip
	adds r1, r2, r1
	strh r5, [r1]
	adds r2, r2, r3
	ldrh r1, [r6, #0xa]
	strh r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #1
	mov r1, ip
	adds r1, r2, r1
	strh r5, [r1]
	adds r2, r2, r3
	ldrh r1, [r6, #0xc]
	strh r1, [r2]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #1
	mov r1, ip
	adds r1, r2, r1
	strh r5, [r1]
	adds r2, r2, r3
	ldrh r1, [r6, #0x12]
	strh r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	mov r2, ip
	adds r1, r0, r2
	strh r5, [r1]
	adds r0, r0, r3
	ldrh r1, [r6, #0x14]
	strh r1, [r0]
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _08049D2E
_08049D86:
	mov r4, r8
	ldr r1, [sp, #8]
	cmp r4, r1
	blt _08049D18
_08049D8E:
	ldr r7, [sp]
	adds r7, #1
	mov r2, sb
	adds r2, #1
	str r2, [sp, #0xc]
	mov r4, sb
	lsls r4, r4, #5
	str r4, [sp, #0x10]
	ldr r0, [sp, #8]
	lsls r0, r0, #5
	str r0, [sp, #0x14]
	ldr r1, [sp, #4]
	cmp r7, r1
	bge _08049E3E
	adds r5, r4, #0
	adds r5, #1
	adds r3, r0, #0
	adds r3, #1
	lsls r2, r7, #1
	ldr r4, [sp, #8]
	lsls r0, r4, #6
	ldr r4, _08049F50 @ =0x02023460
	adds r1, r0, r4
	adds r1, r2, r1
	str r1, [sp, #0x1c]
	ldr r1, _08049F54 @ =0x02022C60
	adds r0, r0, r1
	adds r0, r0, r2
	mov sl, r0
	mov r4, sb
	lsls r0, r4, #6
	ldr r4, _08049F50 @ =0x02023460
	adds r1, r0, r4
	adds r1, r1, r2
	mov sb, r1
	ldr r1, _08049F54 @ =0x02022C60
	adds r0, r0, r1
	adds r0, r0, r2
	mov r8, r0
	lsls r3, r3, #1
	adds r0, r3, r4
	adds r0, r0, r2
	mov ip, r0
	adds r3, r3, r1
	adds r1, r2, r3
	lsls r5, r5, #1
	adds r4, r5, r4
	str r4, [sp, #0x24]
	adds r3, r2, r4
	ldr r0, _08049F54 @ =0x02022C60
	adds r5, r5, r0
	adds r2, r2, r5
_08049DF6:
	movs r0, #0
	mov r4, r8
	strh r0, [r4]
	ldrh r0, [r6, #2]
	mov r4, sb
	strh r0, [r4]
	movs r0, #0
	strh r0, [r2]
	ldrh r0, [r6, #4]
	strh r0, [r3]
	movs r0, #0
	mov r4, sl
	strh r0, [r4]
	ldrh r0, [r6, #0x1a]
	ldr r4, [sp, #0x1c]
	strh r0, [r4]
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r6, #0x1c]
	mov r4, ip
	strh r0, [r4]
	ldr r0, [sp, #0x1c]
	adds r0, #4
	str r0, [sp, #0x1c]
	movs r4, #4
	add sl, r4
	add sb, r4
	add r8, r4
	add ip, r4
	adds r1, #4
	adds r3, #4
	adds r2, #4
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _08049DF6
_08049E3E:
	ldr r4, [sp, #0xc]
	ldr r1, [sp, #8]
	cmp r4, r1
	bge _08049ED4
	movs r2, #0
	mov sl, r2
	ldr r5, _08049F50 @ =0x02023460
	lsls r2, r4, #5
	adds r2, #0x20
	ldr r7, [sp, #4]
	adds r7, r2, r7
	str r7, [sp, #0x18]
	ldr r0, [sp]
	adds r2, r2, r0
	lsls r3, r4, #6
	ldr r1, [sp, #4]
	lsls r0, r1, #1
	adds r1, r0, r5
	adds r1, r1, r3
	mov sb, r1
	ldr r7, _08049F54 @ =0x02022C60
	adds r0, r0, r7
	adds r0, r0, r3
	mov r8, r0
	ldr r1, [sp]
	lsls r0, r1, #1
	adds r1, r0, r5
	adds r1, r1, r3
	mov ip, r1
	adds r0, r0, r7
	adds r3, r3, r0
	lsls r2, r2, #1
	adds r7, r2, r5
	str r7, [sp, #0x2c]
	ldr r0, _08049F54 @ =0x02022C60
	adds r2, r2, r0
	ldr r1, [sp, #0x18]
	lsls r1, r1, #1
	str r1, [sp, #0x20]
	adds r5, r1, r5
	adds r1, r1, r0
_08049E90:
	mov r7, sl
	strh r7, [r3]
	ldrh r0, [r6, #8]
	mov r7, ip
	strh r0, [r7]
	mov r7, sl
	mov r0, r8
	strh r7, [r0]
	ldrh r0, [r6, #0xe]
	mov r7, sb
	strh r0, [r7]
	mov r0, sl
	strh r0, [r2]
	ldrh r0, [r6, #0x10]
	ldr r7, [sp, #0x2c]
	strh r0, [r7]
	mov r0, sl
	strh r0, [r1]
	ldrh r0, [r6, #0x16]
	strh r0, [r5]
	adds r5, #0x80
	adds r1, #0x80
	adds r7, #0x80
	str r7, [sp, #0x2c]
	adds r2, #0x80
	movs r0, #0x80
	add sb, r0
	add r8, r0
	add ip, r0
	adds r3, #0x80
	adds r4, #2
	ldr r7, [sp, #8]
	cmp r4, r7
	blt _08049E90
_08049ED4:
	ldr r0, [sp, #0x10]
	ldr r1, [sp]
	adds r5, r0, r1
	lsls r5, r5, #1
	ldr r2, _08049F54 @ =0x02022C60
	adds r0, r5, r2
	movs r7, #0
	strh r7, [r0]
	ldr r4, [sp, #0x10]
	ldr r0, [sp, #4]
	adds r3, r4, r0
	lsls r3, r3, #1
	adds r0, r3, r2
	strh r7, [r0]
	ldr r4, [sp, #0x14]
	adds r2, r4, r1
	lsls r2, r2, #1
	ldr r1, _08049F54 @ =0x02022C60
	adds r0, r2, r1
	strh r7, [r0]
	ldr r0, [sp, #4]
	adds r1, r4, r0
	lsls r1, r1, #1
	ldr r4, _08049F54 @ =0x02022C60
	adds r0, r1, r4
	strh r7, [r0]
	ldr r7, _08049F50 @ =0x02023460
	adds r5, r5, r7
	ldrh r0, [r6]
	strh r0, [r5]
	adds r3, r3, r7
	ldrh r0, [r6, #6]
	strh r0, [r3]
	adds r2, r2, r7
	ldrh r0, [r6, #0x18]
	strh r0, [r2]
	adds r1, r1, r7
	ldrh r0, [r6, #0x1e]
	strh r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	bl EnableBgSync
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049F4C: .4byte 0x08B9A824
_08049F50: .4byte 0x02023460
_08049F54: .4byte 0x02022C60
