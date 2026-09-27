	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804C504
sub_0804C504: @ 0x0804C504
	adds r3, r0, #0
	cmp r1, #0
	ble _0804C52C
	cmp r2, #1
	beq _0804C51C
	cmp r2, #1
	bhs _0804C524
	ldr r0, _0804C518 @ =0x08B9AB1C
	b _0804C546
	.align 2, 0
_0804C518: .4byte 0x08B9AB1C
_0804C51C:
	ldr r0, _0804C520 @ =0x08B9AB34
	b _0804C546
	.align 2, 0
_0804C520: .4byte 0x08B9AB34
_0804C524:
	ldr r0, _0804C528 @ =0x08B9AB4C
	b _0804C546
	.align 2, 0
_0804C528: .4byte 0x08B9AB4C
_0804C52C:
	cmp r2, #1
	beq _0804C53C
	cmp r2, #1
	bhs _0804C544
	ldr r0, _0804C538 @ =0x08B9AB64
	b _0804C546
	.align 2, 0
_0804C538: .4byte 0x08B9AB64
_0804C53C:
	ldr r0, _0804C540 @ =0x08B9AB7C
	b _0804C546
	.align 2, 0
_0804C540: .4byte 0x08B9AB7C
_0804C544:
	ldr r0, _0804C54C @ =0x08B9AB94
_0804C546:
	str r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_0804C54C: .4byte 0x08B9AB94
