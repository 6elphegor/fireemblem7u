	.include "macro.inc"

	.syntax unified

	thumb_func_start BeginBattleAnimations
BeginBattleAnimations: @ 0x0802A3B0
	push {lr}
	ldr r0, _0802A3E4 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r1, _0802A3E8 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	bl RenderMap
	bl SetupBanim
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A3EC
	movs r0, #0
	bl SetBanimLinkArenaFlag
	bl BeginAnimsOnBattleAnimations
	b _0802A402
	.align 2, 0
_0802A3E4: .4byte 0x02023C60
_0802A3E8: .4byte 0x02022860
_0802A3EC:
	bl EndAllMus
	bl RenderMap
	bl StartBattleManim
	ldr r1, _0802A408 @ =0x0203A3D8
	movs r0, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
_0802A402:
	pop {r0}
	bx r0
	.align 2, 0
_0802A408: .4byte 0x0203A3D8
