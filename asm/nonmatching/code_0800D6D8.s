	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfyActive
EvtCmd_GotoIfyActive: @ 0x0800D6D8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x2c]
	ldr r1, [r3, #0x30]
	ldr r6, [r1, #4]
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0800D700
	ldr r0, _0800D6FC @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #8]
	cmp r0, r1
	beq _0800D730
	movs r0, #0
	b _0800D75A
	.align 2, 0
_0800D6FC: .4byte 0x03004690
_0800D700:
	ldr r0, _0800D714 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #8]
	cmp r0, r1
	bne _0800D730
	movs r0, #0
	b _0800D75A
	.align 2, 0
_0800D714: .4byte 0x03004690
_0800D718:
	ldr r0, _0800D72C @ =0x08B90E48
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r3, #0x30]
	movs r0, #1
	b _0800D75A
	.align 2, 0
_0800D72C: .4byte 0x08B90E48
_0800D730:
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D758
	ldr r5, _0800D760 @ =0x0000FFFF
	ldr r4, _0800D764 @ =0x08B90E4C
_0800D73A:
	ldr r1, [r2]
	ands r1, r5
	cmp r1, #0x44
	bne _0800D748
	ldr r0, [r2, #4]
	cmp r0, r6
	beq _0800D718
_0800D748:
	lsls r0, r1, #3
	adds r0, r0, r4
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	bne _0800D73A
_0800D758:
	movs r0, #2
_0800D75A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D760: .4byte 0x0000FFFF
_0800D764: .4byte 0x08B90E4C
