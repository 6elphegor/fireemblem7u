	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattle_8050600
ekrBattle_8050600: @ 0x0804B968
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804B9D4 @ =0x02017728
	ldr r0, [r0]
	cmp r0, #0
	bne _0804B9CE
	ldr r0, _0804B9D8 @ =0x02017738
	ldr r4, [r0]
	cmp r4, #0
	bne _0804B9CE
	bl sub_08051BD0
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _0804B9CE
	strh r4, [r5, #0x2c]
	ldr r0, _0804B9DC @ =ekrBattle_WaitForPostBattleAct
	str r0, [r5, #0xc]
	ldr r4, _0804B9E0 @ =0x02000000
	ldr r0, [r4]
	bl CheckEfxDragonDeadFallHead
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B9CE
	ldr r0, _0804B9E4 @ =0x0203E0D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #1
	cmp r0, #0
	beq _0804B9AA
	movs r2, #0
_0804B9AA:
	ldr r3, _0804B9E8 @ =0x02017744
	ldr r0, [r3]
	adds r1, r5, #0
	adds r1, #0x29
	cmp r2, r0
	beq _0804B9B8
	strb r6, [r1]
_0804B9B8:
	ldrb r1, [r1]
	cmp r1, #1
	bne _0804B9CE
	ldr r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0804B9CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B9D4: .4byte 0x02017728
_0804B9D8: .4byte 0x02017738
_0804B9DC: .4byte ekrBattle_WaitForPostBattleAct
_0804B9E0: .4byte 0x02000000
_0804B9E4: .4byte 0x0203E0D4
_0804B9E8: .4byte 0x02017744
