	.include "macro.inc"

	.syntax unified

	thumb_func_start NormalizeSeaMinimapTerrain
NormalizeSeaMinimapTerrain: @ 0x080A2044
	cmp r0, #0x36
	beq _080A2056
	cmp r0, #0x36
	bgt _080A2052
	cmp r0, #0
	beq _080A2056
	b _080A2058
_080A2052:
	cmp r0, #0x3d
	bne _080A2058
_080A2056:
	movs r0, #0x15
_080A2058:
	bx lr
	.align 2, 0
