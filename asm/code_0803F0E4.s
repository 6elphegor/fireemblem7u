	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTacticianTextConf
GetTacticianTextConf: @ 0x0803F0E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0xa
	ldr r1, _0803F0F0 @ =0x081D3C0C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0803F0F0: .4byte 0x081D3C0C
