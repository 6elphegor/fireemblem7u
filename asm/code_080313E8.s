	.include "macro.inc"

	.syntax unified

	thumb_func_start CanActiveUnitUseTrade
CanActiveUnitUseTrade: @ 0x080313E8
	push {lr}
	ldr r0, _08031400 @ =0x03004690
	ldr r0, [r0]
	bl MakeTradeTargetList
	bl CountTargets
	cmp r0, #0
	beq _080313FC
	movs r0, #1
_080313FC:
	pop {r1}
	bx r1
	.align 2, 0
_08031400: .4byte 0x03004690
