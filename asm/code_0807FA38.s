	.include "macro.inc"

	.syntax unified

	thumb_func_start InitStatScreenText
InitStatScreenText: @ 0x0807FA38
	push {lr}
	ldr r0, _0807FA44 @ =0x08CC1C74
	bl InitTextList
	pop {r0}
	bx r0
	.align 2, 0
_0807FA44: .4byte 0x08CC1C74
