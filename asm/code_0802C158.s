	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C158
sub_0802C158: @ 0x0802C158
	ldr r1, _0802C15C @ =0x0203A518
	b _0802C172
	.align 2, 0
_0802C15C: .4byte 0x0203A518
_0802C160:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802C170
	cmp r0, #4
	blt _0802C170
	ldrb r0, [r1, #6]
	subs r0, #1
	strb r0, [r1, #6]
_0802C170:
	adds r1, #8
_0802C172:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802C160
	bx lr
	.align 2, 0
