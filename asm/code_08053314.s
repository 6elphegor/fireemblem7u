	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleAnimRoundTypeFlags
GetBattleAnimRoundTypeFlags: @ 0x08053314
	ldr r1, _08053334 @ =0x0203E036
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0805333C
	ldr r0, _08053338 @ =0xFFFFF000
	ands r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _0805333E
	.align 2, 0
_08053334: .4byte 0x0203E036
_08053338: .4byte 0xFFFFF000
_0805333C:
	movs r0, #0
_0805333E:
	bx lr
