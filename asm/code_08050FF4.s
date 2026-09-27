	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattleEnding_8056228
ekrBattleEnding_8056228: @ 0x08050FF4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, _08051050 @ =0x0203E02E
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	bl AnimClearAll
	movs r0, #1
	bl NewEkrUnitKakudai
	movs r0, #1
	bl NewEkrBaseKaiten
	movs r0, #1
	movs r1, #0xb
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #0xb
	bl NewEkrBaseAppear
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051050: .4byte 0x0203E02E
