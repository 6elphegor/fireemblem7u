	.include "macro.inc"

	.syntax unified

	thumb_func_start FlamesWeatherHBlank
FlamesWeatherHBlank: @ 0x0802D940
	push {lr}
	ldr r0, _0802D978 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x5f
	bls _0802D972
	cmp r0, #0x9f
	bhi _0802D972
	adds r2, r0, #0
	subs r2, #0x60
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _0802D97C @ =0x02002ADC
	lsls r1, r2, #4
	adds r0, r1, r0
	movs r1, #7
	ands r1, r2
	lsls r1, r1, #4
	ldr r2, _0802D980 @ =0x050000E0
	adds r1, r1, r2
	movs r2, #2
	bl CpuFastSet
_0802D972:
	pop {r0}
	bx r0
	.align 2, 0
_0802D978: .4byte 0x04000006
_0802D97C: .4byte 0x02002ADC
_0802D980: .4byte 0x050000E0
