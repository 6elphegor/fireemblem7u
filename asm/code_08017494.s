	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemAwardedExp
GetItemAwardedExp: @ 0x08017494
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080174A8 @ =0x08BE222C
	adds r1, r1, r0
	adds r1, #0x20
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080174A8: .4byte 0x08BE222C
