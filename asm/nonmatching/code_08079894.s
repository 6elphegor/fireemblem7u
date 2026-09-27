	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearPermanentFlag
ClearPermanentFlag: @ 0x08079894
	adds r2, r0, #0
	cmp r2, #0x63
	ble _080798C6
	cmp r2, #0x64
	beq _080798C6
	subs r2, #0x65
	ldr r3, _080798C8 @ =0x08C9EAEC
	adds r1, r2, #0
	cmp r2, #0
	bge _080798AA
	adds r1, r2, #7
_080798AA:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080798CC @ =0x03004AD0
	adds r1, r1, r0
	adds r0, r3, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_080798C6:
	bx lr
	.align 2, 0
_080798C8: .4byte 0x08C9EAEC
_080798CC: .4byte 0x03004AD0
