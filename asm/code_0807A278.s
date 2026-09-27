	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A278
sub_0807A278: @ 0x0807A278
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _0807A2A4
_0807A282:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A2A0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A2A0
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A2A0
	adds r6, #1
_0807A2A0:
	adds r4, #1
	adds r0, r5, #0
_0807A2A4:
	adds r0, #0x40
	cmp r4, r0
	blt _0807A282
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
