	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrBattle
NewEkrBattle: @ 0x0804B218
	push {r4, lr}
	bl AnimClearAll
	ldr r4, _0804B260 @ =0x02000064
	ldr r0, _0804B264 @ =0x08B9A9BC
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	ldr r0, _0804B268 @ =InBattleMainRoutine
	bl SetMainFunc
	bl EkrEfxStatusClear
	ldr r0, _0804B26C @ =0x02017724
	movs r1, #0
	str r1, [r0]
	ldr r0, _0804B270 @ =0x02000018
	str r1, [r0]
	ldr r0, _0804B274 @ =0x0200001C
	str r1, [r0]
	ldr r0, _0804B278 @ =0x02000020
	str r1, [r0]
	ldr r0, _0804B27C @ =0x02000024
	str r1, [r0]
	ldr r0, _0804B280 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B258
	bl EkrPlayMainBGM
_0804B258:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B260: .4byte 0x02000064
_0804B264: .4byte 0x08B9A9BC
_0804B268: .4byte InBattleMainRoutine
_0804B26C: .4byte 0x02017724
_0804B270: .4byte 0x02000018
_0804B274: .4byte 0x0200001C
_0804B278: .4byte 0x02000020
_0804B27C: .4byte 0x02000024
_0804B280: .4byte 0x0203E008
