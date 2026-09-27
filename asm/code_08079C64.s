	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079C64
sub_08079C64: @ 0x08079C64
	adds r1, r0, #0
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079C74
	subs r0, r2, #1
	strb r0, [r1, #0x12]
_08079C74:
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079C82
	subs r0, r2, #1
	strb r0, [r1, #0x14]
_08079C82:
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079C90
	subs r0, r2, #1
	strb r0, [r1, #0x15]
_08079C90:
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079C9E
	subs r0, r2, #1
	strb r0, [r1, #0x16]
_08079C9E:
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079CAC
	subs r0, r2, #1
	strb r0, [r1, #0x17]
_08079CAC:
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079CBA
	subs r0, r2, #1
	strb r0, [r1, #0x18]
_08079CBA:
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079CC8
	subs r0, r2, #1
	strb r0, [r1, #0x19]
_08079CC8:
	bx lr
	.align 2, 0
