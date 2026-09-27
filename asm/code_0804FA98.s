	.include "macro.inc"

	.syntax unified

	thumb_func_start EndProcEfxWeaponIcon
EndProcEfxWeaponIcon: @ 0x0804FA98
	push {r4, lr}
	ldr r4, _0804FAB0 @ =0x02017774
	ldr r0, [r4]
	cmp r0, #0
	beq _0804FAAA
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_0804FAAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FAB0: .4byte 0x02017774
