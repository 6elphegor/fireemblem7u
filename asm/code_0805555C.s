	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805555C
sub_0805555C: @ 0x0805555C
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0805556C
	movs r0, #0x8e
	bl DoM4aSongNumStop
_0805556C:
	pop {r0}
	bx r0
