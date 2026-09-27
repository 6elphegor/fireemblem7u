	.include "macro.inc"

	.syntax unified

	thumb_func_start WeatherInit_Snowstorm
WeatherInit_Snowstorm: @ 0x0802D770
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r0, _0802D7DC @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	ldr r0, _0802D7E0 @ =0x081994E0
	ldr r4, _0802D7E4 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r1, _0802D7E8 @ =0x06010300
	adds r0, r4, #0
	movs r2, #8
	movs r3, #4
	bl Copy2dChr
	movs r6, #0
	ldr r5, _0802D7EC @ =0x020027DC
	ldr r0, _0802D7F0 @ =0x000001FF
	adds r7, r0, #0
_0802D7AC:
	movs r0, #7
	ands r0, r6
	add r0, sp
	ldrb r4, [r0]
	bl RandNextB
	strh r0, [r5]
	bl RandNextB
	strh r0, [r5, #2]
	bl RandNextB
	ldr r2, _0802D7F4 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _0802D7F8 @ =0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r5, #6]
	strb r4, [r5, #8]
	cmp r4, #0
	beq _0802D7FC
	cmp r4, #1
	beq _0802D80A
	b _0802D81A
	.align 2, 0
_0802D7DC: .4byte 0x0202BBF8
_0802D7E0: .4byte 0x081994E0
_0802D7E4: .4byte 0x02020140
_0802D7E8: .4byte 0x06010300
_0802D7EC: .4byte 0x020027DC
_0802D7F0: .4byte 0x000001FF
_0802D7F4: .4byte 0x000003FF
_0802D7F8: .4byte 0xFFFFFF00
_0802D7FC:
	bl RandNextB
	ands r0, r7
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r0, r2
	b _0802D818
_0802D80A:
	bl RandNextB
	ands r0, r7
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
	adds r0, r0, r1
_0802D818:
	strh r0, [r5, #4]
_0802D81A:
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _0802D7AC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
