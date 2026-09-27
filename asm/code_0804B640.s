	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattlePostDragonIntro
EkrBattlePostDragonIntro: @ 0x0804B640
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B66C @ =0x0203E00C
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _0804B670 @ =0x02017744
	ldr r0, [r0]
	cmp r1, r0
	beq _0804B67C
	ldr r1, _0804B674 @ =0x02000000
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0804B678 @ =ekrBattle_8050290
	b _0804B67E
	.align 2, 0
_0804B66C: .4byte 0x0203E00C
_0804B670: .4byte 0x02017744
_0804B674: .4byte 0x02000000
_0804B678: .4byte ekrBattle_8050290
_0804B67C:
	ldr r0, _0804B688 @ =ekrBattleSetFlashingEffect
_0804B67E:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B688: .4byte ekrBattleSetFlashingEffect
