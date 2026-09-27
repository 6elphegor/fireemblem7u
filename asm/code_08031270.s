	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseVisit
CanUnitUseVisit: @ 0x08031270
	push {r4, r5, r6, r7, lr}
	ldr r0, _08031284 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803128C
	b _080312EE
	.align 2, 0
_08031284: .4byte 0x03004690
_08031288:
	movs r0, #1
	b _080312F0
_0803128C:
	ldr r0, _080312F8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _080312EE
_08031298:
	ldr r0, _080312F8 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _080312E8
	lsls r6, r5, #2
	lsls r7, r5, #0x18
_080312A8:
	ldr r0, _080312FC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080312E2
	ldr r0, _08031300 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #3
	beq _080312D4
	cmp r0, #5
	beq _080312D4
	cmp r0, #0x38
	beq _080312D4
	cmp r0, #0x37
	bne _080312E2
_080312D4:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r7, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0xe
	beq _08031288
_080312E2:
	subs r4, #1
	cmp r4, #0
	bge _080312A8
_080312E8:
	subs r5, #1
	cmp r5, #0
	bge _08031298
_080312EE:
	movs r0, #0
_080312F0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080312F8: .4byte 0x0202E3D8
_080312FC: .4byte 0x0202E3E4
_08031300: .4byte 0x0202E3E0
