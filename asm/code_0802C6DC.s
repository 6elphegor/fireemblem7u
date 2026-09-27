	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C6DC
sub_0802C6DC: @ 0x0802C6DC
	push {lr}
	ldr r0, _0802C704 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	bl GetUnitMu
	bl EndMu
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	pop {r1}
	bx r1
	.align 2, 0
_0802C704: .4byte 0x0203A85C
