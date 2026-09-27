	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseAttack
CanUnitUseAttack: @ 0x08031384
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r0, _080313BC @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _080313C0 @ =0x03004690
	ldr r0, [r4]
	bl GenerateUnitCompleteAttackRange
	ldr r1, _080313C4 @ =0x02033E40
	ldr r0, [r4]
	str r0, [r1]
	ldr r0, _080313C8 @ =AddUnitToTargetListIfNotAllied
	bl ForEachUnitInRange
	bl CountTargets
	cmp r0, #0
	beq _080313B6
	movs r0, #1
_080313B6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080313BC: .4byte 0x0202E3E8
_080313C0: .4byte 0x03004690
_080313C4: .4byte 0x02033E40
_080313C8: .4byte AddUnitToTargetListIfNotAllied
