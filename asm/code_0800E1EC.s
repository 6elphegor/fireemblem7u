	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ClearState
EvtCmd_ClearState: @ 0x0800E1EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #8]
	ldr r1, [r0, #0xc]
	bics r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
