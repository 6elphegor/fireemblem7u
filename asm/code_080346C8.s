	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBallistaItemAt
GetBallistaItemAt: @ 0x080346C8
	push {lr}
	bl GetTrapAt
	adds r2, r0, #0
	cmp r2, #0
	beq _080346DA
	ldrb r0, [r2, #2]
	cmp r0, #1
	beq _080346DE
_080346DA:
	movs r1, #0
	b _080346E0
_080346DE:
	movs r1, #1
_080346E0:
	cmp r1, #0
	beq _08034700
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _08034700
	cmp r2, #0
	beq _080346F6
	ldrb r1, [r2, #2]
	cmp r1, #1
	beq _080346FA
_080346F6:
	movs r1, #0
	b _080346FC
_080346FA:
	movs r1, #1
_080346FC:
	cmp r1, #0
	bne _08034704
_08034700:
	movs r0, #0
	b _0803470A
_08034704:
	lsls r0, r0, #8
	ldrb r2, [r2, #3]
	orrs r0, r2
_0803470A:
	pop {r1}
	bx r1
	.align 2, 0
