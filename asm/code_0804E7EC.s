	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxHitQuakePure
NewEfxHitQuakePure: @ 0x0804E7EC
	push {lr}
	ldr r0, _0804E7FC @ =0x08B9AE04
	movs r1, #3
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_0804E7FC: .4byte 0x08B9AE04
