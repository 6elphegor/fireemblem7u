	.include "macro.inc"

	.syntax unified

	thumb_func_start ForceDisplayDragonSprite
ForceDisplayDragonSprite: @ 0x0807E420
	push {lr}
	movs r0, #0x25
	bl GetUnitFromCharId
	adds r2, r0, #0
	cmp r2, #0
	beq _0807E436
	ldr r0, [r2, #0xc]
	ldr r1, _0807E43C @ =0xFFFEFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0807E436:
	pop {r0}
	bx r0
	.align 2, 0
_0807E43C: .4byte 0xFFFEFFFF
