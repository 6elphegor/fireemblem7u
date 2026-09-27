	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08009DFC
sub_08009DFC: @ 0x08009DFC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, [r5, #0x58]
	adds r3, #1
	str r3, [r5, #0x58]
	movs r1, #0x1e
	rsbs r1, r1, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #0x80
	lsls r0, r0, #1
	bl CheckTalkFlag
	adds r6, r0, #0
	cmp r6, #0
	bne _08009E64
	ldr r3, _08009E78 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #1
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
_08009E64:
	ldr r0, [r5, #0x58]
	cmp r0, #0xc
	bne _08009E70
	adds r0, r5, #0
	bl Proc_Break
_08009E70:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009E78: .4byte 0x03002870
