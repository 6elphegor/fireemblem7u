	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F1A8
sub_0803F1A8: @ 0x0803F1A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r6, #0
	adds r4, r0, #0
	adds r4, #0x31
	ldr r1, _0803F284 @ =0x0203DA10
	mov r8, r1
	adds r7, r0, #0
	adds r7, #0x30
_0803F1C2:
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	bl ClearText
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	movs r1, #0
	bl Text_SetColor
	movs r2, #0
	lsls r3, r6, #4
	mov sb, r3
	lsls r0, r6, #1
	mov sl, r0
	adds r1, r6, #1
	str r1, [sp]
_0803F1F2:
	mov r3, sb
	subs r0, r3, r6
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _0803F288 @ =0x081D516A
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #6
	ldr r1, _0803F28C @ =0x081D3C0C
	adds r5, r0, r1
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F24C
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r5, #0x30]
	str r2, [sp, #4]
	bl Text_SetCursor
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	ldrb r3, [r7]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r1, [r1]
	bl Text_DrawString
	ldr r2, [sp, #4]
_0803F24C:
	adds r2, #1
	cmp r2, #0xe
	ble _0803F1F2
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	mov r1, sl
	adds r1, #9
	lsls r1, r1, #6
	ldr r2, _0803F290 @ =0x02023460
	adds r1, r1, r2
	bl PutText
	ldr r6, [sp]
	cmp r6, #4
	ble _0803F1C2
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F284: .4byte 0x0203DA10
_0803F288: .4byte 0x081D516A
_0803F28C: .4byte 0x081D3C0C
_0803F290: .4byte 0x02023460
