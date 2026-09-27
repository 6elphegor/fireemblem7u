	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBattleAnimStatusChgHitEffects
StartBattleAnimStatusChgHitEffects: @ 0x080503E0
	push {r4, lr}
	adds r4, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080503F8
	ldr r0, _080503F4 @ =0x02000000
	ldr r0, [r0]
	b _080503FC
	.align 2, 0
_080503F4: .4byte 0x02000000
_080503F8:
	ldr r0, _08050408 @ =0x02000000
	ldr r0, [r0, #8]
_080503FC:
	cmp r4, #0
	beq _0805040C
	cmp r4, #1
	beq _08050412
	b _08050416
	.align 2, 0
_08050408: .4byte 0x02000000
_0805040C:
	bl NewEfxStatusCHG
	b _08050416
_08050412:
	bl NewEfxAvoid
_08050416:
	pop {r4}
	pop {r0}
	bx r0
