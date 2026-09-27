	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckPermanentFlag
CheckPermanentFlag: @ 0x08079798
	adds r3, r0, #0
	cmp r3, #0
	beq _080797C2
	subs r3, #1
	ldr r1, _080797C8 @ =0x03004AD8
	adds r0, r3, #0
	cmp r3, #0
	bge _080797AA
	adds r0, r3, #7
_080797AA:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _080797CC @ =0x08C9EAEC
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r2, [r2]
	ldrb r0, [r0]
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #0
	bne _080797D0
_080797C2:
	movs r0, #0
	b _080797D2
	.align 2, 0
_080797C8: .4byte 0x03004AD8
_080797CC: .4byte 0x08C9EAEC
_080797D0:
	movs r0, #1
_080797D2:
	bx lr
