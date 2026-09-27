	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803CD1C
sub_0803CD1C: @ 0x0803CD1C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CD38 @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r1, [r1, #9]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0803CD3C
	movs r0, #0
	b _0803CD3E
	.align 2, 0
_0803CD38: .4byte 0x08B98AEC
_0803CD3C:
	movs r0, #1
_0803CD3E:
	bx lr
