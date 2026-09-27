	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803CD40
sub_0803CD40: @ 0x0803CD40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CD5C @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r1, [r1, #8]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0803CD60
	movs r0, #0
	b _0803CD62
	.align 2, 0
_0803CD5C: .4byte 0x08B98AEC
_0803CD60:
	movs r0, #1
_0803CD62:
	bx lr
