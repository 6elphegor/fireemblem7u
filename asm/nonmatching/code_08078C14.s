	.include "macro.inc"

	.syntax unified

	thumb_func_start StartAvailableTileEvent
StartAvailableTileEvent: @ 0x08078C14
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08078C58 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl sub_0807812C
	cmp r0, #0
	bne _08078C44
	b _08078DF2
_08078C44:
	ldr r0, [sp, #0xc]
	cmp r0, #0x1d
	bls _08078C4C
	b _08078DF2
_08078C4C:
	lsls r0, r0, #2
	ldr r1, _08078C5C @ =_08078C60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078C58: .4byte 0x0202BBF8
_08078C5C: .4byte _08078C60
_08078C60: @ jump table
	.4byte _08078DF0 @ case 0
	.4byte _08078DF2 @ case 1
	.4byte _08078DF2 @ case 2
	.4byte _08078DF2 @ case 3
	.4byte _08078DF2 @ case 4
	.4byte _08078DF2 @ case 5
	.4byte _08078DF2 @ case 6
	.4byte _08078DF2 @ case 7
	.4byte _08078DF2 @ case 8
	.4byte _08078DF2 @ case 9
	.4byte _08078DF2 @ case 10
	.4byte _08078DF2 @ case 11
	.4byte _08078DF2 @ case 12
	.4byte _08078DF2 @ case 13
	.4byte _08078CD8 @ case 14
	.4byte _08078CD8 @ case 15
	.4byte _08078D08 @ case 16
	.4byte _08078D08 @ case 17
	.4byte _08078D3A @ case 18
	.4byte _08078DBC @ case 19
	.4byte _08078DCC @ case 20
	.4byte _08078DDC @ case 21
	.4byte _08078DEC @ case 22
	.4byte _08078DF2 @ case 23
	.4byte _08078DF2 @ case 24
	.4byte _08078DF2 @ case 25
	.4byte _08078DF2 @ case 26
	.4byte _08078DF2 @ case 27
	.4byte _08078DF2 @ case 28
	.4byte _08078CE6 @ case 29
_08078CD8:
	mov r0, sp
	bl sub_08078100
	ldr r0, [sp, #0x10]
	cmp r0, #3
	beq _08078CE6
	b _08078DF2
_08078CE6:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800F028
_08078D02:
	bl sub_0800ADB8
	b _08078DF2
_08078D08:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _08078D32
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800F028
	ldr r0, [sp, #8]
	bl SetFlag
	b _08078D02
_08078D32:
	mov r0, sp
	bl sub_08078100
	b _08078D02
_08078D3A:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	bne _08078D64
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800F028
	mov r0, sp
	bl sub_08078100
	b _08078DB0
_08078D64:
	cmp r4, #0x76
	beq _08078D8E
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_0800F044
	b _08078DB0
_08078D8E:
	ldr r4, [sp, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_0800F06C
_08078DB0:
	bl sub_0800ADB8
	ldr r0, [sp, #8]
	bl SetFlag
	b _08078DF2
_08078DBC:
	ldr r0, _08078DC8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_080B03D4
	b _08078DF2
	.align 2, 0
_08078DC8: .4byte 0x03004690
_08078DCC:
	ldr r0, _08078DD8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_080B03F4
	b _08078DF2
	.align 2, 0
_08078DD8: .4byte 0x03004690
_08078DDC:
	ldr r0, _08078DE8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_080B0414
	b _08078DF2
	.align 2, 0
_08078DE8: .4byte 0x03004690
_08078DEC:
	mov r8, r8
	b _08078DF2
_08078DF0:
	mov r8, r8
_08078DF2:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
