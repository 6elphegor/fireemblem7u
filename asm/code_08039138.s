	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetTargetClassCombatScoreComponent
AiGetTargetClassCombatScoreComponent: @ 0x08039138
	push {lr}
	ldr r0, _08039164 @ =0x0203A470
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	bl AiGetClassRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08039168 @ =0x030013C0
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	adds r1, r1, r0
	ldrb r2, [r2, #3]
	ldrb r1, [r1]
	adds r0, r2, #0
	muls r0, r1, r0
	cmp r0, #0x14
	ble _08039160
	movs r0, #0x14
_08039160:
	pop {r1}
	bx r1
	.align 2, 0
_08039164: .4byte 0x0203A470
_08039168: .4byte 0x030013C0
