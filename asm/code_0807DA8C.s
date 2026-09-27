	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DA8C
sub_0807DA8C: @ 0x0807DA8C
	push {lr}
	movs r0, #9
	bl GetUnitFromCharId
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807DAA0
	movs r1, #1
_0807DAA0:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
