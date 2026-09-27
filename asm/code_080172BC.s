	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemMaxUses
GetItemMaxUses: @ 0x080172BC
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080172D8 @ =0x08BE222C
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080172DC
	ldrb r0, [r2, #0x14]
	b _080172DE
	.align 2, 0
_080172D8: .4byte 0x08BE222C
_080172DC:
	movs r0, #0xff
_080172DE:
	bx lr
