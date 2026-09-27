	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801CD50
sub_0801CD50: @ 0x0801CD50
	push {lr}
	ldr r0, _0801CD78 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0801CD74
	ldr r1, _0801CD7C @ =0x0203A85C
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl EndAllMus
_0801CD74:
	pop {r0}
	bx r0
	.align 2, 0
_0801CD78: .4byte 0x0202BBF8
_0801CD7C: .4byte 0x0203A85C
