	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPickTrapType
GetPickTrapType: @ 0x080343BC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _08034426
	ldrb r3, [r0, #2]
	cmp r3, #4
	beq _080343E6
	cmp r3, #4
	bgt _080343E0
	cmp r3, #1
	beq _08034426
	b _0803442A
_080343E0:
	cmp r3, #0xb
	beq _080343FC
	b _0803442A
_080343E6:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0803442A
	movs r0, #0xe
	b _0803442C
_080343FC:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r2
	cmp r0, #0
	beq _0803441E
	adds r0, r4, #0
	bl GetUnitItemCount
	cmp r0, #5
	beq _08034426
	movs r0, #0xf
	b _0803442C
_0803441E:
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	beq _0803442A
_08034426:
	movs r0, #0
	b _0803442C
_0803442A:
	adds r0, r3, #0
_0803442C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
