	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerPhase_Suspend
PlayerPhase_Suspend: @ 0x0801C17C
	push {lr}
	ldr r1, _0801C190 @ =0x0203A85C
	movs r0, #0
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_0801C190: .4byte 0x0203A85C
