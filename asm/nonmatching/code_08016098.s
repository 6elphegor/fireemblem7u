	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemSklBonus
GetItemSklBonus: @ 0x08016098
	adds r1, r0, #0
	cmp r1, #0
	beq _080160B2
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080160B8 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080160BC
_080160B2:
	movs r0, #0
	b _080160C2
	.align 2, 0
_080160B8: .4byte 0x08BE222C
_080160BC:
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080160C2:
	bx lr
