	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D2EC
sub_0807D2EC: @ 0x0807D2EC
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807D2F2:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807D30E
	ldr r0, [r0]
	cmp r0, #0
	beq _0807D30E
	ldrb r0, [r0, #4]
	bl PidStatsGetExpGain
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807D30E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D2F2
	ldr r0, _0807D320 @ =0x03004ADC
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D320: .4byte 0x03004ADC
