	.include "macro.inc"

	.syntax unified

	thumb_func_start Debug_GetChapterId
Debug_GetChapterId: @ 0x0801BF54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r1, #0
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	movs r2, #0x2a
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0801C01C @ =0x02022C60
	mov r8, r1
	add r0, r8
	movs r1, #8
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _0801C020 @ =0x0202BBF8
	adds r7, r6, #0
	adds r7, #0x2b
	movs r0, #1
	ldrb r2, [r7]
	ands r0, r2
	cmp r0, #0
	beq _0801C028
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldrb r0, [r7]
	lsrs r3, r0, #4
	adds r3, #1
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #0
	bl Text_InsertDrawNumberOrBlank
	ldrh r1, [r6, #0x2c]
	lsls r3, r1, #0x13
	lsrs r3, r3, #0x17
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldrh r6, [r6, #0x2c]
	lsls r0, r6, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	adds r3, r0, #0
	cmp r3, #0xa
	ble _0801BFD2
	movs r3, #0xa
_0801BFD2:
	adds r0, r4, #0
	movs r1, #0x58
	movs r2, #3
	bl Text_InsertDrawNumberOrBlank
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, r8
	adds r0, r4, #0
	bl PutText
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	adds r0, #1
	movs r2, #0x2a
	ldrsh r1, [r5, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	ldr r2, _0801C024 @ =0x081C3AC0
	ldrb r7, [r7]
	lsrs r1, r7, #4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _0801C05A
	.align 2, 0
_0801C01C: .4byte 0x02022C60
_0801C020: .4byte 0x0202BBF8
_0801C024: .4byte 0x081C3AC0
_0801C028:
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, _0801C06C @ =0x00001290
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #1
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, r8
	adds r0, r4, #0
	bl PutText
_0801C05A:
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801C06C: .4byte 0x00001290
