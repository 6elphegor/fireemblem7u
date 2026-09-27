	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_BackgroundLynModeDeath
EvtCmd_BackgroundLynModeDeath: @ 0x0800B5B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0800B5E0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x95
	ldrb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800B5E4
	movs r0, #0
	b _0800B632
	.align 2, 0
_0800B5E0: .4byte 0x0202BBF8
_0800B5E4:
	bl GetLynModeDeathFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B5F8
	movs r0, #0x2c
	bl OverrideBgm
	bl SetLynModeDeathFlag
_0800B5F8:
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B60E
	bl LockBmDisplay
	bl LockMus
_0800B60E:
	adds r0, r5, #0
	bl DisplayBackground
	strb r5, [r4]
	ldr r2, _0800B638 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #2
_0800B632:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800B638: .4byte 0x03002870
