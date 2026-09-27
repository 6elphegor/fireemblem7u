	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetDangerScoreComponent
AiGetDangerScoreComponent: @ 0x080391E4
	ldr r2, _08039210 @ =0x0203A3F0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08039214 @ =0x0202E3F4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r1, r0, #3
	ldr r0, _08039218 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	muls r1, r0, r1
	cmp r1, #0x14
	ble _0803920C
	movs r1, #0x14
_0803920C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08039210: .4byte 0x0203A3F0
_08039214: .4byte 0x0202E3F4
_08039218: .4byte 0x030013C0
