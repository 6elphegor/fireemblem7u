	.include "macro.inc"

	.syntax unified

	thumb_func_start TerrainDisplay_Loop_OnSideChange
TerrainDisplay_Loop_OnSideChange: @ 0x0808566C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCursorQuadrant
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08085700 @ =0x08CC2B94
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetWindowQuadrant
	adds r6, r0, #0
	ldr r0, _08085704 @ =0x08CC2C60
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080856BA
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080856BA
	cmp r0, r6
	beq _080856F8
_080856BA:
	ldr r0, _08085708 @ =0x08CC2D38
	bl Proc_Find
	cmp r4, #0
	beq _080856D4
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080856D4
	cmp r0, r6
	beq _080856F8
_080856D4:
	adds r0, r5, #0
	adds r0, #0x57
	strb r6, [r0]
	adds r0, r5, #0
	bl DrawTerrainDisplayWindow
	ldr r0, _0808570C @ =0x0202BBB8
	ldrh r1, [r0, #0x14]
	adds r2, r5, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r5, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080856F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085700: .4byte 0x08CC2B94
_08085704: .4byte 0x08CC2C60
_08085708: .4byte 0x08CC2D38
_0808570C: .4byte 0x0202BBB8
