	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemResBonus
GetItemResBonus: @ 0x0801611C
	adds r1, r0, #0
	cmp r1, #0
	beq _08016136
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801613C @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016140
_08016136:
	movs r0, #0
	b _08016146
	.align 2, 0
_0801613C: .4byte 0x08BE222C
_08016140:
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016146:
	bx lr
