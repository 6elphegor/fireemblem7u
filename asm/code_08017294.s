	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemUses
GetItemUses: @ 0x08017294
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080172B4 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080172B8
	asrs r0, r2, #8
	b _080172BA
	.align 2, 0
_080172B4: .4byte 0x08BE222C
_080172B8:
	movs r0, #0xff
_080172BA:
	bx lr
