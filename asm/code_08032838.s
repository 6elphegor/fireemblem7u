	.include "macro.inc"

	.syntax unified

	thumb_func_start RenderMapForFogFadeIfUnitDied
RenderMapForFogFadeIfUnitDied: @ 0x08032838
	push {lr}
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0803284E
	ldr r0, _08032854 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0803284E
	bl RenderMapForFade
_0803284E:
	pop {r0}
	bx r0
	.align 2, 0
_08032854: .4byte 0x0202BBF8
