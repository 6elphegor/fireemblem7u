	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemHpBonus
GetItemHpBonus: @ 0x08016040
	adds r1, r0, #0
	cmp r1, #0
	beq _0801605A
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016060 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016064
_0801605A:
	movs r0, #0
	b _0801606A
	.align 2, 0
_08016060: .4byte 0x08BE222C
_08016064:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801606A:
	bx lr
