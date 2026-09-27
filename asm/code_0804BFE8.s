	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleStartDragonEnding
EkrBattleStartDragonEnding: @ 0x0804BFE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _0804BFFC
	ldr r0, _0804BFF8 @ =EkrBattlePostDragonEnding
	str r0, [r4, #0xc]
	b _0804C04A
	.align 2, 0
_0804BFF8: .4byte EkrBattlePostDragonEnding
_0804BFFC:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0804C028
	ldr r0, _0804C020 @ =0x02000000
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804C01A
	ldr r0, [r4, #0x5c]
	bl SetEkrDragonExit
	ldr r0, _0804C024 @ =EkrBattleWaitDragonEnding
	str r0, [r4, #0xc]
_0804C01A:
	movs r0, #1
	b _0804C042
	.align 2, 0
_0804C020: .4byte 0x02000000
_0804C024: .4byte EkrBattleWaitDragonEnding
_0804C028:
	ldr r0, _0804C050 @ =0x02000000
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804C040
	ldr r0, [r4, #0x5c]
	bl SetEkrDragonExit
	ldr r0, _0804C054 @ =EkrBattleWaitDragonEnding
	str r0, [r4, #0xc]
_0804C040:
	movs r0, #0
_0804C042:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
_0804C04A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C050: .4byte 0x02000000
_0804C054: .4byte EkrBattleWaitDragonEnding
