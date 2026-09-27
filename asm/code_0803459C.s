	.include "macro.inc"

	.syntax unified

	thumb_func_start ExecTrapAfterDropAction
ExecTrapAfterDropAction: @ 0x0803459C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl GetPickTrapType
	cmp r0, #0
	beq _080345BC
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080345D4
_080345BC:
	adds r0, r4, #0
	bl GetUnitMu
	bl EndMu
	bl RenderMap
	bl RefreshEntityMaps
	bl ForceSyncUnitSpriteSheet
	movs r0, #1
_080345D4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
