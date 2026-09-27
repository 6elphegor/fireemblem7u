	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxStatusCHGMain
EfxStatusCHGMain: @ 0x0804DFFC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0804E014
	adds r0, r1, #0
	bl Proc_Break
_0804E014:
	pop {r0}
	bx r0
