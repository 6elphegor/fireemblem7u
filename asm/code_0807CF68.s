	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CF68
sub_0807CF68: @ 0x0807CF68
	push {lr}
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0
