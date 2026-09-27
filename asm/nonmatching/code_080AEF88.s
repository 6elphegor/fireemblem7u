	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AEF88
sub_080AEF88: @ 0x080AEF88
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b _080AEF9A
_080AEF90:
	ldrb r0, [r4]
	bl sub_080AEF48
	adds r5, r5, r0
	adds r4, #1
_080AEF9A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080AEF90
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
