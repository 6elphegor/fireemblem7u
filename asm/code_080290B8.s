	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateRoundHits
BattleGenerateRoundHits: @ 0x080290B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _080290D0
	b _08029104
_080290CC:
	movs r0, #1
	b _08029106
_080290D0:
	ldr r0, _08029110 @ =0x0203A50C
	ldr r0, [r0]
	ldrh r7, [r0]
	adds r0, r6, #0
	bl GetBattleUnitHitCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _08029104
_080290E4:
	ldr r0, _08029110 @ =0x0203A50C
	ldr r1, [r0]
	adds r0, r7, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerateHit
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080290CC
	adds r4, #1
	cmp r4, r5
	blt _080290E4
_08029104:
	movs r0, #0
_08029106:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08029110: .4byte 0x0203A50C
