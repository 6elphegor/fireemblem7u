	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DDD0
sub_0807DDD0: @ 0x0807DDD0
	push {lr}
	bl InitPlayerUnitPositionsForPrepScreen
	bl SyncUnitDeploymentState
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
