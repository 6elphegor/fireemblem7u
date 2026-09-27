	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TutorialCursors
EvtCmd_TutorialCursors: @ 0x0800FD60
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800FD72
	movs r0, #1
	bl StartTutorialCursors
	b _0800FD76
_0800FD72:
	bl StartTutorialCursors
_0800FD76:
	movs r0, #0
	pop {r1}
	bx r1
