	.include "macro.inc"

	.syntax unified

	thumb_func_start GetRiddenBallistaAt
GetRiddenBallistaAt: @ 0x08034698
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq _080346AA
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _080346AE
_080346AA:
	movs r0, #0
	b _080346B0
_080346AE:
	movs r0, #1
_080346B0:
	cmp r0, #0
	beq _080346BC
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080346C0
_080346BC:
	movs r0, #0
	b _080346C2
_080346C0:
	adds r0, r1, #0
_080346C2:
	pop {r1}
	bx r1
	.align 2, 0
