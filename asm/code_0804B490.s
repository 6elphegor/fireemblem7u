	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleStartBattleQuote
EkrBattleStartBattleQuote: @ 0x0804B490
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804B51A
	bl EnableEkrGauge
	bl AsyncEkrDispUP
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804B4F4 @ =0x02022C60
	ldr r2, _0804B4F8 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0804B4FC @ =0x02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	bl EkrGauge_0804CC38
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne _0804B516
	ldr r0, _0804B500 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B508
	ldr r1, _0804B504 @ =0x0203E09C
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl StartBattleTalk
	b _0804B512
	.align 2, 0
_0804B4F4: .4byte 0x02022C60
_0804B4F8: .4byte 0x01000200
_0804B4FC: .4byte 0x02000038
_0804B500: .4byte 0x0203E00C
_0804B504: .4byte 0x0203E09C
_0804B508:
	ldr r1, _0804B524 @ =0x0203E09C
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
	bl StartBattleTalk
_0804B512:
	movs r0, #0
	str r0, [r4, #0x54]
_0804B516:
	ldr r0, _0804B528 @ =EkrBattleWaitBattleQuote
	str r0, [r4, #0xc]
_0804B51A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B524: .4byte 0x0203E09C
_0804B528: .4byte EkrBattleWaitBattleQuote
