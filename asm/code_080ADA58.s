	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADA58
sub_080ADA58: @ 0x080ADA58
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r0, #1
	str r0, [r2, #0x30]
	cmp r0, #0x1e
	ble _080ADA80
	ldr r0, _080ADA7C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080ADA80
	adds r0, r2, #0
	bl Proc_Break
	b _080ADA8C
	.align 2, 0
_080ADA7C: .4byte 0x08B857F8
_080ADA80:
	ldr r0, [r2, #0x30]
	cmp r0, #0x78
	ble _080ADA8C
	adds r0, r2, #0
	bl Proc_Break
_080ADA8C:
	pop {r0}
	bx r0
