	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040ED8
sub_08040ED8: @ 0x08040ED8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov sb, r0
	movs r0, #0
	mov sl, r0
	mov r0, sb
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08040F08
	ldr r0, _08041044 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08040F08
	movs r0, #0x7c
	bl m4aSongNumStart
_08040F08:
	mov r1, sb
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _08040F1E
	movs r0, #0
	strh r0, [r1]
_08040F1E:
	mov r4, sb
	adds r4, #0x64
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #4
	bgt _08040F5E
	ldr r2, _08041048 @ =0x08B99084
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x14
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0x28
	bl SioEmitData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r3, sb
	str r0, [r3, #0x58]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	ldr r1, _0804104C @ =0x0203D90C
	ldr r0, _08041050 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x9c
	adds r0, r0, r1
	strb r2, [r0]
_08040F5E:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _08041034
	add r6, sp, #0x24
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08040FF0
	ldrb r0, [r6]
	lsls r4, r0, #6
	adds r4, #1
	ldr r1, _0804104C @ =0x0203D90C
	mov r8, r1
	mov r7, r8
	adds r7, #0x9c
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r0, r4
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	mov r0, sp
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_08040DCC
	ldrb r3, [r6]
	adds r0, r3, r7
	ldrb r0, [r0]
	adds r4, r0, r4
	strb r4, [r5, #0xb]
	ldrb r1, [r6]
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040FD0
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r1, _08041054 @ =0x0203DC9C
	ldrb r3, [r6]
	lsls r2, r3, #1
	adds r1, #0x24
	adds r2, r2, r1
	strh r0, [r2]
_08040FD0:
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, r8
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08040FE6
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_08040FE6:
	ldrb r6, [r6]
	adds r1, r6, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08040FF0:
	movs r4, #0
	ldr r5, _08041058 @ =0x0203D9A8
_08040FF4:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041014
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #4
	bhi _08041014
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_08041014:
	adds r4, #1
	cmp r4, #3
	ble _08040FF4
	mov r0, sl
	cmp r0, #0
	bne _08041034
	ldr r0, _08041050 @ =0x08B98AEC
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	mov r0, sb
	bl Proc_Break
_08041034:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041044: .4byte 0x0202BBF8
_08041048: .4byte 0x08B99084
_0804104C: .4byte 0x0203D90C
_08041050: .4byte 0x08B98AEC
_08041054: .4byte 0x0203DC9C
_08041058: .4byte 0x0203D9A8
