	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6220
sub_080A6220: @ 0x080A6220
	adds r1, r0, #0
	adds r1, #0x42
	adds r0, #0x30
	ldrb r0, [r0]
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A6234
	movs r0, #0
	b _080A6236
_080A6234:
	movs r0, #1
_080A6236:
	bx lr
