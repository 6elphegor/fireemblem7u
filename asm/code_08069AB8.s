	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_OnEnd
EkrLvup_OnEnd: @ 0x08069AB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069AEC @ =0x020200D0
	ldr r0, [r0]
	bl Proc_End
	ldr r0, _08069AF0 @ =0x020200D4
	ldr r0, [r0]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl EnableEfxStatusUnits
	ldr r0, [r4, #0x60]
	bl EnableEfxStatusUnits
	bl EnableEfxWeaponIcon
	bl EnableEfxHpBarColorChange
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069AEC: .4byte 0x020200D0
_08069AF0: .4byte 0x020200D4
