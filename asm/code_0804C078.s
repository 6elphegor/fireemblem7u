	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattlePostDragonEnding
EkrBattlePostDragonEnding: @ 0x0804C078
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804C0A4 @ =0x02017724
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804C0A8 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804C09A
	movs r0, #2
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl EkrRestoreBGM
_0804C09A:
	ldr r0, _0804C0AC @ =EkrBattlePostEndDelay
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C0A4: .4byte 0x02017724
_0804C0A8: .4byte 0x0203E008
_0804C0AC: .4byte EkrBattlePostEndDelay
