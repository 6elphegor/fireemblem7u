	.include "macro.inc"

	.syntax unified

	thumb_func_start MainUpdate_8055C68
MainUpdate_8055C68: @ 0x08050A38
	push {r4, lr}
	ldr r0, _08050A9C @ =0x08B857F8
	ldr r0, [r0]
	bl RefreshKeySt
	bl ClearSprites
	ldr r4, _08050AA0 @ =0x02026A30
	ldr r0, [r4, #4]
	bl Proc_Run
	bl GetGameLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08050A5E
	ldr r0, [r4, #8]
	bl Proc_Run
_08050A5E:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #0x10]
	bl Proc_Run
	bl AnimUpdateAll
	bl BattleAIS_ExecCommands
	movs r0, #0xd
	bl PutSpriteLayerOam
	ldr r1, _08050AA4 @ =0x0202BBB8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08050AA8 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050A9C: .4byte 0x08B857F8
_08050AA0: .4byte 0x02026A30
_08050AA4: .4byte 0x0202BBB8
_08050AA8: .4byte 0x04000006
