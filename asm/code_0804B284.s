	.include "macro.inc"

	.syntax unified

	thumb_func_start InBattleMainRoutine
InBattleMainRoutine: @ 0x0804B284
	push {lr}
	ldr r0, _0804B29C @ =0x08B857F8
	ldr r0, [r0]
	bl RefreshKeySt
	ldr r0, _0804B2A0 @ =0x0200001C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804B2A4
	bl MainUpdateEkrBattle
	b _0804B2B0
	.align 2, 0
_0804B29C: .4byte 0x08B857F8
_0804B2A0: .4byte 0x0200001C
_0804B2A4:
	ldr r0, _0804B2C4 @ =0x02000020
	ldr r0, [r0]
	cmp r0, #1
	bne _0804B2B0
	bl MainUpdateEkrBattle
_0804B2B0:
	ldr r0, _0804B2C8 @ =0x02017724
	ldr r0, [r0]
	cmp r0, #1
	beq _0804B2CC
	cmp r0, #1
	blo _0804B308
	cmp r0, #2
	beq _0804B2DC
	b _0804B308
	.align 2, 0
_0804B2C4: .4byte 0x02000020
_0804B2C8: .4byte 0x02017724
_0804B2CC:
	ldr r0, _0804B2D8 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B308
	b _0804B2E6
	.align 2, 0
_0804B2D8: .4byte 0x0203E008
_0804B2DC:
	ldr r0, _0804B2F4 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B2FC
_0804B2E6:
	ldr r0, _0804B2F8 @ =0x02000064
	ldr r0, [r0]
	bl Proc_End
	bl EkrBattleEndRountine
	b _0804B308
	.align 2, 0
_0804B2F4: .4byte 0x0203E008
_0804B2F8: .4byte 0x02000064
_0804B2FC:
	ldr r0, _0804B31C @ =0x02000064
	ldr r0, [r0]
	bl Proc_End
	bl EndEkrGauge
_0804B308:
	ldr r1, _0804B320 @ =0x0202BBB8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0804B324 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r0}
	bx r0
	.align 2, 0
_0804B31C: .4byte 0x02000064
_0804B320: .4byte 0x0202BBB8
_0804B324: .4byte 0x04000006
