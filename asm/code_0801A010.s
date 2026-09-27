	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801A010
sub_0801A010: @ 0x0801A010
	sub sp, #0x40
	adds r3, r0, #0
	mov r2, sp
	cmp r1, r3
	bls _0801A026
_0801A01A:
	subs r1, #1
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #1
	cmp r1, r3
	bhi _0801A01A
_0801A026:
	movs r0, #4
	strb r0, [r2]
	mov r2, sp
	b _0801A034
_0801A02E:
	strb r0, [r3]
	adds r2, #1
	adds r3, #1
_0801A034:
	ldrb r0, [r2]
	cmp r0, #4
	bne _0801A02E
	movs r0, #4
	strb r0, [r3]
	add sp, #0x40
	bx lr
	.align 2, 0
