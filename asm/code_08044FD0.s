	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044FD0
sub_08044FD0: @ 0x08044FD0
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ForceSyncUnitSpriteSheet
	bl LoadLinkArenaFogPlaceholder
	bl InitSystemTextFont
	ldr r1, _08044FF8 @ =0x0203DC9C
	movs r0, #0xff
	strb r0, [r1, #3]
	pop {r0}
	bx r0
	.align 2, 0
_08044FF8: .4byte 0x0203DC9C
