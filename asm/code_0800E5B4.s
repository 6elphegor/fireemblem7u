	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetMap
EvtCmd_SetMap: @ 0x0800E5B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0800E5FC @ =0x0202BBF8
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	strb r0, [r1, #0xe]
	bl RestartBattleMap
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	lsls r0, r0, #4
	bl GetCameraCenteredX
	ldr r5, _0800E600 @ =0x0202BBB8
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0xc]
	lsls r0, r0, #4
	bl GetCameraCenteredY
	strh r0, [r5, #0xe]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E5FC: .4byte 0x0202BBF8
_0800E600: .4byte 0x0202BBB8
