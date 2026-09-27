	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxMoveControl_OnIdle
HelpBoxMoveControl_OnIdle: @ 0x08081BB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r1, _08081C4C @ =0x0203E694
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	ldr r2, [r5, #0x2c]
	ldrb r3, [r2, #0x10]
	adds r0, r3, r0
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	ldrb r2, [r2, #0x11]
	adds r1, r2, r1
	bl PutUiHand
	ldr r6, _08081C50 @ =0x08B857F8
	ldr r1, [r6]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081BEE
	adds r0, r5, #0
	bl HelpBoxTryRelocateUp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08081BEE:
	ldr r1, [r6]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081C06
	adds r0, r5, #0
	bl HelpBoxTryRelocateDown
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08081C06:
	ldr r1, [r6]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081C1E
	adds r0, r5, #0
	bl HelpBoxTryRelocateLeft
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08081C1E:
	ldr r1, [r6]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081C36
	adds r0, r5, #0
	bl HelpBoxTryRelocateRight
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08081C36:
	ldr r1, [r6]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08081C54
	adds r0, r5, #0
	bl Proc_Break
	b _08081C72
	.align 2, 0
_08081C4C: .4byte 0x0203E694
_08081C50: .4byte 0x08B857F8
_08081C54:
	cmp r4, #0
	beq _08081C72
	ldr r0, _08081C78 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081C6A
	ldr r0, _08081C7C @ =0x00000387
	bl m4aSongNumStart
_08081C6A:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
_08081C72:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081C78: .4byte 0x0202BBF8
_08081C7C: .4byte 0x00000387
