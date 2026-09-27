	.include "macro.inc"

	.syntax unified

	thumb_func_start EndLinkArenaFogPlaceholders
EndLinkArenaFogPlaceholders: @ 0x08046B5C
	push {lr}
	ldr r0, _08046B68 @ =0x08B99CB8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08046B68: .4byte 0x08B99CB8
