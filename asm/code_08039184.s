	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetDamageTakenScoreComponent
AiGetDamageTakenScoreComponent: @ 0x08039184
	push {lr}
	ldr r2, _08039198 @ =0x0203A470
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803919C
	movs r0, #0xa
	rsbs r0, r0, #0
	b _080391D8
	.align 2, 0
_08039198: .4byte 0x0203A470
_0803919C:
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _080391DC @ =0x0203A3F0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	cmp r1, #0
	bge _080391BE
	movs r1, #0
_080391BE:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _080391E0 @ =0x030013C0
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _080391D6
	movs r1, #0x28
_080391D6:
	adds r0, r1, #0
_080391D8:
	pop {r1}
	bx r1
	.align 2, 0
_080391DC: .4byte 0x0203A3F0
_080391E0: .4byte 0x030013C0
