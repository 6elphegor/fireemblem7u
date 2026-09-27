	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7EB0
sub_080B7EB0: @ 0x080B7EB0
	adds r2, r0, #0
	ldr r1, _080B7EB8 @ =0x08CEE638
	b _080B7EC8
	.align 2, 0
_080B7EB8: .4byte 0x08CEE638
_080B7EBC:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080B7EC6
	ldr r0, [r1, #4]
	b _080B7ED0
_080B7EC6:
	adds r1, #8
_080B7EC8:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B7EBC
	movs r0, #0
_080B7ED0:
	bx lr
	.align 2, 0
