	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemSpdBonus
GetItemSpdBonus: @ 0x080160C4
	adds r1, r0, #0
	cmp r1, #0
	beq _080160DE
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080160E4 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080160E8
_080160DE:
	movs r0, #0
	b _080160EE
	.align 2, 0
_080160E4: .4byte 0x08BE222C
_080160E8:
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080160EE:
	bx lr
