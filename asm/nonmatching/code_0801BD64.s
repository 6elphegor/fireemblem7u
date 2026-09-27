	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugMenu_FogIdle
DebugMenu_FogIdle: @ 0x0801BD64
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl IsMapFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801BDB2
	ldr r0, _0801BD9C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801BDB2
	ldr r1, _0801BDA0 @ =0x0202BBF8
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	bne _0801BDA4
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	bl SetVisionWithFade
	b _0801BDAA
	.align 2, 0
_0801BD9C: .4byte 0x08B857F8
_0801BDA0: .4byte 0x0202BBF8
_0801BDA4:
	movs r0, #0
	bl SetVisionWithFade
_0801BDAA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl DebugMenu_FogDraw
_0801BDB2:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
