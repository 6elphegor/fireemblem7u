	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeNewItem
MakeNewItem: @ 0x08016174
	adds r2, r0, #0
	movs r0, #0xff
	ands r2, r0
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _080161A0 @ =0x08BE222C
	adds r3, r0, r1
	ldr r1, [r3, #8]
	movs r0, #8
	ands r1, r0
	movs r0, #0xff
	cmp r1, #0
	bne _08016192
	ldrb r0, [r3, #0x14]
_08016192:
	cmp r1, #0
	beq _08016198
	movs r0, #0
_08016198:
	lsls r0, r0, #8
	adds r0, r0, r2
	bx lr
	.align 2, 0
_080161A0: .4byte 0x08BE222C
