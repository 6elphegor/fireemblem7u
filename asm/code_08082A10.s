	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawHelpBoxSaveMenuStats
DrawHelpBoxSaveMenuStats: @ 0x08082A10
	push {r4, r5, r6, r7, lr}
	ldr r7, _08082A6C @ =0x0202BBF8
	adds r5, r7, #0
	adds r5, #0x2b
	movs r0, #1
	ldrb r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _08082AC8
	bl GetTacticianName
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r0, #0
	bne _08082A7C
	ldr r4, _08082A70 @ =0x0203E6B8
	ldr r5, _08082A74 @ =0x0000127C
	adds r0, r5, #0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x50
	movs r2, #7
	bl Text_InsertDrawString
	ldr r0, _08082A78 @ =0x0000127E
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #7
	bl Text_InsertDrawString
	b _08082AC8
	.align 2, 0
_08082A6C: .4byte 0x0202BBF8
_08082A70: .4byte 0x0203E6B8
_08082A74: .4byte 0x0000127C
_08082A78: .4byte 0x0000127E
_08082A7C:
	ldr r4, _08082AD0 @ =0x0203E6B8
	ldr r1, _08082AD4 @ =0x081C3AC0
	ldrb r5, [r5]
	lsrs r0, r5, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl TactGetMsg_Affin
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r7, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl TactGetMsg_Gender
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x8a
	movs r2, #7
	adds r3, r6, #0
	bl Text_InsertDrawString
_08082AC8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082AD0: .4byte 0x0203E6B8
_08082AD4: .4byte 0x081C3AC0
