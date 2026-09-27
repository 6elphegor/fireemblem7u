	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SavePositionPid
EvtCmd_SavePositionPid: @ 0x0800C9AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800C9E0
	bl GetPlayerLeaderUnitId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CA0C
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r3, r0, #0
	ldr r0, _0800C9DC @ =0x0202BBF8
	ldrb r2, [r0, #0x1b]
	b _0800C9FC
	.align 2, 0
_0800C9DC: .4byte 0x0202BBF8
_0800C9E0:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CA0C
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r3, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #8]
_0800C9FC:
	ldr r0, _0800CA14 @ =0x0202A5AC
	adds r0, r2, r0
	ldrb r1, [r3, #0x10]
	strb r1, [r0]
	ldr r0, _0800CA18 @ =0x0202A5B0
	adds r0, r2, r0
	ldrb r1, [r3, #0x11]
	strb r1, [r0]
_0800CA0C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CA14: .4byte 0x0202A5AC
_0800CA18: .4byte 0x0202A5B0
