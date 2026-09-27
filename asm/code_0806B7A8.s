	.include "macro.inc"

	.syntax unified

	thumb_func_start BeginAnimsOnBattle_Hensei
BeginAnimsOnBattle_Hensei: @ 0x0806B7A8
	push {lr}
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl GetBanimInitPosReal
	ldr r1, _0806B7C8 @ =0x02017744
	str r0, [r1]
	bl NewEkrHenseiInitPROC
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0806B7C8: .4byte 0x02017744
