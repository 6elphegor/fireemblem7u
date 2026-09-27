	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPermanentFlag
SetPermanentFlag: @ 0x08079820
	adds r3, r0, #0
	cmp r3, #0x63
	ble _0807984C
	cmp r3, #0x64
	beq _0807984C
	subs r3, #0x65
	ldr r1, _08079850 @ =0x03004AD0
	adds r0, r3, #0
	cmp r3, #0
	bge _08079836
	adds r0, r3, #7
_08079836:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08079854 @ =0x08C9EAEC
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r2]
_0807984C:
	bx lr
	.align 2, 0
_08079850: .4byte 0x03004AD0
_08079854: .4byte 0x08C9EAEC
