	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807FBF0
sub_0807FBF0: @ 0x0807FBF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0807FD00 @ =0x0200310C
	ldr r0, [r5, #0xc]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl GetPidStats
	adds r4, r0, #0
	cmp r4, #0
	beq _0807FCF6
	ldr r1, _0807FD04 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	ldr r0, _0807FD08 @ =0x0202BBF8
	ldrb r1, [r0, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	bl IsFirstPlaythrough
	cmp r0, #1
	beq _0807FCF6
	ldr r1, [r5, #0xc]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0807FCF6
	ldrh r1, [r4, #0xc]
	lsls r0, r1, #0x12
	lsrs r6, r0, #0x14
	ldr r1, _0807FD0C @ =0x000003E7
	cmp r6, r1
	ble _0807FC4A
	adds r6, r1, #0
_0807FC4A:
	movs r0, #3
	ldrb r2, [r4, #0xc]
	ands r0, r2
	lsls r7, r0, #8
	ldrb r0, [r4, #0xb]
	orrs r7, r0
	cmp r7, r1
	ble _0807FC5C
	adds r7, r1, #0
_0807FC5C:
	ldrb r4, [r4]
	mov r8, r4
	movs r1, #0x94
	lsls r1, r1, #1
	adds r5, r5, r1
	adds r0, r5, #0
	bl ClearText
	ldr r0, _0807FD10 @ =0x000012AB
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _0807FD14 @ =0x000012AC
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x2e
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _0807FD18 @ =0x000012AD
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x56
	movs r2, #3
	bl Text_InsertDrawString
	ldr r4, _0807FD1C @ =0x020035BE
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	adds r0, r6, #0
	bl CountDigits
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
	adds r0, r7, #0
	bl CountDigits
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0xc
	adds r0, r0, r1
	movs r1, #2
	adds r2, r7, #0
	bl PutNumber
	mov r0, r8
	bl CountDigits
	lsls r0, r0, #1
	adds r4, #0x16
	adds r0, r0, r4
	movs r1, #2
	mov r2, r8
	bl PutNumber
	ldr r0, _0807FD20 @ =0x02003FBC
	ldr r1, _0807FD24 @ =0x083FD5C4
	movs r2, #0x83
	lsls r2, r2, #5
	bl TmApplyTsa_thm
_0807FCF6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FD00: .4byte 0x0200310C
_0807FD04: .4byte 0x0202BBB8
_0807FD08: .4byte 0x0202BBF8
_0807FD0C: .4byte 0x000003E7
_0807FD10: .4byte 0x000012AB
_0807FD14: .4byte 0x000012AC
_0807FD18: .4byte 0x000012AD
_0807FD1C: .4byte 0x020035BE
_0807FD20: .4byte 0x02003FBC
_0807FD24: .4byte 0x083FD5C4
