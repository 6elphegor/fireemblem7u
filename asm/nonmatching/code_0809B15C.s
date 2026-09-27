	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809B15C
sub_0809B15C: @ 0x0809B15C
	adds r2, r0, #0
	ldr r1, _0809B164 @ =0x08C9F9F4
	b _0809B17A
	.align 2, 0
_0809B164: .4byte 0x08C9F9F4
_0809B168:
	ldrb r0, [r1]
	cmp r0, r2
	beq _0809B174
	ldrb r0, [r1, #1]
	cmp r0, r2
	bne _0809B178
_0809B174:
	movs r0, #1
	b _0809B182
_0809B178:
	adds r1, #0x14
_0809B17A:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809B168
	movs r0, #0
_0809B182:
	bx lr
