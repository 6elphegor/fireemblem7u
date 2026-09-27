	.include "macro.inc"

	.syntax unified

	thumb_func_start EventCall_PutFallNinian
EventCall_PutFallNinian: @ 0x0807D9CC
	push {lr}
	movs r0, #0xda
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0807D9E0
	bl ShowUnitSprite
	bl EndEachSpriteAnimProc
_0807D9E0:
	pop {r0}
	bx r0
