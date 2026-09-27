	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080492CC
sub_080492CC: @ 0x080492CC
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _080492E8
	ldr r0, _080492E4 @ =0x0203DC9C
	adds r1, #0x3c
	ldrb r1, [r1]
	strb r1, [r0, #7]
	movs r0, #0x84
	b _080492EA
	.align 2, 0
_080492E4: .4byte 0x0203DC9C
_080492E8:
	movs r0, #8
_080492EA:
	bx lr
