	.include "macro.inc"

	.syntax unified

	thumb_func_start BmMain_ResumePlayerPhase
BmMain_ResumePlayerPhase: @ 0x08015434
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08015454 @ =0x08B93374
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r1, #7
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015454: .4byte 0x08B93374
