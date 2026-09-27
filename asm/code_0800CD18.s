	.include "macro.inc"

	.syntax unified

	thumb_func_start WaitForMu_OnLoop
WaitForMu_OnLoop: @ 0x0800CD18
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x54]
	adds r0, r4, #0
	bl IsMuActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800CD5E
	adds r0, r4, #0
	bl EndMu
	ldr r4, [r4, #0x2c]
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
	adds r0, r4, #0
	bl UnitSyncMovement
	adds r0, r4, #0
	bl ShowUnitSprite
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	adds r0, r5, #0
	bl Proc_Break
_0800CD5E:
	pop {r4, r5}
	pop {r0}
	bx r0
