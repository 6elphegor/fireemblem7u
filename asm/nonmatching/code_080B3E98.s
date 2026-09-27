	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3E98
sub_080B3E98: @ 0x080B3E98
	push {lr}
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r3, [r2]
	cmp r1, r3
	beq _080B3EAE
	strb r1, [r2]
	ldr r0, [r0, #0x58]
	ldrb r1, [r2]
	bl SetMuFacing
_080B3EAE:
	pop {r0}
	bx r0
	.align 2, 0
