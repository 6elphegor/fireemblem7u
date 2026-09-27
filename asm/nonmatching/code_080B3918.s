	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3918
sub_080B3918: @ 0x080B3918
	adds r2, r0, #0
	adds r0, #0x2b
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	strh r1, [r2, #0x2e]
	movs r3, #0
	movs r1, #3
	adds r0, #0x1f
_080B3934:
	str r3, [r0]
	subs r0, #8
	subs r1, #1
	cmp r1, #0
	bge _080B3934
	bx lr
