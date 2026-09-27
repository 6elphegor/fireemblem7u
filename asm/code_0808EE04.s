	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenu_OnSubmenuEnd
AtMenu_OnSubmenuEnd: @ 0x0808EE04
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r0, [r5]
	cmp r0, #3
	bne _0808EE20
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
_0808EE20:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #4
	bhi _0808EE68
	lsls r0, r0, #2
	ldr r1, _0808EE34 @ =_0808EE38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808EE34: .4byte _0808EE38
_0808EE38: @ jump table
	.4byte _0808EE60 @ case 0
	.4byte _0808EE60 @ case 1
	.4byte _0808EE56 @ case 2
	.4byte _0808EE4C @ case 3
	.4byte _0808EE60 @ case 4
_0808EE4C:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
	b _0808EE68
_0808EE56:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _0808EE68
_0808EE60:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_0808EE68:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
