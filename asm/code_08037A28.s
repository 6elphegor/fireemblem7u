	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsUnitEnemyAndScrClassId
AiIsUnitEnemyAndScrClassId: @ 0x08037A28
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #4]
	ldr r1, _08037A58 @ =0x030013B8
	ldr r1, [r1]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bne _08037A60
	ldr r0, _08037A5C @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037A60
	movs r0, #1
	b _08037A62
	.align 2, 0
_08037A58: .4byte 0x030013B8
_08037A5C: .4byte 0x03004690
_08037A60:
	movs r0, #0
_08037A62:
	pop {r1}
	bx r1
	.align 2, 0
