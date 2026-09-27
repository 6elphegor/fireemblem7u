	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043690
sub_08043690: @ 0x08043690
	ldrb r0, [r0]
	cmp r0, #0x55
	beq _0804369A
	movs r0, #0
	b _0804369C
_0804369A:
	movs r0, #1
_0804369C:
	bx lr
	.align 2, 0
