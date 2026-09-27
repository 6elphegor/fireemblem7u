	.include "macro.inc"

	.syntax unified

	thumb_func_start IsWeaponMagic
IsWeaponMagic: @ 0x0802EBE4
	cmp r0, #0
	blt _0802EBFA
	cmp r0, #3
	bgt _0802EBF0
	movs r0, #0
	b _0802EBFA
_0802EBF0:
	cmp r0, #7
	bgt _0802EBFA
	cmp r0, #5
	blt _0802EBFA
	movs r0, #1
_0802EBFA:
	bx lr
