	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806FB4C
sub_0806FB4C: @ 0x0806FB4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0x40
	beq _0806FB88
	cmp r0, #0x40
	bgt _0806FB6E
	cmp r0, #0
	beq _0806FB78
	b _0806FB98
_0806FB6E:
	cmp r0, #0x80
	beq _0806FB80
	cmp r0, #0xc0
	beq _0806FB90
	b _0806FB98
_0806FB78:
	ldr r0, _0806FB7C @ =0x083F41CC
	b _0806FB9C
	.align 2, 0
_0806FB7C: .4byte 0x083F41CC
_0806FB80:
	ldr r0, _0806FB84 @ =0x083F41EC
	b _0806FB9C
	.align 2, 0
_0806FB84: .4byte 0x083F41EC
_0806FB88:
	ldr r0, _0806FB8C @ =0x083F420C
	b _0806FB9C
	.align 2, 0
_0806FB8C: .4byte 0x083F420C
_0806FB90:
	ldr r0, _0806FB94 @ =0x083F422C
	b _0806FB9C
	.align 2, 0
_0806FB94: .4byte 0x083F422C
_0806FB98:
	movs r0, #0
	b _0806FB9C
_0806FB9C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
