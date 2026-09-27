	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenu_StartSubmenu
AtMenu_StartSubmenu: @ 0x0808ED70
	push {r4, lr}
	adds r4, r0, #0
	bl StartPrepAtSubMenuUI
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0808EDF8
	lsls r0, r0, #2
	ldr r1, _0808ED90 @ =_0808ED94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808ED90: .4byte _0808ED94
_0808ED94: @ jump table
	.4byte _0808EDB8 @ case 0
	.4byte _0808EDB0 @ case 1
	.4byte _0808EDE0 @ case 2
	.4byte _0808EDC8 @ case 3
	.4byte _0808EDA8 @ case 4
_0808EDA8:
	adds r0, r4, #0
	bl StartChapterStatusScreen_FromPrep
	b _0808EDF8
_0808EDB0:
	adds r0, r4, #0
	bl StartPrepItemScreen
	b _0808EDF8
_0808EDB8:
	ldr r0, _0808EDC4 @ =0x08CC4854
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _0808EDF8
	.align 2, 0
_0808EDC4: .4byte 0x08CC4854
_0808EDC8:
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl PrepOptionCountToRealIndexByMask
	adds r1, r4, #0
	bl StartFortuneSubMenu
	b _0808EDF8
_0808EDE0:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	bl SyncUnitDeploymentState
	adds r0, r4, #0
	bl sub_080A4E0C
_0808EDF8:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
