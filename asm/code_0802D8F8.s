	.include "macro.inc"

	.syntax unified

	thumb_func_start WeatherInit_Blue
WeatherInit_Blue: @ 0x0802D8F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0802D930 @ =0x02002ADC
	movs r4, #0
	ldr r0, _0802D934 @ =WfxBlueHSync
	mov r8, r0
	movs r7, #0x1f
	ldr r6, _0802D938 @ =0x0000013F
_0802D90A:
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	subs r0, r7, r0
	lsls r0, r0, #0xa
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r6
	ble _0802D90A
	mov r0, r8
	bl SetOnHBlankB
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D930: .4byte 0x02002ADC
_0802D934: .4byte WfxBlueHSync
_0802D938: .4byte 0x0000013F
