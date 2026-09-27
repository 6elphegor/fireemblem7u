	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxRestWINH_
NewEfxRestWINH_: @ 0x08055E14
	push {lr}
	adds r3, r2, #0
	movs r2, #0
	bl NewEfxRestWINH
	pop {r0}
	bx r0
	.align 2, 0
