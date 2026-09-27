	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreen_InitUnit
StatScreen_InitUnit: @ 0x0808119C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _080811F8 @ =0x0200310C
	ldr r0, [r5, #0xc]
	bl GetUnitPortraitId
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080811BC
	adds r4, #1
_080811BC:
	movs r0, #3
	strb r0, [r5, #1]
	bl ResetText
	bl InitIcons
	bl InitStatScreenText
	ldr r1, _080811FC @ =0x02023CA4
	movs r3, #0x9c
	lsls r3, r3, #3
	movs r0, #0xd
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r4, #0
	bl PutFace80x72
	adds r0, r4, #0
	bl GetFaceInfo
	ldr r0, [r0]
	cmp r0, #0
	beq _08081204
	ldr r0, _08081200 @ =0x083FCBAC
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _0808120E
	.align 2, 0
_080811F8: .4byte 0x0200310C
_080811FC: .4byte 0x02023CA4
_08081200: .4byte 0x083FCBAC
_08081204:
	ldr r0, _0808125C @ =0x083FCBCC
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_0808120E:
	bl EndAllMus
	ldr r4, _08081260 @ =0x0200310C
	ldr r0, [r4, #0xc]
	movs r1, #0x50
	movs r2, #0x8a
	bl StartUiMu
	str r0, [r4, #0x10]
	bl PutStatScreenLeftPanelInfo
	ldrb r0, [r4]
	bl PutStatScreenPage
	ldr r0, _08081264 @ =0x0200323C
	ldr r1, _08081268 @ =0x02022CF8
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _0808126C @ =0x0200373C
	ldr r1, _08081270 @ =0x020234F8
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _08081274 @ =0x02003C3C
	ldr r1, _08081278 @ =0x02023CF8
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808125C: .4byte 0x083FCBCC
_08081260: .4byte 0x0200310C
_08081264: .4byte 0x0200323C
_08081268: .4byte 0x02022CF8
_0808126C: .4byte 0x0200373C
_08081270: .4byte 0x020234F8
_08081274: .4byte 0x02003C3C
_08081278: .4byte 0x02023CF8
