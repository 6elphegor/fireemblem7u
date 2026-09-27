	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrTogiInitPROC
NewEkrTogiInitPROC: @ 0x080555AC
	push {lr}
	ldr r0, _080555BC @ =0x08B9B30C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080555BC: .4byte 0x08B9B30C
