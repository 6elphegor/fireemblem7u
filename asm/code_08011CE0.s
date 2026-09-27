	.include "macro.inc"

	.syntax unified

	thumb_func_start EventEA_StartMixPalette
EventEA_StartMixPalette: @ 0x08011CE0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r7, [r0, #8]
	ldr r4, [r0, #0xc]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08011D00
	movs r0, #0
	b _08011D1A
_08011D00:
	movs r1, #0xff
	adds r2, r4, #0
	ands r2, r1
	asrs r3, r4, #0x10
	ands r3, r1
	asrs r0, r4, #0x18
	ands r0, r1
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	bl StartMixPalette
_08011D1A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08011D24
sub_08011D24: @ 0x08011D24
	push {lr}
	bl EndMixPalette
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_08011D30
sub_08011D30: @ 0x08011D30
	movs r0, #0
	bx lr

	thumb_func_start EventLoadUnit
EventLoadUnit: @ 0x08011D34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r7, [sp, #0x24]
	ldr r5, [sp, #0x2c]
	movs r0, #0
	str r0, [sp]
	ldr r4, _08011DA4 @ =0x030041D0
	ldr r2, _08011DA8 @ =0x01000004
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	movs r0, #3
	ands r5, r0
	lsls r5, r5, #1
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r1, [r4, #3]
	ands r0, r1
	orrs r0, r5
	movs r1, #7
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #3]
	strb r6, [r4]
	mov r0, r8
	strb r0, [r4, #1]
	mov r1, sb
	strb r1, [r4, #4]
	mov r0, sl
	strb r0, [r4, #5]
	strb r7, [r4, #6]
	add r1, sp, #0x28
	ldrb r1, [r1]
	strb r1, [r4, #7]
	adds r0, r4, #0
	ldr r1, [sp, #0x30]
	bl LoadUnitCore
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011DA4: .4byte 0x030041D0
_08011DA8: .4byte 0x01000004

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

	thumb_func_start sub_08011E28
sub_08011E28: @ 0x08011E28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, [r7, #0x54]
	ldrb r0, [r1]
	cmp r0, #0
	bne _08011E46
	adds r0, r7, #0
	bl Proc_End
	b _08011EEE
_08011E46:
	ldrb r4, [r1, #6]
	str r4, [r7, #0x2c]
	ldrb r3, [r1, #7]
	str r3, [r7, #0x30]
	ldr r6, _08011F00 @ =0x0202E3DC
	ldr r1, [r6]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08011EE4
	movs r0, #0xff
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	mov sl, r1
	mov r2, sl
	str r2, [sp]
	ldr r2, _08011F04 @ =0x08BE3888
	adds r0, r4, #0
	adds r1, r3, #0
	bl GenerateExtendedMovementMap
	movs r5, #0
	ldr r0, _08011F08 @ =0x0202E3D8
	movs r3, #2
	ldrsh r1, [r0, r3]
	cmp r5, r1
	bge _08011EDC
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #8]
	str r1, [sp, #4]
_08011E8C:
	movs r3, #0
	adds r6, r5, #1
	mov ip, r6
	ldr r0, [sp, #8]
	cmp r3, r0
	bge _08011ED4
	ldr r1, _08011F0C @ =0x0202E3E4
	ldr r0, [r1]
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r2, _08011F08 @ =0x0202E3D8
	movs r6, #0
	ldrsh r4, [r2, r6]
	ldr r0, _08011F00 @ =0x0202E3DC
	mov r8, r0
_08011EAE:
	ldr r2, [sp, #0xc]
	adds r0, r2, r3
	ldrb r2, [r0]
	cmp sb, r2
	ble _08011ECE
	mov r6, r8
	ldr r0, [r6]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08011ECE
	mov sb, r2
	str r3, [sp]
	mov sl, r5
_08011ECE:
	adds r3, #1
	cmp r3, r4
	blt _08011EAE
_08011ED4:
	mov r5, ip
	ldr r0, [sp, #4]
	cmp r5, r0
	blt _08011E8C
_08011EDC:
	ldr r1, [sp]
	str r1, [r7, #0x2c]
	mov r2, sl
	str r2, [r7, #0x30]
_08011EE4:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	adds r0, r7, #0
	bl EnsureCameraOntoPosition
_08011EEE:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011F00: .4byte 0x0202E3DC
_08011F04: .4byte 0x08BE3888
_08011F08: .4byte 0x0202E3D8
_08011F0C: .4byte 0x0202E3E4

	thumb_func_start sub_08011F10
sub_08011F10: @ 0x08011F10
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #1
	bl StartEventWarpAnim
	add r1, sp, #4
	adds r0, r5, #0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, #4
	adds r1, r2, #0
	ldr r0, [r4, #0x2c]
	strb r0, [r1, #6]
	strb r0, [r2, #4]
	ldr r0, [r4, #0x30]
	strb r0, [r1, #7]
	strb r0, [r2, #5]
	adds r0, r1, #0
	bl LoadUnit
	adds r5, #0x10
	str r5, [r4, #0x54]
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EvtCmd_WarpLoadUnits
EvtCmd_WarpLoadUnits: @ 0x08011F58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08011FA4 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08011FA8 @ =0x08B92414
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r2, #0x54]
	movs r3, #0
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08011F94
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08011F96
_08011F94:
	movs r3, #1
_08011F96:
	adds r0, r2, #0
	adds r0, #0x64
	strh r3, [r0]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08011FA4: .4byte 0x0202E3F4
_08011FA8: .4byte 0x08B92414
