	.include "macro.inc"

	.syntax unified

	thumb_func_start GetLinkedTargetsFar
GetLinkedTargetsFar: @ 0x0804B14C
	push {lr}
	bl LinkTargets
	ldr r0, _0804B158 @ =0x0203DCF8
	pop {r1}
	bx r1
	.align 2, 0
_0804B158: .4byte 0x0203DCF8
