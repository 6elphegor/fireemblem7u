	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsUnitEnemyAndScrCharId
AiIsUnitEnemyAndScrCharId: @ 0x080379E8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _08037A18 @ =0x030013B8
	ldr r1, [r1]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bne _08037A20
	ldr r0, _08037A1C @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037A20
	movs r0, #1
	b _08037A22
	.align 2, 0
_08037A18: .4byte 0x030013B8
_08037A1C: .4byte 0x03004690
_08037A20:
	movs r0, #0
_08037A22:
	pop {r1}
	bx r1
	.align 2, 0
