	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseStaffNow
CanUnitUseStaffNow: @ 0x08016428
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _08016468
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016464 @ =0x08BE222C
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016468
	adds r0, r5, #0
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016468
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0801646A
	.align 2, 0
_08016464: .4byte 0x08BE222C
_08016468:
	movs r0, #0
_0801646A:
	pop {r4, r5}
	pop {r1}
	bx r1
