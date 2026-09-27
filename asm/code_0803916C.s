	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetTurnCombatScoreComponent
AiGetTurnCombatScoreComponent: @ 0x0803916C
	ldr r1, _0803917C @ =0x0202BBF8
	ldr r0, _08039180 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrh r1, [r1, #0x10]
	muls r0, r1, r0
	bx lr
	.align 2, 0
_0803917C: .4byte 0x0202BBF8
_08039180: .4byte 0x030013C0
