	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleUpdateBattleStats
BattleUpdateBattleStats: @ 0x08029234
	adds r3, r0, #0
	ldr r2, _08029260 @ =0x0203A3D8
	adds r0, #0x5a
	ldrh r0, [r0]
	strh r0, [r2, #6]
	adds r1, #0x5c
	ldrh r0, [r1]
	strh r0, [r2, #8]
	adds r0, r3, #0
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	adds r0, r3, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r2, #0xc]
	adds r0, r3, #0
	adds r0, #0x6c
	ldrh r0, [r0]
	strh r0, [r2, #0xe]
	bx lr
	.align 2, 0
_08029260: .4byte 0x0203A3D8
