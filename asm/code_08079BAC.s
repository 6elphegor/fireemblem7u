	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079BAC
sub_08079BAC: @ 0x08079BAC
	push {r4, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	b _08079BC6
_08079BB8:
	cmp r0, #0xc
	bne _08079BC4
	adds r0, r4, #0
	bl RemoveLightRune
	subs r4, #8
_08079BC4:
	adds r4, #8
_08079BC6:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08079BB8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
