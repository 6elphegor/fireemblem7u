	.include "macro.inc"

	.syntax unified

	thumb_func_start GetWeaponLevelFromExp
GetWeaponLevelFromExp: @ 0x08016948
	cmp r0, #0
	bgt _08016950
	movs r0, #0
	b _0801697A
_08016950:
	cmp r0, #0x1e
	bgt _08016958
	movs r0, #1
	b _0801697A
_08016958:
	cmp r0, #0x46
	bgt _08016960
	movs r0, #2
	b _0801697A
_08016960:
	cmp r0, #0x78
	bgt _08016968
	movs r0, #3
	b _0801697A
_08016968:
	cmp r0, #0xb4
	bgt _08016970
	movs r0, #4
	b _0801697A
_08016970:
	cmp r0, #0xfa
	ble _08016978
	movs r0, #6
	b _0801697A
_08016978:
	movs r0, #5
_0801697A:
	bx lr
