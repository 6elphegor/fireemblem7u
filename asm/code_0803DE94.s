	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLinkArenaTeamList
StartLinkArenaTeamList: @ 0x0803DE94
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803DEA4 @ =0x08B98CB4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0803DEA4: .4byte 0x08B98CB4
