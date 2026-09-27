	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugMenu_ErasedEffect
DebugMenu_ErasedEffect: @ 0x0801B8BC
	push {lr}
	bl ClearUi
	ldr r0, _0801B8D0 @ =0x08B95848
	bl StartMenu
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_0801B8D0: .4byte 0x08B95848
