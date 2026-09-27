	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMenu
StartMenu: @ 0x0804A270
	push {lr}
	ldr r1, [r0]
	movs r2, #0
	bl StartLockingMenuExt
	pop {r1}
	bx r1
	.align 2, 0
