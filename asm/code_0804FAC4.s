	.include "macro.inc"

	.syntax unified

	thumb_func_start EnableEfxWeaponIcon
EnableEfxWeaponIcon: @ 0x0804FAC4
	ldr r0, _0804FAD0 @ =0x02017774
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804FAD0: .4byte 0x02017774
