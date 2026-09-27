	.include "macro.inc"

	.syntax unified

	thumb_func_start PutNumberTwoChr
PutNumberTwoChr: @ 0x08006204
	push {lr}
	cmp r2, #0x64
	bne _08006216
	subs r0, #2
	movs r2, #0x28
	movs r3, #0x29
	bl PutTwoSpecialChar
	b _0800622E
_08006216:
	cmp r2, #0
	blt _0800621E
	cmp r2, #0xff
	bne _0800622A
_0800621E:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _0800622E
_0800622A:
	bl PutNumber
_0800622E:
	pop {r0}
	bx r0
	.align 2, 0
