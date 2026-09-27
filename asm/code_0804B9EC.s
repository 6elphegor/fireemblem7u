	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattle_WaitForPostBattleAct
ekrBattle_WaitForPostBattleAct: @ 0x0804B9EC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _0804BA24
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _0804BA20
	ldr r0, _0804BA18 @ =0x0203E0D4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmn r1, r0
	beq _0804BA20
	ldr r0, _0804BA1C @ =ekrBattleExecExpGain
	b _0804BA22
	.align 2, 0
_0804BA18: .4byte 0x0203E0D4
_0804BA1C: .4byte ekrBattleExecExpGain
_0804BA20:
	ldr r0, _0804BA2C @ =EkrBattleExecPopup
_0804BA22:
	str r0, [r4, #0xc]
_0804BA24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA2C: .4byte EkrBattleExecPopup
