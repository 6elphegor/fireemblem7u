	.include "macro.inc"

	.syntax unified

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
