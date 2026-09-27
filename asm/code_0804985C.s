	.include "macro.inc"

	.syntax unified

	thumb_func_start MultiBootStartProbe
MultiBootStartProbe: @ 0x0804985C
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _0804986E
	adds r0, r1, #0
	bl MultiBootInit
	b _0804987A
_0804986E:
	adds r2, r1, #0
	adds r2, #0x4a
	strb r0, [r2]
	strb r0, [r1, #0x1e]
	movs r0, #1
	strb r0, [r1, #0x18]
_0804987A:
	pop {r0}
	bx r0
	.align 2, 0
