	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08034820
sub_08034820: @ 0x08034820
	cmp r0, #0
	beq _0803482A
	ldrb r1, [r0, #2]
	cmp r1, #1
	beq _0803482E
_0803482A:
	movs r1, #0
	b _08034830
_0803482E:
	movs r1, #1
_08034830:
	cmp r1, #0
	beq _08034838
	ldrb r0, [r0, #3]
	b _0803483A
_08034838:
	movs r0, #0
_0803483A:
	bx lr
