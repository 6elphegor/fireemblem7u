	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepAtMenu_OnInit
PrepAtMenu_OnInit: @ 0x0808E50C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl PrepSetLatestCharId
	movs r0, #0
	str r0, [r4, #0x40]
	strh r0, [r4, #0x3c]
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E52E
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #5
	b _0808E536
_0808E52E:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x2a
_0808E536:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
