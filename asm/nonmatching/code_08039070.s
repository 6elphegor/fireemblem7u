	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetOpponentLowHpScoreComponent
AiGetOpponentLowHpScoreComponent: @ 0x08039070
	ldr r0, _0803908C @ =0x0203A470
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _08039090 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	muls r1, r0, r1
	cmp r1, #0
	bge _08039088
	movs r1, #0
_08039088:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0803908C: .4byte 0x0203A470
_08039090: .4byte 0x030013C0
