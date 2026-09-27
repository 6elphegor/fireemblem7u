	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleAnimArenaFlag
GetBattleAnimArenaFlag: @ 0x080554F0
	ldr r0, _080554F8 @ =0x0203E0F0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080554F8: .4byte 0x0203E0F0
