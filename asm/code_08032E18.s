	.include "macro.inc"

	.syntax unified

	thumb_func_start TerrainHealDisplay_Init
TerrainHealDisplay_Init: @ 0x08032E18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08032E34 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	bl MakeTerrainHealTargetList
	bl CountTargets
	cmp r0, #0
	bne _08032E38
	adds r0, r4, #0
	bl Proc_End
	b _08032E40
	.align 2, 0
_08032E34: .4byte 0x0202BBF8
_08032E38:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_08032E40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
