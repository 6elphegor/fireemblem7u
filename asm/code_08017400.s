	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemIconId
GetItemIconId: @ 0x08017400
	cmp r0, #0
	beq _0801741C
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017418 @ =0x08BE222C
	adds r0, r0, r1
	ldrb r0, [r0, #0x1d]
	b _08017420
	.align 2, 0
_08017418: .4byte 0x08BE222C
_0801741C:
	movs r0, #1
	rsbs r0, r0, #0
_08017420:
	bx lr
	.align 2, 0
