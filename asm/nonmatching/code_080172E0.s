	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemMight
GetItemMight: @ 0x080172E0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080172F4 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x15]
	bx lr
	.align 2, 0
_080172F4: .4byte 0x08BE222C
