	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetDamageDealtCombatScoreComponent
AiGetDamageDealtCombatScoreComponent: @ 0x08039010
	push {r4, lr}
	ldr r3, _08039020 @ =0x0203A470
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08039024
	movs r0, #0x32
	b _08039062
	.align 2, 0
_08039020: .4byte 0x0203A470
_08039024:
	ldr r1, _08039068 @ =0x0203A3F0
	adds r0, r1, #0
	adds r0, #0x5a
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r2, r2, r0
	adds r1, #0x64
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r1, r2, #0
	muls r1, r0, r1
	cmp r1, #0
	bge _08039048
	movs r1, #0
_08039048:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _0803906C @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _08039060
	movs r1, #0x28
_08039060:
	adds r0, r1, #0
_08039062:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08039068: .4byte 0x0203A3F0
_0803906C: .4byte 0x030013C0
