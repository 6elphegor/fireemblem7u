	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D78C
sub_0807D78C: @ 0x0807D78C
	push {r4, lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D7AE
	movs r0, #0x84
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x56
	bl GetClassData
	str r0, [r4, #4]
	bl RefreshUnitSprites
_0807D7AE:
	pop {r4}
	pop {r0}
	bx r0
