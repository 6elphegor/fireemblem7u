	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrUnitKakudai
NewEkrUnitKakudai: @ 0x080516E8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08051714 @ =0x08B9B214
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x44]
	movs r1, #0
	str r1, [r4, #0x50]
	str r1, [r4, #0x4c]
	ldr r0, _08051718 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt _08051756
	cmp r0, #3
	ble _0805171C
	cmp r0, #4
	beq _08051744
	b _08051756
	.align 2, 0
_08051714: .4byte 0x08B9B214
_08051718: .4byte 0x0203E02C
_0805171C:
	ldr r0, _08051740 @ =0x0203E010
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #1
	bne _08051730
	bl CheckInEkrDragon
	cmp r0, #0
	bne _08051730
	str r5, [r4, #0x4c]
_08051730:
	ldr r0, _08051740 @ =0x0203E010
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne _08051756
	str r0, [r4, #0x50]
	b _08051756
	.align 2, 0
_08051740: .4byte 0x0203E010
_08051744:
	cmp r5, #0
	bne _08051750
	str r1, [r4, #0x4c]
	movs r0, #1
	str r0, [r4, #0x50]
	b _08051756
_08051750:
	movs r0, #1
	str r0, [r4, #0x4c]
	str r1, [r4, #0x50]
_08051756:
	pop {r4, r5}
	pop {r0}
	bx r0
