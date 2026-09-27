	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043130
sub_08043130: @ 0x08043130
	ldr r2, _08043150 @ =0x03002870
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08043150: .4byte 0x03002870
