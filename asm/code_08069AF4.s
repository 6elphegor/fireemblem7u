	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxPartsofScroll
NewEfxPartsofScroll: @ 0x08069AF4
	push {lr}
	ldr r0, _08069B08 @ =0x08BDB6AC
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_08069B08: .4byte 0x08BDB6AC
