	.include "macro.inc"

	.syntax unified

	thumb_func_start IsItemStealable
IsItemStealable: @ 0x08016D38
	adds r1, r0, #0
	cmp r1, #0
	bne _08016D42
	movs r1, #0xff
	b _08016D52
_08016D42:
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016D5C @ =0x08BE222C
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_08016D52:
	movs r0, #0
	cmp r1, #9
	bne _08016D5A
	movs r0, #1
_08016D5A:
	bx lr
	.align 2, 0
_08016D5C: .4byte 0x08BE222C
