	.include "macro.inc"

	.syntax unified

	thumb_func_start EventUnitLoadAliveWait
EventUnitLoadAliveWait: @ 0x0800D098
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x44]
	b _0800D11C
_0800D0A0:
	adds r1, r5, #0
	adds r1, #0x5e
	movs r6, #4
	adds r0, r6, #0
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D0DA
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800D0E6
	b _0800D0DA
_0800D0C0:
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D0D8
	adds r0, r4, #0
	movs r1, #0
	bl LoadUnitCore
_0800D0D8:
	adds r4, #0x10
_0800D0DA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800D0C0
	movs r0, #0
	str r0, [r5, #0x40]
	b _0800D12A
_0800D0E6:
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	ands r0, r6
	cmp r0, #0
	bne _0800D118
	adds r0, r4, #0
	bl UnitInfoRequiresNoMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D118
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D126
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadUnitCore
_0800D118:
	adds r4, #0x10
	str r4, [r5, #0x44]
_0800D11C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800D0A0
	ldr r0, _0800D130 @ =EventMovementWait
	str r0, [r5, #0x40]
_0800D126:
	bl ForceSyncUnitSpriteSheet
_0800D12A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D130: .4byte EventMovementWait
