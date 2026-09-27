	.include "macro.inc"

	.syntax unified

	thumb_func_start PutNumberBonus
PutNumberBonus: @ 0x08006240
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	beq _08006264
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x15
	bl PutSpecialChar
	adds r0, r4, #2
	cmp r5, #9
	ble _0800625C
	adds r0, r4, #4
_0800625C:
	movs r1, #4
	adds r2, r5, #0
	bl PutNumberSmall
_08006264:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
