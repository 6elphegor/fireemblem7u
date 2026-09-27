	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08032C04
sub_08032C04: @ 0x08032C04
	push {lr}
	ldr r0, _08032C14 @ =0x03004690
	ldr r0, [r0]
	bl ShowUnitSprite
	pop {r0}
	bx r0
	.align 2, 0
_08032C14: .4byte 0x03004690
