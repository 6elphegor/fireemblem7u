	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattleExecTriangleAtk
ekrBattleExecTriangleAtk: @ 0x0804B6FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B714 @ =0x0203E0A0
	ldr r0, [r0]
	cmp r0, #0
	beq _0804B720
	ldr r0, _0804B718 @ =0x02000000
	ldr r0, [r0, #8]
	bl NewEkrTriangle
	ldr r0, _0804B71C @ =ekrBattleWaitTriangleIdle
	b _0804B722
	.align 2, 0
_0804B714: .4byte 0x0203E0A0
_0804B718: .4byte 0x02000000
_0804B71C: .4byte ekrBattleWaitTriangleIdle
_0804B720:
	ldr r0, _0804B72C @ =ekrBattleTriggerNewRoundStart
_0804B722:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B72C: .4byte ekrBattleTriggerNewRoundStart
