	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxFlames_VSync
WfxFlames_VSync: @ 0x0802DC0C
	push {lr}
	bl WfxFlamesUpdateGradient
	bl WfxFlamesUpdateParticles
	pop {r0}
	bx r0
	.align 2, 0
