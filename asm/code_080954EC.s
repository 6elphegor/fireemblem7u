	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemUseClearSubBox
PrepItemUseClearSubBox: @ 0x080954EC
	push {lr}
	ldr r0, _08095504 @ =0x02023FC2
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08095504: .4byte 0x02023FC2
