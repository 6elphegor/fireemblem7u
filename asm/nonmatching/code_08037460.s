	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037460
sub_08037460: @ 0x08037460
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetActiveFactionAlliance
	adds r5, r0, #0
	adds r4, r5, #1
	b _0803749A
_0803746E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08037496
	ldr r0, [r2]
	cmp r0, #0
	beq _08037496
	ldr r0, [r2, #0xc]
	ldr r1, _080374A8 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _08037496
	movs r0, #1
	ldrb r2, [r2, #0xa]
	ands r0, r2
	cmp r0, #0
	beq _08037496
	adds r6, #1
_08037496:
	adds r4, #1
	adds r0, r5, #0
_0803749A:
	adds r0, #0x80
	cmp r4, r0
	blt _0803746E
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080374A8: .4byte 0x00010005
