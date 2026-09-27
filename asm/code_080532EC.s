	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleAnimRoundType
GetBattleAnimRoundType: @ 0x080532EC
	ldr r1, _08053308 @ =0x0203E036
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08053310
	ldr r0, _0805330C @ =0x00000FFF
	ands r0, r2
	b _08053312
	.align 2, 0
_08053308: .4byte 0x0203E036
_0805330C: .4byte 0x00000FFF
_08053310:
	adds r0, r1, #0
_08053312:
	bx lr
