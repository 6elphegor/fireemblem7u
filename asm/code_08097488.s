	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097488
sub_08097488: @ 0x08097488
	push {r4, lr}
	ldr r4, _080974A4 @ =0x03004690
	ldr r0, [r4]
	cmp r0, #0
	beq _0809749C
	bl EndAllMus
	ldr r0, [r4]
	bl ShowUnitSprite
_0809749C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080974A4: .4byte 0x03004690
