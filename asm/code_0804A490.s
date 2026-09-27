	.include "macro.inc"

	.syntax unified

	thumb_func_start EndAllMenus
EndAllMenus: @ 0x0804A490
	push {lr}
	ldr r0, _0804A4A0 @ =0x08B9A8A0
	ldr r1, _0804A4A4 @ =EndMenu
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_0804A4A0: .4byte 0x08B9A8A0
_0804A4A4: .4byte EndMenu
