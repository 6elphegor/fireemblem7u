	.include "macro.inc"

	.syntax unified

	thumb_func_start Screen2Pan
Screen2Pan: @ 0x08014D58
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _08014D66
	movs r0, #0x60
	rsbs r0, r0, #0
	b _08014D7C
_08014D66:
	cmp r1, #0xef
	bgt _08014D7A
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	movs r1, #0xf0
	bl Div
	subs r0, #0x60
	b _08014D7C
_08014D7A:
	movs r0, #0x5f
_08014D7C:
	pop {r1}
	bx r1
