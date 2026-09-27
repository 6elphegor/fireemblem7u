	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080786E0
sub_080786E0: @ 0x080786E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078700 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08078704
	movs r0, #2
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078704
	adds r0, r4, #0
	bl sub_08078650
	b _08078706
	.align 2, 0
_08078700: .4byte 0x0202BBF8
_08078704:
	movs r0, #0
_08078706:
	pop {r4}
	pop {r1}
	bx r1
