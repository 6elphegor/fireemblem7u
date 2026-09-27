	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802155C
sub_0802155C: @ 0x0802155C
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _0802156E
	bl sub_080B2F28
	movs r0, #0x17
	b _08021576
_0802156E:
	ldr r1, _0802157C @ =0x0000074D
	bl MenuFrozenHelpBox
	movs r0, #8
_08021576:
	pop {r1}
	bx r1
	.align 2, 0
_0802157C: .4byte 0x0000074D
