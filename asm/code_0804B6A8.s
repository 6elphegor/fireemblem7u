	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattleSetFlashingEffect
ekrBattleSetFlashingEffect: @ 0x0804B6A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0804B6EC @ =0x02000000
	ldr r0, [r4]
	bl NewEfxStatusUnit
	ldr r0, [r4, #8]
	bl NewEfxStatusUnit
	ldr r1, _0804B6F0 @ =0x0203E0E4
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl NewEfxWeaponIcon
	ldr r1, _0804B6F4 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0804B6DA
	ldr r0, [r4]
	bl DisableEfxStatusUnits
_0804B6DA:
	ldr r0, [r4]
	bl NewEfxHpBarColorChange
	ldr r0, _0804B6F8 @ =ekrBattleExecTriangleAtk
	str r0, [r5, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B6EC: .4byte 0x02000000
_0804B6F0: .4byte 0x0203E0E4
_0804B6F4: .4byte 0x0203A3D8
_0804B6F8: .4byte ekrBattleExecTriangleAtk
