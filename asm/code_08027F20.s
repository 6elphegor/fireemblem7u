	.include "macro.inc"

	.syntax unified

	thumb_func_start TorchSelect_OnIdle
TorchSelect_OnIdle: @ 0x08027F20
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08027F80 @ =0x0202BBB8
	movs r0, #0x14
	ldrsh r2, [r5, r0]
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	ldr r1, _08027F84 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r4, [r0]
	bl HandlePlayerMapCursor
	ldr r0, _08027F88 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08027FB0
	cmp r4, #0
	beq _08027F9C
	ldr r0, _08027F8C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027F64
	ldr r0, _08027F90 @ =0x0000038A
	bl m4aSongNumStart
_08027F64:
	adds r0, r6, #0
	bl Proc_Break
	ldr r1, _08027F94 @ =0x0203A85C
	ldrh r0, [r5, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r5, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _08027F98 @ =0x03004690
	ldr r0, [r0]
	bl SetStaffUseAction
	b _08027FF6
	.align 2, 0
_08027F80: .4byte 0x0202BBB8
_08027F84: .4byte 0x0202E3E8
_08027F88: .4byte 0x08B857F8
_08027F8C: .4byte 0x0202BBF8
_08027F90: .4byte 0x0000038A
_08027F94: .4byte 0x0203A85C
_08027F98: .4byte 0x03004690
_08027F9C:
	ldr r0, _08027FFC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027FB0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08027FB0:
	ldr r0, _08028000 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08027FE6
	ldr r0, _08028004 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08027FFC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027FE6
	ldr r0, _08028008 @ =0x0000038B
	bl m4aSongNumStart
_08027FE6:
	ldr r1, _0802800C @ =0x0202BBB8
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl PutMapCursor
_08027FF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027FFC: .4byte 0x0202BBF8
_08028000: .4byte 0x08B857F8
_08028004: .4byte 0x02023C60
_08028008: .4byte 0x0000038B
_0802800C: .4byte 0x0202BBB8
