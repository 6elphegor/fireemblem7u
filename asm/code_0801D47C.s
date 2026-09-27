	.include "macro.inc"

	.syntax unified

	thumb_func_start Make6CKOIDO
Make6CKOIDO: @ 0x0801D47C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r1, r3, #0
	ldr r0, _0801D4CC @ =0x08B935EC
	bl Proc_StartBlocking
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3a
	movs r0, #4
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, r8
	strb r1, [r0]
	adds r0, r6, #0
	bl Make6CMOVEUNITForUnitBeingRescued
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl SetMuMoveScript
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D4CC: .4byte 0x08B935EC
