	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046F98
sub_08046F98: @ 0x08046F98
	push {lr}
	ldr r0, _08046FC4 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl RenderMap
	bl SetupBanim
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046FC8
	movs r0, #1
	bl SetBanimLinkArenaFlag
	bl BeginAnimsOnBattleAnimations
	b _08046FDE
	.align 2, 0
_08046FC4: .4byte 0x02023C60
_08046FC8:
	bl EndAllMus
	bl RenderMap
	bl StartBattleManim
	ldr r0, _08046FE4 @ =0x0203A3D8
	movs r1, #0x80
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_08046FDE:
	pop {r0}
	bx r0
	.align 2, 0
_08046FE4: .4byte 0x0203A3D8
