	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLockingMenu
StartLockingMenu: @ 0x0804A254
	push {lr}
	adds r2, r1, #0
	ldr r1, [r0]
	bl StartLockingMenuExt
	pop {r1}
	bx r1
	.align 2, 0
