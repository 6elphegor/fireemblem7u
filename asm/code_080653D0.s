	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_InBattleIDLE
EkrDragon_InBattleIDLE: @ 0x080653D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0806541E
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x68]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	ldr r0, [r4, #0x50]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl CheckEfxDragonDeadFallHead
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08065410
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonBodyBlack
	b _08065416
_08065410:
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonTunk
_08065416:
	str r0, [r4, #0x50]
	adds r0, r4, #0
	bl Proc_Break
_0806541E:
	pop {r4}
	pop {r0}
	bx r0
