	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonBg2ScrollHandler
NewEkrDragonBg2ScrollHandler: @ 0x08065B90
	push {lr}
	ldr r0, _08065BA4 @ =0x08BD94A0
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r1}
	bx r1
	.align 2, 0
_08065BA4: .4byte 0x08BD94A0
