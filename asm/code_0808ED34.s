	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenu_ResetBmUiEffect
AtMenu_ResetBmUiEffect: @ 0x0808ED34
	push {r4, lr}
	adds r4, r0, #0
	bl ReorderPlayerUnitsBasedOnDeployment
	adds r4, #0x36
	ldrb r0, [r4]
	cmp r0, #0
	beq _0808ED4A
	bl EndPrepScreen
	b _0808ED58
_0808ED4A:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808ED58
	bl sub_0803DA24
_0808ED58:
	bl SyncUnitDeploymentState
	bl ResetUnitSprites
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
