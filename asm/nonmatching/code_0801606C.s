	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemPowBonus
GetItemPowBonus: @ 0x0801606C
	adds r1, r0, #0
	cmp r1, #0
	beq _08016086
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801608C @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016090
_08016086:
	movs r0, #0
	b _08016096
	.align 2, 0
_0801608C: .4byte 0x08BE222C
_08016090:
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016096:
	bx lr
