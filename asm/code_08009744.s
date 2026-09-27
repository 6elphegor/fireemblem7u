	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTalkPauseCmdDuration
GetTalkPauseCmdDuration: @ 0x08009744
	ldr r1, _08009750 @ =0x08B90B7C
	subs r0, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08009750: .4byte 0x08B90B7C
