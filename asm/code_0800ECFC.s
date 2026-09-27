	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearTalk
ClearTalk: @ 0x0800ECFC
	push {lr}
	bl ClearTalkBubble
	ldr r0, _0800ED14 @ =0x08B907C0
	bl Proc_EndEach
	bl InitFaces
	bl ClearTalkFaceRefs
	pop {r0}
	bx r0
	.align 2, 0
_0800ED14: .4byte 0x08B907C0
