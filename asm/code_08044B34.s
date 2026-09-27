	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044B34
sub_08044B34: @ 0x08044B34
	movs r1, #0
	ldr r3, _08044B50 @ =0x0203DC9C
	adds r2, r3, #0
	adds r2, #0xa
_08044B3C:
	cmp r0, #2
	beq _08044B66
	cmp r0, #2
	bgt _08044B54
	cmp r0, #0
	beq _08044B5E
	cmp r0, #1
	beq _08044B62
	b _08044B70
	.align 2, 0
_08044B50: .4byte 0x0203DC9C
_08044B54:
	cmp r0, #3
	beq _08044B6A
	cmp r0, #0xff
	beq _08044B6E
	b _08044B70
_08044B5E:
	movs r1, #2
	b _08044B70
_08044B62:
	movs r1, #3
	b _08044B70
_08044B66:
	movs r1, #1
	b _08044B70
_08044B6A:
	movs r1, #0
	b _08044B70
_08044B6E:
	movs r1, #0xff
_08044B70:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08044B80
	cmp r1, #0xff
	beq _08044B80
	adds r0, r1, #0
	b _08044B3C
_08044B80:
	strb r1, [r3, #1]
	bx lr
