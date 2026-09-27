	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DDD0
sub_0807DDD0: @ 0x0807DDD0
	push {lr}
	bl sub_0800F0C8
	bl SyncUnitDeploymentState
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
