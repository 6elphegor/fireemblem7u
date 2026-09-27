	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateMenuItemPanel
UpdateMenuItemPanel: @ 0x0801DFC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0801E03C @ =0x08B936EC
	bl Proc_Find
	adds r7, r0, #0
	movs r0, #0
	bl GetBgTilemap
	adds r4, r7, #0
	adds r4, #0x30
	ldrb r2, [r4]
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r3, #0x31
	adds r3, r3, r7
	mov r8, r3
	ldrb r2, [r3]
	lsls r1, r2, #6
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r7, #0
	adds r6, #0x34
	ldr r3, [r7, #0x2c]
	mov sb, r3
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r6, #0
	bl ClearText
	adds r0, r7, #0
	adds r0, #0x3c
	bl ClearText
	adds r0, r7, #0
	adds r0, #0x44
	bl ClearText
	ldrb r0, [r4]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #0xe
	movs r3, #8
	bl DrawUiFrame2
	cmp r5, #0
	blt _0801E058
	cmp r5, #4
	ble _0801E040
	cmp r5, #5
	beq _0801E04C
	b _0801E058
	.align 2, 0
_0801E03C: .4byte 0x08B936EC
_0801E040:
	lsls r1, r5, #1
	mov r0, sb
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	b _0801E05C
_0801E04C:
	ldr r0, _0801E054 @ =0x0202BBB8
	ldrh r4, [r0, #0x2c]
	b _0801E05C
	.align 2, 0
_0801E054: .4byte 0x0202BBB8
_0801E058:
	adds r4, r5, #0
	movs r5, #8
_0801E05C:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #9
	beq _0801E078
	cmp r0, #9
	bgt _0801E070
	cmp r0, #4
	beq _0801E078
	b _0801E11C
_0801E070:
	cmp r0, #0xc
	bgt _0801E11C
	cmp r0, #0xb
	blt _0801E11C
_0801E078:
	adds r0, r4, #0
	bl GetItemUseDescId
	bl DecodeMsg
	adds r4, r0, #0
	movs r5, #0
	ldr r7, [sp, #4]
	adds r7, #0x42
	movs r3, #8
	adds r3, r3, r6
	mov r8, r3
	ldr r0, [sp, #4]
	adds r0, #0xc2
	mov sb, r0
	movs r1, #0x10
	adds r1, r1, r6
	mov sl, r1
	b _0801E0A2
_0801E09E:
	adds r4, #1
	adds r5, #1
_0801E0A2:
	lsls r0, r5, #3
	adds r0, r6, r0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	bl GetStringLineEnd
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801E09E
	ldr r3, _0801E114 @ =0x0203A3F0
	ldr r2, _0801E118 @ =0x0203A470
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	bl PutText
	mov r0, r8
	mov r1, sb
	bl PutText
	ldr r2, [sp, #4]
	movs r3, #0xa1
	lsls r3, r3, #1
	adds r1, r2, r3
	mov r0, sl
	bl PutText
	b _0801E294
	.align 2, 0
_0801E114: .4byte 0x0203A3F0
_0801E118: .4byte 0x0203A470
_0801E11C:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	mov r0, sb
	bl BattleGenerateUiStats
	cmp r5, #8
	bne _0801E15E
	ldr r3, _0801E2AC @ =0x0203A470
	ldr r2, _0801E2B0 @ =0x0203A3F0
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
_0801E15E:
	ldr r0, _0801E2B0 @ =0x0203A3F0
	mov r8, r0
	movs r1, #0x48
	add r1, r8
	mov sl, r1
	ldrh r1, [r1]
	mov r0, sb
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r2, #1
	mov sb, r2
	cmp r0, #0
	beq _0801E17E
	movs r3, #2
	mov sb, r3
_0801E17E:
	ldr r0, _0801E2B4 @ =0x00001101
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, r6, #0
	adds r5, #8
	ldr r0, _0801E2B8 @ =0x00001103
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, r6, #0
	adds r4, #0x10
	ldr r0, _0801E2BC @ =0x00001104
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _0801E2C0 @ =0x0000110D
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _0801E2C4 @ =0x00001105
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2c
	movs r2, #0
	bl Text_InsertDrawString
	mov r0, r8
	adds r0, #0x5a
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x1e
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	mov r0, r8
	adds r0, #0x60
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r4, #0
	movs r1, #0x1e
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	mov r0, r8
	adds r0, #0x66
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x54
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	mov r0, r8
	adds r0, #0x62
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r4, #0
	movs r1, #0x54
	mov r2, sb
	bl Text_InsertDrawNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x34
	adds r6, r7, #0
	adds r6, #0x31
	ldrb r1, [r6]
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r5, r7, #0
	adds r5, #0x30
	ldrb r3, [r5]
	adds r1, r3, r1
	lsls r1, r1, #1
	ldr r4, _0801E2C8 @ =0x02022C60
	adds r1, r1, r4
	bl PutText
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r1, [r6]
	adds r1, #3
	lsls r1, r1, #5
	adds r1, #1
	ldrb r2, [r5]
	adds r1, r2, r1
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
	adds r0, r7, #0
	adds r0, #0x44
	ldrb r1, [r6]
	adds r1, #5
	lsls r1, r1, #5
	adds r1, #1
	ldrb r5, [r5]
	adds r1, r5, r1
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
	ldr r4, [sp, #4]
	adds r4, #0x4e
	mov r3, sl
	ldrh r0, [r3]
	bl GetItemType
	adds r1, r0, #0
	adds r1, #0x70
	ldr r0, [sp, #8]
	lsls r2, r0, #0xc
	adds r0, r4, #0
	bl PutIcon
_0801E294:
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E2AC: .4byte 0x0203A470
_0801E2B0: .4byte 0x0203A3F0
_0801E2B4: .4byte 0x00001101
_0801E2B8: .4byte 0x00001103
_0801E2BC: .4byte 0x00001104
_0801E2C0: .4byte 0x0000110D
_0801E2C4: .4byte 0x00001105
_0801E2C8: .4byte 0x02022C60
