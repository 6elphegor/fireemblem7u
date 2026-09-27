	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D7B4
sub_0807D7B4: @ 0x0807D7B4
	push {r4, lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D7D8
	movs r0, #0x84
	bl GetUnitFromCharId
	adds r4, r0, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl StartMu
	bl StartMuDeathFade
_0807D7D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
