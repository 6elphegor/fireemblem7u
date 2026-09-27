	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTalkFace
StartTalkFace: @ 0x08008F18
	push {r4, lr}
	ldr r4, [sp, #8]
	bl StartFaceAuto
	ldr r1, _08008F34 @ =0x08B909B8
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #0x18
	adds r1, r1, r4
	str r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008F34: .4byte 0x08B909B8
