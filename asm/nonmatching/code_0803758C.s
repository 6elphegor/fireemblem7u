	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803758C
sub_0803758C: @ 0x0803758C
	push {lr}
	adds r2, r0, #0
	ldr r1, _080375A8 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080375AC
	adds r0, r2, #0
	movs r1, #0
	bl MapFloodUnitMovement
	b _080375B2
	.align 2, 0
_080375A8: .4byte 0x0203A8EC
_080375AC:
	adds r0, r2, #0
	bl RevertMapChange
_080375B2:
	pop {r0}
	bx r0
	.align 2, 0
