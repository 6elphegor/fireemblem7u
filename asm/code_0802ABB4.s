	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802ABB4
sub_0802ABB4: @ 0x0802ABB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	movs r1, #0x90
	lsls r1, r1, #7
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #6
	movs r2, #8
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl EnableSysBrownBox
	ldr r3, _0802AC9C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	movs r6, #6
	strb r6, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0802ACA0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0802ACA4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	mov r1, r8
	ldr r0, [r1, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	movs r4, #0x30
	subs r0, r4, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r3, r0, #1
	ldr r5, _0802ACA8 @ =0x02022C60
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl PutDrawText
	mov r2, r8
	ldr r0, [r2, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r3, r4, #1
	adds r5, #0x30
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AC9C: .4byte 0x03002870
_0802ACA0: .4byte 0x0000FFE0
_0802ACA4: .4byte 0x0000E0FF
_0802ACA8: .4byte 0x02022C60
