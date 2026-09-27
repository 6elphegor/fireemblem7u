	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitBestWRankType
GetUnitBestWRankType: @ 0x0802EAC0
	push {r4, lr}
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	movs r1, #0
	adds r4, r0, #0
	adds r4, #0x28
_0802EACE:
	cmp r1, #4
	beq _0802EADE
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _0802EADE
	adds r2, r0, #0
	adds r3, r1, #0
_0802EADE:
	adds r1, #1
	cmp r1, #7
	ble _0802EACE
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
