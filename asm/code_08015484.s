	.include "macro.inc"

	.syntax unified

	thumb_func_start BmMain_SuspendBeforePhase
BmMain_SuspendBeforePhase: @ 0x08015484
	push {lr}
	ldr r1, _08015498 @ =0x0203A85C
	movs r0, #9
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_08015498: .4byte 0x0203A85C
