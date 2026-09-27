	.include "macro.inc"

	.syntax unified

	thumb_func_start IsKeyInputSequenceComplete
IsKeyInputSequenceComplete: @ 0x0803DDF4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0803DE18 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r4, [r0, #8]
	adds r3, r4, #0
	cmp r3, #0
	bne _0803DE24
	ldr r1, _0803DE1C @ =0x0203DC48
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3b
	ble _0803DE78
	ldr r0, _0803DE20 @ =0x030013F4
	str r3, [r1]
	str r3, [r0]
	b _0803DE78
	.align 2, 0
_0803DE18: .4byte 0x08B857F8
_0803DE1C: .4byte 0x0203DC48
_0803DE20: .4byte 0x030013F4
_0803DE24:
	ldr r0, _0803DE58 @ =0x0203DC48
	movs r6, #0
	str r6, [r0]
	ldr r1, _0803DE5C @ =0x0203DC28
	ldr r2, _0803DE60 @ =0x030013F0
	ldr r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r1, _0803DE64 @ =0x030013F4
	ldr r4, [r1]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r3, r0
	bne _0803DE6C
	adds r0, r4, #1
	str r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, _0803DE68 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	bne _0803DE6E
	movs r0, #1
	b _0803DE7A
	.align 2, 0
_0803DE58: .4byte 0x0203DC48
_0803DE5C: .4byte 0x0203DC28
_0803DE60: .4byte 0x030013F0
_0803DE64: .4byte 0x030013F4
_0803DE68: .4byte 0x0000FFFF
_0803DE6C:
	str r6, [r1]
_0803DE6E:
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	str r0, [r2]
_0803DE78:
	movs r0, #0
_0803DE7A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
