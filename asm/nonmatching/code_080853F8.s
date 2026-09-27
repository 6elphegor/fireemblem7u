	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearUnitBurstMapUi
ClearUnitBurstMapUi: @ 0x080853F8
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #3
	ldrh r1, [r2, #0x3e]
	cmp r1, r0
	bne _0808546A
	adds r7, r2, #0
	adds r7, #0x3d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x3c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08085470 @ =0x02022C60
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x3e
	movs r1, #0
	ldrsb r1, [r6, r1]
	subs r1, #1
	adds r4, r2, #0
	adds r4, #0x3f
	movs r2, #0
	ldrsb r2, [r4, r2]
	subs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08085474 @ =0x02023460
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	subs r1, #1
	movs r2, #0
	ldrsb r2, [r4, r2]
	subs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0
	strb r0, [r6]
	strb r0, [r4]
_0808546A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085470: .4byte 0x02022C60
_08085474: .4byte 0x02023460
