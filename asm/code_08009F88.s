	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkFaceMouthMove
SetTalkFaceMouthMove: @ 0x08009F88
	push {lr}
	movs r1, #0x10
	bl SetTalkFaceDisp
	pop {r0}
	bx r0
