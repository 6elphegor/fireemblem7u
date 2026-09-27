	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F38C
sub_0802F38C: @ 0x0802F38C
	push {lr}
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	pop {r1}
	bx r1
	.align 2, 0
