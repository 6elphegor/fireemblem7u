	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxPartsofScroll2
NewEfxPartsofScroll2: @ 0x08069B90
	push {lr}
	ldr r0, _08069BA4 @ =0x08BDB6CC
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_08069BA4: .4byte 0x08BDB6CC
