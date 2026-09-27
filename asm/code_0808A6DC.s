	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808A6DC
sub_0808A6DC: @ 0x0808A6DC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0808A700 @ =0x0200CCF0
	movs r1, #0x1f
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	cmp r4, r0
	bge _0808A72E
	ldr r0, _0808A704 @ =0x0200E668
	adds r6, r5, #0
	adds r6, #0x2f
	b _0808A728
	.align 2, 0
_0808A700: .4byte 0x0200CCF0
_0808A704: .4byte 0x0200E668
_0808A708:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808A764 @ =0x0200CCF0
	bl sub_0808AD00
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
	cmp r4, r0
	bge _0808A72E
	ldr r0, _0808A768 @ =0x0200E668
_0808A728:
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A708
_0808A72E:
	ldr r4, _0808A76C @ =0x0200D4F0
	adds r0, r4, #0
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r6, r5, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	adds r0, r4, #0
	bl UnitList_DrawColumnNames
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x3c]
	ldrb r0, [r6]
	adds r2, r5, #0
	adds r2, #0x37
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A764: .4byte 0x0200CCF0
_0808A768: .4byte 0x0200E668
_0808A76C: .4byte 0x0200D4F0
