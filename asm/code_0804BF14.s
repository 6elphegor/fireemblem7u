	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleExecEkrLvup
EkrBattleExecEkrLvup: @ 0x0804BF14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BF28 @ =0x0203E0D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0804BF30
	ldr r0, _0804BF2C @ =0x02000000
	ldr r0, [r0]
	b _0804BF34
	.align 2, 0
_0804BF28: .4byte 0x0203E0D4
_0804BF2C: .4byte 0x02000000
_0804BF30:
	ldr r0, _0804BF44 @ =0x02000000
	ldr r0, [r0, #8]
_0804BF34:
	bl NewEkrLevelup
	ldr r0, _0804BF48 @ =EkrBattleWaitLvup
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF44: .4byte 0x02000000
_0804BF48: .4byte EkrBattleWaitLvup
