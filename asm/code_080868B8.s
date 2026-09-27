	.include "macro.inc"

	.syntax unified

	thumb_func_start CountUnitsByFaction
CountUnitsByFaction: @ 0x080868B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _080868E4
_080868C2:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080868E0
	ldr r0, [r1]
	cmp r0, #0
	beq _080868E0
	ldr r0, [r1, #0xc]
	ldr r1, _080868F4 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080868E0
	adds r6, #1
_080868E0:
	adds r4, #1
	adds r0, r5, #0
_080868E4:
	adds r0, #0x40
	cmp r4, r0
	blt _080868C2
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080868F4: .4byte 0x0001000C
