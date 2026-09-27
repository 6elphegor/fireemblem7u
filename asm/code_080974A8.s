	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080974A8
sub_080974A8: @ 0x080974A8
	push {r4, lr}
	ldr r4, _080974C8 @ =0x03004690
	ldr r0, [r4]
	cmp r0, #0
	beq _080974C0
	bl HideUnitSprite
	ldr r0, [r4]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
_080974C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080974C8: .4byte 0x03004690
