	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7ED4
sub_080B7ED4: @ 0x080B7ED4
	adds r2, r0, #0
	ldr r1, _080B7EDC @ =0x08CEE7A0
	b _080B7EEC
	.align 2, 0
_080B7EDC: .4byte 0x08CEE7A0
_080B7EE0:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080B7EEA
	ldrb r0, [r1, #1]
	b _080B7EF4
_080B7EEA:
	adds r1, #4
_080B7EEC:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B7EE0
	movs r0, #0
_080B7EF4:
	bx lr
	.align 2, 0
