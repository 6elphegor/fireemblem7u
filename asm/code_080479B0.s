	.include "macro.inc"

	.syntax unified

	thumb_func_start SioWarpFx_ShowMoveUnit
SioWarpFx_ShowMoveUnit: @ 0x080479B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080479C4
	ldr r0, [r4, #0x30]
	bl SetMuFacing
_080479C4:
	ldr r0, [r4, #0x30]
	bl ShowMu
	pop {r4}
	pop {r0}
	bx r0
