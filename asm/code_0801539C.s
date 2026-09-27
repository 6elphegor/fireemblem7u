	.include "macro.inc"

	.syntax unified

	thumb_func_start BmMain_ChangePhase
BmMain_ChangePhase: @ 0x0801539C
	push {lr}
	bl ClearActiveFactionGrayedStates
	bl RefreshUnitSprites
	bl HandleChangePhase
	bl CheckAvailableTurnEvent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080153BA
	movs r0, #1
	b _080153C0
_080153BA:
	bl StartAvailableTurnEvents
	movs r0, #0
_080153C0:
	pop {r1}
	bx r1
