	.include "macro.inc"

	.syntax unified

	thumb_func_start DragonFlameImpact_End
DragonFlameImpact_End: @ 0x0807EB20
	push {lr}
	ldr r0, _0807EB34 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807EB34: .4byte 0x02023C60
