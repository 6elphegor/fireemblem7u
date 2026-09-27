	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079A14
sub_08079A14: @ 0x08079A14
	ldr r1, _08079A1C @ =0x08CA0538
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	b _08079A2C
	.align 2, 0
_08079A1C: .4byte 0x08CA0538
_08079A20:
	ldrb r0, [r1]
	cmp r0, r2
	bne _08079A2A
	movs r0, #1
	b _08079A34
_08079A2A:
	adds r1, #1
_08079A2C:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08079A20
	movs r0, #0
_08079A34:
	bx lr
	.align 2, 0
