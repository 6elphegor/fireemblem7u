	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckBattleHasHit
CheckBattleHasHit: @ 0x08053214
	ldr r1, _08053224 @ =0x0203A4F0
	movs r0, #2
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _08053228
	movs r0, #0
	b _0805322A
	.align 2, 0
_08053224: .4byte 0x0203A4F0
_08053228:
	movs r0, #1
_0805322A:
	bx lr
