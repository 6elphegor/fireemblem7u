	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMenuExt
StartMenuExt: @ 0x0804A264
	push {lr}
	movs r2, #0
	bl StartLockingMenuExt
	pop {r1}
	bx r1
