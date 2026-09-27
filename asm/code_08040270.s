	.include "macro.inc"

	.syntax unified

	thumb_func_start SioPostBattleMusic_PlayStandardBgm
SioPostBattleMusic_PlayStandardBgm: @ 0x08040270
	push {lr}
	movs r0, #0x2e
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	pop {r0}
	bx r0
