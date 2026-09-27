	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemLckBonus
GetItemLckBonus: @ 0x08016148
	adds r1, r0, #0
	cmp r1, #0
	beq _08016162
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016168 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _0801616C
_08016162:
	movs r0, #0
	b _08016172
	.align 2, 0
_08016168: .4byte 0x08BE222C
_0801616C:
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016172:
	bx lr
