	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5FC0
sub_080B5FC0: @ 0x080B5FC0
	push {lr}
	ldr r0, _080B5FD0 @ =0x08CE76E8
	bl Proc_Find
	cmp r0, #0
	bne _080B5FD4
	movs r0, #0
	b _080B5FDC
	.align 2, 0
_080B5FD0: .4byte 0x08CE76E8
_080B5FD4:
	adds r0, #0x54
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080B5FDC:
	pop {r1}
	bx r1
