	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08088D8C
sub_08088D8C: @ 0x08088D8C
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _08088DB0 @ =0x0200E66C
_08088D92:
	ldr r0, [r1]
	cmp r0, r3
	beq _08088DBC
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _08088D92
	movs r2, #0
	ldr r1, _08088DB0 @ =0x0200E66C
_08088DA4:
	ldr r0, [r1]
	cmp r0, #0xff
	bne _08088DB4
	str r3, [r1]
	b _08088DBC
	.align 2, 0
_08088DB0: .4byte 0x0200E66C
_08088DB4:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _08088DA4
_08088DBC:
	bx lr
	.align 2, 0
