	.include "macro.inc"

	.syntax unified

	thumb_func_start Make6CKOIDOAMM
Make6CKOIDOAMM: @ 0x0801D4D0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0801D518 @ =0x08B93604
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r1, #0
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r2, r7, #0
	adds r2, #0x3a
	movs r0, #4
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x3c
	strb r1, [r0]
	adds r0, r6, #0
	bl Make6CMOVEUNITForUnitBeingRescued
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl SetMuMoveScript
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D518: .4byte 0x08B93604
