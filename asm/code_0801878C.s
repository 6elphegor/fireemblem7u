	.include "macro.inc"

	.syntax unified

	thumb_func_start IsUnitMagicSealed
IsUnitMagicSealed: @ 0x0801878C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _080187B4
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl IsPositionMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080187B4
	movs r0, #0
	b _080187B6
_080187B4:
	movs r0, #1
_080187B6:
	pop {r1}
	bx r1
	.align 2, 0
