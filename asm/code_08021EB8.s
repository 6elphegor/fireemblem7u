	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitActionMenu_Seize_Available
UnitActionMenu_Seize_Available: @ 0x08021EB8
	push {r4, lr}
	ldr r4, _08021ED8 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08021ED4
	adds r0, r2, #0
	bl sub_08034884
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08021EDC
_08021ED4:
	movs r0, #3
	b _08021EF6
	.align 2, 0
_08021ED8: .4byte 0x03004690
_08021EDC:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	movs r1, #3
	cmp r0, #0xf
	bne _08021EF4
	movs r1, #1
_08021EF4:
	adds r0, r1, #0
_08021EF6:
	pop {r4}
	pop {r1}
	bx r1
