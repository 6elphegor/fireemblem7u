	.include "macro.inc"

	.syntax unified

	thumb_func_start BeginAnimsOnBattleAnimations
BeginAnimsOnBattleAnimations: @ 0x080509A4
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _080509B4
	bl BeginAnimsOnBattle_Arena
	b _080509F4
_080509B4:
	bl CheckBanimHensei
	cmp r0, #1
	bne _080509C2
	bl BeginAnimsOnBattle_Hensei
	b _080509F4
_080509C2:
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl GetBanimInitPosReal
	ldr r1, _080509F8 @ =0x02017744
	str r0, [r1]
	bl NewEkrBattleStarting
	ldr r0, _080509FC @ =0x02000000
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	ldr r0, _08050A00 @ =0x02000010
	str r1, [r0]
	str r1, [r0, #4]
	ldr r0, _08050A04 @ =MainUpdate_8055C68
	bl SetMainFunc
	movs r0, #0
	bl SetOnHBlankA
_080509F4:
	pop {r0}
	bx r0
	.align 2, 0
_080509F8: .4byte 0x02017744
_080509FC: .4byte 0x02000000
_08050A00: .4byte 0x02000010
_08050A04: .4byte MainUpdate_8055C68
