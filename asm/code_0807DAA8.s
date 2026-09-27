	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DAA8
sub_0807DAA8: @ 0x0807DAA8
	push {lr}
	movs r0, #0x37
	bl GetUnitFromCharId
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807DABC
	movs r1, #1
_0807DABC:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
