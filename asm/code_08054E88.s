	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxAnimeDrvProc
NewEfxAnimeDrvProc: @ 0x08054E88
	push {r4, lr}
	ldr r4, _08054EA0 @ =0x0201FB0C
	ldr r0, _08054EA4 @ =0x08B9B2DC
	movs r1, #4
	bl Proc_Start
	str r0, [r4]
	bl AnimClearAll
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054EA0: .4byte 0x0201FB0C
_08054EA4: .4byte 0x08B9B2DC
