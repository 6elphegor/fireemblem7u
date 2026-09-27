	.include "macro.inc"

	.syntax unified

	thumb_func_start MainUpdateEkrBattle
MainUpdateEkrBattle: @ 0x0804B328
	push {r4, lr}
	bl ClearSprites
	bl UnregisterEfxSoundSeExist
	bl GetGameLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B344
	ldr r0, _0804B394 @ =0x02026A30
	ldr r0, [r0, #8]
	bl Proc_Run
_0804B344:
	ldr r4, _0804B394 @ =0x02026A30
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #4]
	bl Proc_Run
	bl AnimUpdateAll
	bl BattleAIS_ExecCommands
	ldr r0, [r4, #0x10]
	bl Proc_Run
	ldr r1, _0804B398 @ =0x02000020
	movs r0, #0
	str r0, [r1]
	ldr r1, _0804B39C @ =0x0201FAF8
	ldr r0, [r1]
	ldr r1, [r1, #4]
	adds r0, r0, r1
	cmp r0, #2
	beq _0804B386
	ldr r1, _0804B3A0 @ =0x02000018
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0804B386:
	movs r0, #0xd
	bl PutSpriteLayerOam
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B394: .4byte 0x02026A30
_0804B398: .4byte 0x02000020
_0804B39C: .4byte 0x0201FAF8
_0804B3A0: .4byte 0x02000018
