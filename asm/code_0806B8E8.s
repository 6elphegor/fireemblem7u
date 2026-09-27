	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrHenseiEnd
NewEkrHenseiEnd: @ 0x0806B8E8
	push {lr}
	ldr r0, _0806B8F8 @ =0x08BDCE24
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806B8F8: .4byte 0x08BDCE24
