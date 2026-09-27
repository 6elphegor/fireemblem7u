	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AAD68
sub_080AAD68: @ 0x080AAD68
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0x64
	beq _080AAD74
	movs r0, #0
	b _080AAD76
_080AAD74:
	movs r0, #1
_080AAD76:
	bx lr
