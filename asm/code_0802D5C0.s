	.include "macro.inc"

	.syntax unified

	thumb_func_start WeatherInit_Rain
WeatherInit_Rain: @ 0x0802D5C0
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802D618 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	movs r6, #0
	ldr r7, _0802D61C @ =0x081C3FCC
	ldr r5, _0802D620 @ =0x020027DC
_0802D5D0:
	movs r0, #0xf
	ands r0, r6
	lsls r4, r0, #1
	adds r4, r4, r0
	bl RandNextB
	strh r0, [r5]
	bl RandNextB
	strh r0, [r5, #2]
	lsls r1, r4, #1
	adds r1, r1, r7
	ldrh r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	strh r0, [r5, #4]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	adds r4, #2
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r0, [r4]
	strb r0, [r5, #8]
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _0802D5D0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D618: .4byte 0x0202BBF8
_0802D61C: .4byte 0x081C3FCC
_0802D620: .4byte 0x020027DC
