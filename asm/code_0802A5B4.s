	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateActorFromBattle
UpdateActorFromBattle: @ 0x0802A5B4
	push {r4, lr}
	ldr r4, _0802A5CC @ =0x0203A3F0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r4, #0
	bl UpdateUnitFromBattle
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5CC: .4byte 0x0203A3F0
