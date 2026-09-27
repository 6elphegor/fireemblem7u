	.include "macro.inc"

	.syntax unified

	thumb_func_start DarkenPals
DarkenPals: @ 0x08013578
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r7, _08013594 @ =0x02020140
	movs r6, #0
	adds r5, r7, #0
	ldr r4, _08013598 @ =0x02022860
_08013584:
	ldrh r1, [r4]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, r3
	blt _0801359C
	subs r1, r1, r3
	b _080135A0
	.align 2, 0
_08013594: .4byte 0x02020140
_08013598: .4byte 0x02022860
_0801359C:
	ldr r0, _080135B0 @ =0x0000FFE0
	ands r1, r0
_080135A0:
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsls r2, r3, #5
	cmp r0, r2
	blt _080135B4
	subs r1, r1, r2
	b _080135B8
	.align 2, 0
_080135B0: .4byte 0x0000FFE0
_080135B4:
	ldr r0, _080135C8 @ =0x0000FC1F
	ands r1, r0
_080135B8:
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsls r2, r3, #0xa
	cmp r0, r2
	blt _080135CC
	subs r1, r1, r2
	b _080135D0
	.align 2, 0
_080135C8: .4byte 0x0000FC1F
_080135CC:
	ldr r0, _080135F8 @ =0x000003FF
	ands r1, r0
_080135D0:
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	adds r6, #1
	ldr r0, _080135FC @ =0x000001FF
	cmp r6, r0
	ble _08013584
	bl DisablePalSync
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r7, #0
	bl RegisterDataMove
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080135F8: .4byte 0x000003FF
_080135FC: .4byte 0x000001FF
