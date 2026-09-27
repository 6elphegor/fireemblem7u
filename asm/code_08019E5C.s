	.include "macro.inc"

	.syntax unified

	thumb_func_start BuildBestMoveScript
BuildBestMoveScript: @ 0x08019E5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	mov sb, r1
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0
	mov ip, r0
	ldr r1, _08019EAC @ =0x030041E0
	ldr r0, [r1]
	mov r3, sb
	lsls r2, r3, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08019E8E
	b _08019FF2
_08019E8E:
	mov r4, sp
	add r7, sp, #4
	mov sl, r7
	mov r8, r2
_08019E96:
	ldr r0, _08019EB0 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	cmp r6, r0
	bne _08019EB4
	movs r0, #0xff
	ldrb r3, [r4]
	orrs r0, r3
	b _08019EBE
	.align 2, 0
_08019EAC: .4byte 0x030041E0
_08019EB0: .4byte 0x0202E3D8
_08019EB4:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
_08019EBE:
	strb r0, [r4]
	cmp r6, #0
	bne _08019ECC
	ldrb r0, [r4, #1]
	movs r7, #0xff
	orrs r0, r7
	b _08019ED8
_08019ECC:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
_08019ED8:
	strb r0, [r4, #1]
	ldr r2, _08019EF0 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r0, #1
	cmp sb, r0
	bne _08019EF4
	ldrb r0, [r4, #3]
	movs r7, #0xff
	orrs r0, r7
	b _08019EFE
	.align 2, 0
_08019EF0: .4byte 0x0202E3D8
_08019EF4:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
_08019EFE:
	strb r0, [r4, #3]
	mov r0, sb
	cmp r0, #0
	bne _08019F0E
	ldrb r0, [r4, #2]
	movs r1, #0xff
	orrs r0, r1
	b _08019F1A
_08019F0E:
	ldr r0, [r1]
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
_08019F1A:
	strb r0, [r4, #2]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r7, #0
	movs r2, #0
	ldr r3, [sp, #8]
	adds r3, #1
	str r3, [sp, #0x10]
_08019F2A:
	mov r3, sp
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _08019F36
	adds r1, r0, #0
_08019F36:
	adds r2, #1
	cmp r2, #3
	ble _08019F2A
	movs r2, #0
	adds r5, r1, #0
	add r3, sp, #4
_08019F42:
	mov r1, sp
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r5, r0
	bne _08019F60
	adds r1, r7, #0
	lsls r0, r1, #0x10
	movs r7, #0x80
	lsls r7, r7, #9
	adds r0, r0, r7
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r3, r1
	strb r2, [r1]
_08019F60:
	adds r2, #1
	cmp r2, #3
	ble _08019F42
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08019F86
	cmp r0, #2
	bgt _08019F78
	cmp r0, #1
	beq _08019F82
	b _08019F9A
_08019F78:
	cmp r0, #3
	beq _08019F8A
	cmp r0, #4
	beq _08019F8E
	b _08019F9A
_08019F82:
	mov r0, sl
	b _08019F96
_08019F86:
	movs r0, #2
	b _08019F90
_08019F8A:
	movs r0, #3
	b _08019F90
_08019F8E:
	movs r0, #4
_08019F90:
	bl RandNext
	add r0, sl
_08019F96:
	ldrb r0, [r0]
	mov ip, r0
_08019F9A:
	mov r2, ip
	ldr r1, [sp, #8]
	strb r2, [r1]
	ldr r3, [sp, #0x10]
	str r3, [sp, #8]
	mov r0, ip
	cmp r0, #1
	beq _08019FC2
	cmp r0, #1
	bgt _08019FB4
	cmp r0, #0
	beq _08019FBE
	b _08019FDC
_08019FB4:
	cmp r0, #2
	beq _08019FD0
	cmp r0, #3
	beq _08019FC6
	b _08019FDC
_08019FBE:
	adds r6, #1
	b _08019FDC
_08019FC2:
	subs r6, #1
	b _08019FDC
_08019FC6:
	movs r7, #4
	add r8, r7
	movs r0, #1
	add sb, r0
	b _08019FDC
_08019FD0:
	movs r1, #4
	rsbs r1, r1, #0
	add r8, r1
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
_08019FDC:
	ldr r1, _0801A00C @ =0x030041E0
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08019FF2
	b _08019E96
_08019FF2:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl RevertMovementScript
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A00C: .4byte 0x030041E0
