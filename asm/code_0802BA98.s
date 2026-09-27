	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802BA98
sub_0802BA98: @ 0x0802BA98
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _0802BAA0 @ =0x0203A518
	b _0802BABC
	.align 2, 0
_0802BAA0: .4byte 0x0203A518
_0802BAA4:
	ldrb r0, [r3]
	cmp r0, r4
	bne _0802BABA
	ldrb r0, [r3, #1]
	cmp r0, r1
	bne _0802BABA
	ldrb r0, [r3, #2]
	cmp r0, r2
	bne _0802BABA
	adds r0, r3, #0
	b _0802BAC4
_0802BABA:
	adds r3, #8
_0802BABC:
	ldrb r0, [r3, #2]
	cmp r0, #0
	bne _0802BAA4
	movs r0, #0
_0802BAC4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
