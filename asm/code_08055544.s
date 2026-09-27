	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayDeathSoundForArena
PlayDeathSoundForArena: @ 0x08055544
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _08055558
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8f
	bl EfxPlaySE
_08055558:
	pop {r0}
	bx r0
