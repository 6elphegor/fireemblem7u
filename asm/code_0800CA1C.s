	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePidToSavedPosition
EvtCmd_MovePidToSavedPosition: @ 0x0800CA1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800CA54
	bl GetPlayerLeaderUnitId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CAA8
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, _0800CA50 @ =0x0202BBF8
	ldrb r3, [r0, #0x1b]
	b _0800CA70
	.align 2, 0
_0800CA50: .4byte 0x0202BBF8
_0800CA54:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CAA8
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r3, [r0, #8]
_0800CA70:
	ldr r0, _0800CAAC @ =0x0202A5AC
	adds r0, r3, r0
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _0800CAB0 @ =0x0202A5B0
	adds r0, r3, r0
	ldrb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CA98
	adds r0, r4, #0
	adds r0, #0x4d
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _0800CAB4
_0800CA98:
	adds r0, r5, #0
	mov r1, r8
	adds r2, r7, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
_0800CAA8:
	movs r0, #0
	b _0800CADA
	.align 2, 0
_0800CAAC: .4byte 0x0202A5AC
_0800CAB0: .4byte 0x0202A5B0
_0800CAB4:
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CAD8
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl TryMoveUnitDisplayed
	b _0800CAA8
_0800CAD8:
	movs r0, #3
_0800CADA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
