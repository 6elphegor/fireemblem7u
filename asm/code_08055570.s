	.include "macro.inc"

	.syntax unified

	thumb_func_start BeginAnimsOnBattle_Arena
BeginAnimsOnBattle_Arena: @ 0x08055570
	push {lr}
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl GetBanimInitPosReal
	ldr r1, _08055590 @ =0x02017744
	str r0, [r1]
	bl NewEkrTogiInitPROC
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_08055590: .4byte 0x02017744
