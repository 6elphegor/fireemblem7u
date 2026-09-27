	.include "macro.inc"

	.syntax unified

	thumb_func_start NormalizeWaterMinimapTerrain
NormalizeWaterMinimapTerrain: @ 0x080A20F0
	cmp r0, #0x17
	beq _080A2106
	cmp r0, #0x17
	bgt _080A20FE
	cmp r0, #0
	beq _080A2106
	b _080A2108
_080A20FE:
	cmp r0, #0x1a
	beq _080A2106
	cmp r0, #0x3f
	bne _080A2108
_080A2106:
	movs r0, #0x3c
_080A2108:
	bx lr
	.align 2, 0
