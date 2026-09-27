	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802404C
sub_0802404C: @ 0x0802404C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _0802408A
	cmp r1, #2
	beq _0802408A
	ldr r0, _08024090 @ =0x02033E40
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_080789FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802408A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	ldr r3, [r4]
	ldrb r3, [r3, #4]
	bl EnlistTarget
_0802408A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024090: .4byte 0x02033E40
