	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrTogiEndPROC
NewEkrTogiEndPROC: @ 0x08055734
	push {lr}
	ldr r0, _08055748 @ =0x08B9B33C
	movs r1, #3
	bl Proc_Start
	bl EndEkrTogiColor
	pop {r0}
	bx r0
	.align 2, 0
_08055748: .4byte 0x08B9B33C
