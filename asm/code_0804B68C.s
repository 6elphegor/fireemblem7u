	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattle_8050290
ekrBattle_8050290: @ 0x0804B68C
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0804B6A0
	ldr r0, _0804B6A4 @ =ekrBattleSetFlashingEffect
	str r0, [r1, #0xc]
_0804B6A0:
	bx lr
	.align 2, 0
_0804B6A4: .4byte ekrBattleSetFlashingEffect
