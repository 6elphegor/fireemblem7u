	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattle_Main
EkrBattle_Main: @ 0x0804B43C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _0804B484
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _0804B47C
	ldr r0, [r4, #0x54]
	cmp r0, #1
	beq _0804B462
	ldr r0, [r4, #0x58]
	cmp r0, #1
	bne _0804B47C
_0804B462:
	movs r0, #1
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	ldr r0, _0804B478 @ =EkrBattleStartBattleQuote
	b _0804B47E
	.align 2, 0
_0804B478: .4byte EkrBattleStartBattleQuote
_0804B47C:
	ldr r0, _0804B48C @ =EkrBattlePreDragonIntro
_0804B47E:
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_0804B484:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B48C: .4byte EkrBattlePreDragonIntro
