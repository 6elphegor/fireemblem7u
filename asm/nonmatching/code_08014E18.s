	.include "macro.inc"

	.syntax unified

	thumb_func_start _StartBgm
_StartBgm: @ 0x08014E18
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0
