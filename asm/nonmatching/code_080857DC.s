	.include "macro.inc"

	.syntax unified

	thumb_func_start MMB_Loop_OnSideChange
MMB_Loop_OnSideChange: @ 0x080857DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _08085878 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808587C @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08085870
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCursorQuadrant
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08085880 @ =0x08CC2B94
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetWindowQuadrant
	adds r5, r0, #0
	ldr r0, _08085884 @ =0x08CC2C00
	bl Proc_Find
	cmp r0, #0
	beq _0808584A
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808584A
	cmp r0, r5
	beq _08085870
_0808584A:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	ldr r0, _08085878 @ =0x0202BBB8
	ldrh r1, [r0, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r4, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl DrawUnitMapUi
	adds r0, r4, #0
	bl Proc_Break
_08085870:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085878: .4byte 0x0202BBB8
_0808587C: .4byte 0x0202E3DC
_08085880: .4byte 0x08CC2B94
_08085884: .4byte 0x08CC2C00
