	.include "macro.inc"

	.syntax unified

	thumb_func_start EventUnitLoadWait
EventUnitLoadWait: @ 0x0800D01C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x44]
	b _0800D080
_0800D024:
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800D04C
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800D058
	b _0800D04C
_0800D042:
	adds r0, r4, #0
	movs r1, #0
	bl LoadUnitCore
	adds r4, #0x10
_0800D04C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800D042
	movs r0, #0
	str r0, [r5, #0x40]
	b _0800D08E
_0800D058:
	adds r0, r4, #0
	bl UnitInfoRequiresNoMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D07C
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	bl CanDisplayUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D08A
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadUnitCore
_0800D07C:
	adds r4, #0x10
	str r4, [r5, #0x44]
_0800D080:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800D024
	ldr r0, _0800D094 @ =EventMovementWait
	str r0, [r5, #0x40]
_0800D08A:
	bl ForceSyncUnitSpriteSheet
_0800D08E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D094: .4byte EventMovementWait
