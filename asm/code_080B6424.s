	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameExpRank
GetGameExpRank: @ 0x080B6424
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl PidStatsGetTotalExpGain
	mov sb, r0
	movs r1, #0
	add r0, sp, #0xc
_080B643A:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _080B643A
	bl GetNextChapterStatsSlot
	mov r8, r0
	movs r5, #0
	cmp r5, r8
	bge _080B64F2
	ldr r6, _080B6518 @ =0x08C9A200
	movs r7, #0x98
	movs r0, #0x3e
	adds r0, r0, r6
	mov sl, r0
_080B6458:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B64EC
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x56
	adds r0, r0, r1
	ldr r1, [sp]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x4e
	adds r0, r0, r1
	ldr r1, [sp, #4]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #4]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x46
	adds r0, r0, r1
	ldr r1, [sp, #8]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #8]
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	add r0, sl
	ldr r1, [sp, #0xc]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #0xc]
_080B64EC:
	adds r5, #1
	cmp r5, r8
	blt _080B6458
_080B64F2:
	movs r5, #0
	mov r1, sp
_080B64F6:
	ldr r0, [r1]
	cmp sb, r0
	blt _080B6504
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	ble _080B64F6
_080B6504:
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B6518: .4byte 0x08C9A200
