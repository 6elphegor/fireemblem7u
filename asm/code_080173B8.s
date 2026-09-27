	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemRequiredExp
GetItemRequiredExp: @ 0x080173B8
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173CC @ =0x08BE222C
	adds r1, r1, r0
	ldrb r0, [r1, #0x1c]
	bx lr
	.align 2, 0
_080173CC: .4byte 0x08BE222C
