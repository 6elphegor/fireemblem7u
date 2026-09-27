	.include "macro.inc"

	.syntax unified

	thumb_func_start BallistaRangeMenu_BallistaUsability
BallistaRangeMenu_BallistaUsability: @ 0x080227D0
	push {lr}
	ldr r0, _080227E4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080227E8
	movs r0, #3
	b _08022804
	.align 2, 0
_080227E4: .4byte 0x03004690
_080227E8:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetBallistaItemAt
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08022802
	movs r0, #2
	b _08022804
_08022802:
	movs r0, #1
_08022804:
	pop {r1}
	bx r1
