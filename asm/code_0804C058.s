	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleWaitDragonEnding
EkrBattleWaitDragonEnding: @ 0x0804C058
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl CheckEkrDragonEndingDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804C06E
	ldr r0, _0804C074 @ =EkrBattleStartDragonEnding
	str r0, [r4, #0xc]
_0804C06E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C074: .4byte EkrBattleStartDragonEnding
