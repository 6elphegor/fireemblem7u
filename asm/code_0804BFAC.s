	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattlePrepareEnding
EkrBattlePrepareEnding: @ 0x0804BFAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0804BFDC @ =0x02000000
	ldr r0, [r4]
	bl EndEfxStatusUnits
	ldr r0, [r4, #8]
	bl EndEfxStatusUnits
	bl EndProcEfxWeaponIcon
	bl EndEfxHPBarColorChange
	ldr r0, _0804BFE0 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	str r0, [r5, #0x44]
	movs r0, #0
	str r0, [r5, #0x48]
	ldr r0, _0804BFE4 @ =EkrBattleStartDragonEnding
	str r0, [r5, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFDC: .4byte 0x02000000
_0804BFE0: .4byte 0x0203E00C
_0804BFE4: .4byte EkrBattleStartDragonEnding
