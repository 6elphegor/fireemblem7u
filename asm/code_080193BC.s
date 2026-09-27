	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTrueTerrainAt
GetTrueTerrainAt: @ 0x080193BC
	ldr r2, _080193D8 @ =0x08B932B4
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r1, r0, #2
	ldr r0, _080193DC @ =0x08B932B0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080193D8: .4byte 0x08B932B4
_080193DC: .4byte 0x08B932B0
