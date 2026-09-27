	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4310
sub_080B4310: @ 0x080B4310
	movs r1, #0
	adds r0, #0x2c
	movs r2, #4
_080B4316:
	str r1, [r0, #4]
	strb r1, [r0, #8]
	strh r1, [r0, #2]
	strh r1, [r0]
	adds r0, #0xc
	subs r2, #1
	cmp r2, #0
	bge _080B4316
	bx lr
