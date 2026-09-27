	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxHpBar_MoveCameraOnEnd
EfxHpBar_MoveCameraOnEnd: @ 0x0804D788
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0804D7D0 @ =0x0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804D820
	ldr r0, _0804D7D4 @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804D820
	strh r0, [r5, #0x2c]
	movs r0, #1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x64]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRound2
	cmp r0, #1
	bne _0804D81A
	ldr r0, _0804D7D8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804D81A
	lsls r0, r0, #2
	ldr r1, _0804D7DC @ =_0804D7E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804D7D0: .4byte 0x0201774C
_0804D7D4: .4byte 0x0201772C
_0804D7D8: .4byte 0x0203E02C
_0804D7DC: .4byte _0804D7E0
_0804D7E0: @ jump table
	.4byte _0804D7F4 @ case 0
	.4byte _0804D7F4 @ case 1
	.4byte _0804D808 @ case 2
	.4byte _0804D7F4 @ case 3
	.4byte _0804D7F4 @ case 4
_0804D7F4:
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b _0804D81A
_0804D808:
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0804D81A:
	adds r0, r5, #0
	bl Proc_Break
_0804D820:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
