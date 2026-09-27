	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTitleClassReelSet
GetTitleClassReelSet: @ 0x0801252C
	push {r4, r5, r6, lr}
	sub sp, #0x48
	bl GetGlobalCompletionCount
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r4, r1, r0
	movs r5, #0
	mov r6, sp
_08012540:
	adds r0, r5, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801256E
	adds r0, r5, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	movs r2, #0xe
	ldrsb r2, [r6, r2]
	ldrh r0, [r6, #0x2e]
	lsls r1, r0, #0x14
	lsrs r1, r1, #0x1b
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	adds r2, r2, r0
	cmp r4, r2
	bge _0801256E
	adds r4, r2, #0
_0801256E:
	adds r5, #1
	cmp r5, #2
	ble _08012540
	cmp r4, #4
	bgt _0801257C
	movs r0, #0
	b _080125C6
_0801257C:
	cmp r4, #0xa
	bgt _08012584
	movs r0, #1
	b _080125C6
_08012584:
	cmp r4, #0x12
	bgt _0801258C
	movs r0, #2
	b _080125C6
_0801258C:
	cmp r4, #0x1a
	bgt _08012594
	movs r0, #3
	b _080125C6
_08012594:
	cmp r4, #0x42
	bgt _0801259C
	movs r0, #4
	b _080125C6
_0801259C:
	cmp r4, #0x47
	bgt _080125A4
	movs r0, #5
	b _080125C6
_080125A4:
	cmp r4, #0x4d
	bgt _080125AC
	movs r0, #6
	b _080125C6
_080125AC:
	cmp r4, #0x55
	bgt _080125B4
	movs r0, #7
	b _080125C6
_080125B4:
	cmp r4, #0x5d
	bgt _080125BC
	movs r0, #8
	b _080125C6
_080125BC:
	cmp r4, #0x85
	ble _080125C4
	movs r0, #0xa
	b _080125C6
_080125C4:
	movs r0, #9
_080125C6:
	add sp, #0x48
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
