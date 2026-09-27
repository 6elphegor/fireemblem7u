	.include "macro.inc"

	.syntax unified

	thumb_func_start OnMain
OnMain: @ 0x0801529C
	push {r4, lr}
	ldr r0, _080152F8 @ =0x08B857F8
	ldr r0, [r0]
	bl RefreshKeySt
	bl ClearSprites
	ldr r4, _080152FC @ =0x02026A30
	ldr r0, [r4, #4]
	bl Proc_Run
	bl GetGameLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080152C2
	ldr r0, [r4, #8]
	bl Proc_Run
_080152C2:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #0x10]
	bl Proc_Run
	movs r0, #0xd
	bl PutSpriteLayerOam
	ldr r1, _08015300 @ =0x0202BBB8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08015304 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080152F8: .4byte 0x08B857F8
_080152FC: .4byte 0x02026A30
_08015300: .4byte 0x0202BBB8
_08015304: .4byte 0x04000006
