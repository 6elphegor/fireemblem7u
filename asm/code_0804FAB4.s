	.include "macro.inc"

	.syntax unified

	thumb_func_start DisableEfxWeaponIcon
DisableEfxWeaponIcon: @ 0x0804FAB4
	ldr r0, _0804FAC0 @ =0x02017774
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804FAC0: .4byte 0x02017774
