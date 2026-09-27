	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameFundsRank
GetGameFundsRank: @ 0x080B6550
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl GetPartyTotalGoldValue
	mov r8, r0
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r7, r0, #0
	movs r5, #0
	cmp r6, r7
	bge _080B65A8
	ldr r0, _080B65BC @ =0x08C9A260
	mov sb, r0
_080B6570:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B65A2
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x98
	muls r1, r2, r1
	adds r0, r0, r1
	add r0, sb
	ldr r0, [r0]
	adds r6, r6, r0
_080B65A2:
	adds r5, #1
	cmp r5, r7
	blt _080B6570
_080B65A8:
	movs r0, #0x64
	mov r1, r8
	muls r1, r0, r1
	lsls r0, r6, #2
	adds r2, r0, r6
	lsls r0, r2, #4
	cmp r1, r0
	blo _080B65C0
	movs r0, #4
	b _080B65E4
	.align 2, 0
_080B65BC: .4byte 0x08C9A260
_080B65C0:
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	cmp r1, r0
	blo _080B65CE
	movs r0, #3
	b _080B65E4
_080B65CE:
	lsls r0, r2, #3
	cmp r1, r0
	blo _080B65D8
	movs r0, #2
	b _080B65E4
_080B65D8:
	lsls r0, r2, #2
	cmp r1, r0
	bhs _080B65E2
	movs r0, #0
	b _080B65E4
_080B65E2:
	movs r0, #1
_080B65E4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
