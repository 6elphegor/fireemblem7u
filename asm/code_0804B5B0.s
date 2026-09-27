	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleExecDragonIntro
EkrBattleExecDragonIntro: @ 0x0804B5B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _0804B5C4
	ldr r0, _0804B5C0 @ =EkrBattlePostDragonIntro
	str r0, [r4, #0xc]
	b _0804B612
	.align 2, 0
_0804B5C0: .4byte EkrBattlePostDragonIntro
_0804B5C4:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0804B5F0
	ldr r0, _0804B5E8 @ =0x02000000
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804B5E2
	ldr r0, [r4, #0x5c]
	bl NewEkrDragon
	ldr r0, _0804B5EC @ =EkrBattleWaitDragonIntro
	str r0, [r4, #0xc]
_0804B5E2:
	movs r0, #1
	b _0804B60A
	.align 2, 0
_0804B5E8: .4byte 0x02000000
_0804B5EC: .4byte EkrBattleWaitDragonIntro
_0804B5F0:
	ldr r0, _0804B618 @ =0x02000000
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804B608
	ldr r0, [r4, #0x5c]
	bl NewEkrDragon
	ldr r0, _0804B61C @ =EkrBattleWaitDragonIntro
	str r0, [r4, #0xc]
_0804B608:
	movs r0, #0
_0804B60A:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
_0804B612:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B618: .4byte 0x02000000
_0804B61C: .4byte EkrBattleWaitDragonIntro
