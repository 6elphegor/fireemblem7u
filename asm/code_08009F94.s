	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkFaceNoMouthMove
SetTalkFaceNoMouthMove: @ 0x08009F94
	push {lr}
	movs r1, #0
	bl SetTalkFaceDisp
	pop {r0}
	bx r0
