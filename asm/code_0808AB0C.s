	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnitListScreenPrepMenu
StartUnitListScreenPrepMenu: @ 0x0808AB0C
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808AB24
	ldr r0, _0808AB20 @ =0x08CC32A4
	movs r1, #3
	bl Proc_Start
	b _0808AB2A
	.align 2, 0
_0808AB20: .4byte 0x08CC32A4
_0808AB24:
	ldr r0, _0808AB48 @ =0x08CC32A4
	bl Proc_StartBlocking
_0808AB2A:
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0808AB4C
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #5
	b _0808AB54
	.align 2, 0
_0808AB48: .4byte 0x08CC32A4
_0808AB4C:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x3a
_0808AB54:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3b
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
