	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DA68
sub_0807DA68: @ 0x0807DA68
	push {lr}
	movs r0, #0x37
	bl GetUnitFromCharId
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0807DA86
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bgt _0807DA86
	movs r0, #1
	b _0807DA88
_0807DA86:
	movs r0, #0
_0807DA88:
	pop {r1}
	bx r1
