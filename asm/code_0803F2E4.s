	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F2E4
sub_0803F2E4: @ 0x0803F2E4
	adds r1, r0, #0
	movs r2, #0
	b _0803F2EE
_0803F2EA:
	adds r2, #1
	adds r1, #1
_0803F2EE:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803F2EA
	adds r0, r2, #0
	bx lr
