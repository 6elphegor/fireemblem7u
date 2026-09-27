	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrHenseiInitPROC
NewEkrHenseiInitPROC: @ 0x0806B7E4
	push {lr}
	ldr r0, _0806B7F4 @ =0x08BDCDF4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806B7F4: .4byte 0x08BDCDF4
