	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitLoadStatsFromChracter
UnitLoadStatsFromChracter: @ 0x08017930
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4, #4]
	ldrb r3, [r1, #0xc]
	ldrb r5, [r2, #0xb]
	adds r0, r3, r5
	movs r3, #0
	strb r0, [r4, #0x12]
	ldrb r6, [r1, #0xd]
	ldrb r5, [r2, #0xc]
	adds r0, r6, r5
	strb r0, [r4, #0x14]
	ldrb r6, [r1, #0xe]
	ldrb r5, [r2, #0xd]
	adds r0, r6, r5
	strb r0, [r4, #0x15]
	ldrb r6, [r1, #0xf]
	ldrb r5, [r2, #0xe]
	adds r0, r6, r5
	strb r0, [r4, #0x16]
	ldrb r6, [r1, #0x10]
	ldrb r5, [r2, #0xf]
	adds r0, r6, r5
	strb r0, [r4, #0x17]
	ldrb r6, [r1, #0x11]
	ldrb r2, [r2, #0x10]
	adds r0, r6, r2
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x12]
	strb r0, [r4, #0x19]
	strb r3, [r4, #0x1a]
	movs r1, #0
	adds r3, r4, #0
	adds r3, #0x28
_08017974:
	adds r2, r3, r1
	ldr r0, [r4, #4]
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, [r4]
	adds r0, #0x14
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801798E
	strb r0, [r2]
_0801798E:
	adds r1, #1
	cmp r1, #7
	ble _08017974
	movs r1, #0xc0
	ldrb r0, [r4, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _080179B0
	ldrb r3, [r4, #8]
	cmp r3, #0x14
	beq _080179B0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	beq _080179B0
	strb r1, [r4, #9]
	b _080179B4
_080179B0:
	movs r0, #0xff
	strb r0, [r4, #9]
_080179B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
