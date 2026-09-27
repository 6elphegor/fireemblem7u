	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030490
sub_08030490: @ 0x08030490
	push {lr}
	bl GetSupplyUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080304BA
	ldr r0, [r2, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xff
	ldrb r1, [r2, #0x10]
	orrs r1, r0
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x11]
	orrs r0, r1
	strb r0, [r2, #0x11]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_080304BA:
	pop {r0}
	bx r0
	.align 2, 0
