	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetLowHpScoreComponent
AiGetLowHpScoreComponent: @ 0x0803921C
	ldr r0, _08039238 @ =0x0203A3F0
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _0803923C @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	muls r1, r0, r1
	cmp r1, #0
	bge _08039234
	movs r1, #0
_08039234:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08039238: .4byte 0x0203A3F0
_0803923C: .4byte 0x030013C0
