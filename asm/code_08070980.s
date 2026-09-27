	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08070980
sub_08070980: @ 0x08070980
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	bl EndAllMus
	bl ResetText
	ldr r0, _08070A74 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070A74 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070A74 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070A74 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08070A78 @ =0x030028AC
	ldr r1, _08070A78 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08070A7C @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08070A78 @ =0x030028AC
	ldr r1, _08070A78 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08070A78 @ =0x030028AC
	ldr r1, _08070A78 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08070A80 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08070A78 @ =0x030028AC
	ldr r1, _08070A78 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08070A74 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070A74 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08070A74 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1d
	movs r3, #0x13
	bl DrawUiFrame2
	movs r0, #0
	str r0, [r7, #4]
_08070A62:
	ldr r0, _08070A84 @ =0x08C9D910
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	bne _08070A88
	b _08070ABC
	.align 2, 0
_08070A74: .4byte 0x03002870
_08070A78: .4byte 0x030028AC
_08070A7C: .4byte 0x0000FFE0
_08070A80: .4byte 0x0000E0FF
_08070A84: .4byte 0x08C9D910
_08070A88:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	lsls r1, r0, #5
	adds r0, r1, #0
	lsls r1, r0, #1
	ldr r2, _08070AB4 @ =0x02022C62
	adds r0, r1, r2
	ldr r1, _08070AB8 @ =0x08C9D910
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	bl PutString
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08070A62
	.align 2, 0
_08070AB4: .4byte 0x02022C62
_08070AB8: .4byte 0x08C9D910
_08070ABC:
	movs r0, #0
	str r0, [r7, #4]
_08070AC0:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _08070AC8
	b _08070B52
_08070AC8:
	movs r0, #0
	str r0, [r7, #8]
_08070ACC:
	ldr r0, [r7, #8]
	cmp r0, #1
	ble _08070AD4
	b _08070B4A
_08070AD4:
	ldr r0, _08070B30 @ =0x08C9D938
	ldr r1, [r7, #8]
	movs r2, #0x64
	muls r1, r2, r1
	adds r2, r1, #0
	adds r2, #8
	ldr r1, [r0]
	adds r0, r2, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r2, r1, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r1, _08070B34 @ =0x08C9D8C0
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #3
	adds r1, r1, r2
	ldrb r2, [r1]
	adds r1, r2, #0
	bl InitTextDb
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7, #8]
	cmp r1, r0
	bne _08070B38
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7, #4]
	cmp r1, r0
	bne _08070B38
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	movs r2, #0
	bl sub_08070324
	b _08070B42
	.align 2, 0
_08070B30: .4byte 0x08C9D938
_08070B34: .4byte 0x08C9D8C0
_08070B38:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	movs r2, #1
	bl sub_08070324
_08070B42:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08070ACC
_08070B4A:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08070AC0
_08070B52:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
