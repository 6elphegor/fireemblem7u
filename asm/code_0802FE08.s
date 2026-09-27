	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateMovementMapForActiveUnit
GenerateMovementMapForActiveUnit: @ 0x0802FE08
	push {r4, lr}
	ldr r0, _0802FE44 @ =0x03004690
	ldr r0, [r0]
	ldr r1, _0802FE48 @ =0x08B96444
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, #1
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r3, #0
	adds r2, #0x41
	adds r2, r2, r4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, #0x55
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	bl MapFloodOnWorkingMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802FE44: .4byte 0x03004690
_0802FE48: .4byte 0x08B96444
