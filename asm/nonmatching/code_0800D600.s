	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfyFlag
EvtCmd_GotoIfyFlag: @ 0x0800D600
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r0, [r0, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D634
	movs r0, #0
	b _0800D65E
_0800D61A:
	ldr r0, _0800D630 @ =0x08B90E48
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r5, #0x30]
	movs r0, #1
	b _0800D65E
	.align 2, 0
_0800D630: .4byte 0x08B90E48
_0800D634:
	ldr r0, [r4]
	cmp r0, #0
	beq _0800D65C
	ldr r3, _0800D664 @ =0x0000FFFF
	ldr r2, _0800D668 @ =0x08B90E4C
_0800D63E:
	ldr r1, [r4]
	ands r1, r3
	cmp r1, #0x44
	bne _0800D64C
	ldr r0, [r4, #4]
	cmp r0, r6
	beq _0800D61A
_0800D64C:
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	bne _0800D63E
_0800D65C:
	movs r0, #2
_0800D65E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D664: .4byte 0x0000FFFF
_0800D668: .4byte 0x08B90E4C
