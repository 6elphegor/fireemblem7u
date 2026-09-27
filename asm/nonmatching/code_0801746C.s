	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemMaxValue
GetItemMaxValue: @ 0x0801746C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017490 @ =0x08BE222C
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	movs r1, #0xff
	cmp r0, #0
	bne _08017488
	ldrb r1, [r2, #0x14]
_08017488:
	ldrh r2, [r2, #0x1a]
	adds r0, r2, #0
	muls r0, r1, r0
	bx lr
	.align 2, 0
_08017490: .4byte 0x08BE222C
