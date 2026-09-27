	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C17C
sub_0802C17C: @ 0x0802C17C
	ldr r1, _0802C180 @ =0x0203A518
	b _0802C19C
	.align 2, 0
_0802C180: .4byte 0x0203A518
_0802C184:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802C19A
	cmp r0, #4
	blt _0802C19A
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802C19A
	ldrb r0, [r1, #5]
	strb r0, [r1, #6]
_0802C19A:
	adds r1, #8
_0802C19C:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802C184
	bx lr
